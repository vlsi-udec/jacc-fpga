#include <iostream>
#include <chrono>
#include <list>
#include <queue>
#include <unordered_map>
#include <fstream>
#include <cmath>
#include <cstring>
#include <unistd.h>
#include <omp.h>
#include <mutex>
#include <condition_variable>

#include "MpScQueue.h"
#include "fastq-read.hpp"
#include "kernel-hll.hpp"
#include "kernel-card.hpp"

#include "common.hpp"
#include "common_cl.hpp"
#include "card_est.hpp"

const size_t block_chunk = 1024; // Reads in one chunk
const uint threads = 8;
const uint read_size = 1UL << 14;
const uint read_bytes = read_size << 2;
const size_t chunk_size = block_chunk * read_size * threads;
const size_t chunk_bytes = chunk_size * sizeof (int32_t);
const int word_bytes = 64;
const size_t bytes_per_thread = word_bytes / threads;

bool run = false;
bool stop = false;
bool stop_dummy = false;
size_t current_ifile = 0;
std::mutex files_mutex;
std::vector<std::string> files_list_thread[threads];

std::mutex queue_mutex[threads];
std::atomic<size_t> queue_cnt[threads];
std::condition_variable queue_cv[threads];

struct q_data {
	int index;
	uint8_t * data;
};

void consumer (MpScQueue <q_data> & queue, kernel_hll & krnl)
{
	q_data o_data;
	size_t d = 0;
	size_t time_kernel = 0;

	uint8_t * dev_chunk = krnl.get_ptr ();
	std::queue<q_data> d_queue[threads];
	size_t blocks [threads] = {};
	bool read_block [threads];
	bool end_block [threads];
	bool t_lock [threads];

	size_t block_offset = 0;
	bool first_file = true;
	bool end_packing = false;
	size_t chunks_send = 0;

	memset (dev_chunk, 0, chunk_bytes);

	auto l_begin = std::chrono::steady_clock::now ();

	for (size_t i = 0; i < threads; ++i)
	{
		read_block[i] = true;
		end_block[i] = false;
		t_lock[i] = true;
		queue_cnt[i] = 0;
	}

	std::atomic_thread_fence (std::memory_order_seq_cst);
	run = true;

	while (!end_packing)
	{
		bool wait_read = false;
		bool iend_packing = true;

		if (queue.dequeue (o_data))
		{
			blocks[o_data.index] ++;
			d_queue[o_data.index].push (o_data);
			d++;
		}

		for (size_t i = 0; i < threads; ++i)
		{
			if (d_queue[i].size () < 1) queue_cv[i].notify_one ();
		}

		for (size_t i = 0; i < threads; ++i)
		{
			if (read_block[i] && d_queue[i].size () > 0)
			{
				if (queue_cnt[i] > 0) queue_cnt[i]--;

				uint8_t * block_ptr = d_queue[i].front ().data;

				// Copy to buffer
				size_t a_offset = block_offset + i * bytes_per_thread;
				for (size_t j = 0; j < read_bytes / bytes_per_thread; ++j)
				{
					size_t c_offset = j * word_bytes; // chunk offset
					size_t o_offset = j * bytes_per_thread;

					// Pack 512-bits data
					size_t offset = a_offset + c_offset;
					memcpy (dev_chunk + offset, block_ptr + o_offset, bytes_per_thread);
				}

				// End of thread operation
				if (block_ptr[0] == 0 && block_ptr[bytes_per_thread] == 0x19)
				{
					std::cout << "end of thread " << i << "\n";
					end_block[i] = true;
				}

				free (d_queue[i].front ().data);
				d_queue[i].pop ();
				read_block[i] = false;
			}
		}

		for (size_t i = 0; i < threads; ++i)
		{
			iend_packing &= end_block[i];
			wait_read |= read_block[i];
		}

		end_packing = iend_packing;

		// One block for each thread in memory
		if (!wait_read)
		{
			block_offset = block_offset + (chunk_bytes / block_chunk);

			// Fall flags
			for (size_t i = 0; i < threads; ++i) read_block[i] = !end_block[i];

			// Sent chunk to FPGA
			if (block_offset == chunk_bytes)
			{
				block_offset = 0;
				krnl.insert_chunk ((int *) dev_chunk, first_file);
				dev_chunk = krnl.get_ptr ();

				memset (dev_chunk, 0, chunk_bytes);
				chunks_send++;

				first_file = false;
			}
		}
	}

	// Send tail to fpga
	if (block_offset > 0)
	{
		krnl.insert_chunk ((int *) dev_chunk, first_file);
		block_offset = 0;
		chunks_send++;
	}
}

void worker_func (MpScQueue <q_data> & queue, std::vector<std::string> & files, uint thread)
{
	size_t files_num = files.size ();
	bool first = true;

	q_data i_data;
	i_data.index = thread;

	while (run == false)
	{
		std::atomic_thread_fence (std::memory_order_seq_cst);
		sched_yield ();
	}

	size_t iterations = 0;
	size_t c_ifile;
	files_mutex.lock ();
	c_ifile = current_ifile++;
	files_mutex.unlock ();

	while (c_ifile < files_num)
	{
		std::string filename = files[c_ifile];
		files_list_thread[thread].push_back (filename);

		fastq_read fq (filename);
		int a;

		// Mark on first chunk
		if (!first)
		{
			i_data.data = (uint8_t *) malloc (read_bytes);
			memset (i_data.data, 0x19, bytes_per_thread);
			memset (i_data.data + bytes_per_thread, 0, read_bytes - bytes_per_thread);
			a = fq.read (i_data.data + bytes_per_thread, read_bytes - bytes_per_thread);

			queue.enqueue (i_data);
		}

		while (1)
		{
			i_data.data = (uint8_t *) malloc (read_bytes);
			if ((a = fq.read (i_data.data, read_bytes)) <= 0)
			{
				free (i_data.data);
				break;
			}

			if (a < int (read_bytes))
			{
				memset (i_data.data + a, 0, read_bytes - a);
			}

			queue.enqueue (i_data);

			queue_cnt[thread]++;
			if (queue_cnt[thread] > 10000)
			{
				std::unique_lock<std::mutex> lk (queue_mutex[thread]);
				queue_cv[thread].wait (lk);
			}
		}

		files_mutex.lock ();
		c_ifile = current_ifile++;
		files_mutex.unlock ();

		first = false;
		iterations++;
	}

	if (iterations > 0)
	{
		i_data.data = (uint8_t *) malloc (read_bytes);
		memset (i_data.data, 0, read_bytes);
		memset (i_data.data + bytes_per_thread, 0x19, bytes_per_thread);

		queue.enqueue (i_data);
	}
}

int main(int argc, char **argv)
{
	std::map<std::string, size_t> cardinalities;
	std::vector<std::string> files;
	std::string list_file = "";
	bool validation = false;

	cl::Program program;
	cl::Context context;
	cl::CommandQueue q, q2;

	std::string binary_file;
	std::string binary_file_dist;
	uint param_pivots;
	float threshold = 0.9;

	char c;

	while ((c = getopt(argc, argv, "b:l:c:p:vt:")) != -1)
	{
		switch (c) {
			case 'b':
				binary_file = std::string (optarg);
			break;
			case 'l':
				list_file = std::string (optarg);
			break;
			case 'c':
				binary_file_dist = std::string (optarg);
			break;
			case 'p':
				param_pivots = std::stoi (optarg);
			break;
			case 't':
				threshold = std::stof (optarg);
			break;
			case 'v':
				validation = true;
			break;
			default:
			break;
		}
	}

	load_sort_files (files, list_file);

	setup_device (program, context, q, q2, binary_file);

	kernel_hll krnl_hll (program, context, q, chunk_size, files.size ());
	kernel_card krnl_card (program, context, q2, files.size ());

	std::cout << "Filling sketches\n";
	std::cout << "threads " << threads << "\n";
	std::cout << "chunk size " << (chunk_bytes >> 10) << " KBytes\n";

	MpScQueue <q_data> queue (100);
	std::unordered_map <uint, std::thread> t_pool;
	auto begin = std::chrono::steady_clock::now ();

	auto master = std::thread (consumer, std::ref (queue), std::ref (krnl_hll));

	for (uint i_thread = 0; i_thread < threads; ++i_thread)
	{
		t_pool[i_thread] = std::thread (worker_func, std::ref (queue),
		                                std::ref (files), i_thread);
	}

	std::atomic_thread_fence (std::memory_order_seq_cst);
	run = true;

	for (auto it = t_pool.begin (); it != t_pool.end (); ++it)
	{
		it->second.join ();
	}
	std::cout << "join master\n";

	std::atomic_thread_fence (std::memory_order_seq_cst);
	stop = true;
	master.join ();

	auto end = std::chrono::steady_clock::now ();
	auto total_time = std::chrono::duration_cast<std::chrono::microseconds>(end - begin).count();
	std::cout << "Reading HLL output " << (total_time / 1000) << "[ms]\n";
	auto b_card = end;

	auto card_ptr = krnl_card.result ();

	end = std::chrono::steady_clock::now ();
	total_time = std::chrono::duration_cast<std::chrono::microseconds>(end - begin).count();
	auto stage_time = std::chrono::duration_cast<std::chrono::microseconds>(end - b_card).count();

	std::cout << "Reading cardinalities " << (stage_time / 1000) << "[ms] ";
	std::cout << "total " << (total_time / 1000) << "[ms]\n";

	auto b_join = end;

	// Join sketches
	std::vector<uint8_t, aligned_allocator<int>> full_sketches;
	uint sketch_bytes = krnl_hll.get_sketch_bytes ();
	full_sketches.resize (files.size () * sketch_bytes, 0);
	krnl_hll.read_sketches ();

	size_t offset = 0;

	// Join sketches
	for (uint i_thread = 0; i_thread < threads; ++i_thread)
	{
		uint8_t * ptr = krnl_hll.get_buffer (i_thread);

		size_t files_in_thread = files_list_thread[i_thread].size ();
		memcpy (full_sketches.data () + offset, ptr, files_in_thread * sketch_bytes);
		offset = offset + files_in_thread * sketch_bytes;
	}

	// Order cardinalities
	std::map<std::string, std::pair <uint32_t, uint16_t> > hw_harmonic;
	size_t f_pos [threads];
	memset (f_pos, 0, sizeof (f_pos));

	for (size_t i_files = 0; i_files < files.size (); ++i_files)
	{
		size_t t = card_ptr[i_files].thread;
		std::string fn = files_list_thread[t][f_pos[t]++];

		uint32_t s = card_ptr[i_files].sum;
		uint16_t z = card_ptr[i_files].zeros;

		hw_harmonic[fn] = std::make_pair (s, z);
	}

	// Join file list per thread
	std::vector<std::string> process_file_list;
	for (uint i_thread = 0; i_thread < threads; ++i_thread)
	{
		process_file_list.reserve (files_list_thread[i_thread].size () +
		                           process_file_list.size ());
		process_file_list.insert (process_file_list.end (),
		                          files_list_thread[i_thread].begin (),
		                          files_list_thread[i_thread].end ());
	}

	end = std::chrono::steady_clock::now ();
	total_time = std::chrono::duration_cast<std::chrono::microseconds>(end - begin).count();
	auto join_time = std::chrono::duration_cast<std::chrono::microseconds>(end - b_join).count();

	std::cout << "Join output " << (join_time / 1000) << "[ms] ";
	std::cout << "total " << (total_time / 1000) << "[ms]\n";

	// Clear non used memory
	for (uint i_thread = 0; i_thread < threads; ++i_thread)
	{
		files_list_thread[i_thread].clear ();
	}

	// Reorder sketch memory
	auto b_reorder = std::chrono::steady_clock::now ();

	std::vector<uint8_t, aligned_allocator<int>> order_sketches;
	size_t c_sketches = 16 * std::ceil (files.size () / float (16));
	order_sketches.resize (c_sketches * sketch_bytes, 0);

	for (uint i_file = 0; i_file < files.size (); ++i_file)
	{
		size_t w_if = 4 * (i_file % 4) + (4 * sketch_bytes) * (i_file / 4);
		size_t r_if = i_file * sketch_bytes;

		for (uint i = 0; i < sketch_bytes / 16; ++i)
		{
			size_t w_i = i * 64 + w_if; // One 512-bits word
			size_t r_i = i * 16 + r_if;

			memcpy (&order_sketches [w_i], &full_sketches [r_i], 16);
		}
	}

	end = std::chrono::steady_clock::now ();
	total_time = std::chrono::duration_cast<std::chrono::microseconds>(end - begin).count();
	auto reorder_time = std::chrono::duration_cast<std::chrono::microseconds>(end - b_reorder).count();

	std::cout << "Reorder output " << (reorder_time / 1000) << "[ms] ";
	std::cout << "total " << (total_time / 1000) << "[ms]\n";

	auto b_card_comp = std::chrono::steady_clock::now ();
	// Compute cardinalities
	std::vector<std::pair<std::string, ssize_t>> hw_cardinality;
	for (auto it = hw_harmonic.begin (); it != hw_harmonic.end (); ++it)
	{
		hw_cardinality.push_back (std::make_pair (it->first, hll_estimate<14> (it->second.first, it->second.second)));
	}

	std::sort (hw_cardinality.begin (), hw_cardinality.end (),
	           [](const std::pair<std::string, ssize_t> &x,
	              const std::pair<std::string, ssize_t> &y)
	{
		return x.second < y.second;
	});

	auto card_end = std::chrono::steady_clock::now ();
	auto card_comp_time = std::chrono::duration_cast<std::chrono::microseconds>(card_end - b_card_comp).count();

	std::cout << "Card computation and sort " << (card_comp_time / 1000) << "[ms]\n";

	/***************************************************************/
	/* Store sketches and cardinalities
	/***************************************************************/

	std::ofstream out_file_full ("test_vec_full.bin", std::ios::out | std::ios::binary);
	size_t full_sketches_size = full_sketches.size();
 	out_file_full.write ((char*) &full_sketches_size, sizeof (full_sketches_size));
	out_file_full.write ((char*) full_sketches.data (), full_sketches.size() * sizeof(uint8_t));
	out_file_full.close ();

	std::ofstream out_file_order ("test_vec_order.bin", std::ios::out | std::ios::binary);
	size_t order_sketches_size = order_sketches.size();
 	out_file_order.write ((char*) &order_sketches_size, sizeof (order_sketches_size));
	out_file_order.write ((char*) order_sketches.data (), order_sketches.size() * sizeof(uint8_t));
	out_file_order.close ();

	std::ofstream out_file_card ("test_card.txt");
	for (auto it = hw_cardinality.begin (); it != hw_cardinality.end (); ++it)
	{
		out_file_card << it->first << " " << it->second << "\n";
	}
	out_file_card.close();

	auto postp_end = std::chrono::steady_clock::now ();
	auto postp_time = std::chrono::duration_cast<std::chrono::microseconds>(postp_end - card_end).count();

	std::cout << "Post process " << (postp_time / 1000) << "[ms]\n";

	return 0;
}
