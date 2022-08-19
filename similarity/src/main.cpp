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

#include "kernel-dist.hpp"

#include "common.hpp"
#include "common_cl.hpp"
#include "card_est.hpp"

struct __attribute__((packed)) dist_result {
	float dist;
};

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

	load_file_list (files, list_file);
	setup_device (program, context, q, q2, binary_file);

	std::vector<uint8_t, aligned_allocator<int>> full_sketches;
	std::vector<uint8_t, aligned_allocator<int>> order_sketches;

	std::ifstream in_file_full ("test_vec_full.bin", std::ios::in | std::ios::binary);
	size_t full_sketches_size;
	in_file_full.read ((char*) &full_sketches_size, sizeof (full_sketches_size));
	full_sketches.resize (full_sketches_size, 0);
	in_file_full.read ((char*) full_sketches.data (), full_sketches_size * sizeof(uint8_t));
	in_file_full.close ();

	std::ifstream in_file_order ("test_vec_order.bin", std::ios::in | std::ios::binary);
	size_t order_sketches_size = full_sketches_size;
	in_file_order.read ((char*) &order_sketches_size, sizeof (order_sketches_size));
	order_sketches.resize (order_sketches_size, 0);
	in_file_order.read ((char*) order_sketches.data (), order_sketches_size * sizeof(uint8_t));
	in_file_order.close ();

	std::vector<std::pair<std::string, ssize_t>> hw_cardinality;

	std::ifstream in_file_card ("test_card.txt");

	for (size_t i = 0; i < files.size (); ++i)
	{
		std::string filename;
		ssize_t card;
		in_file_card >> filename >> card;
		hw_cardinality.push_back (std::make_pair (filename, card));
	}
	in_file_card.close();

	std::cout << full_sketches.size () << "\n";
	std::cout << order_sketches.size () << "\n";
	std::cout << hw_cardinality.size () << "\n";

	uint sketch_bytes = (1 << 14) / 2;

	omp_set_num_threads (8);

	// Call kernel dist
	kernel_dist krnl_dist (program, context, q, full_sketches, order_sketches, files.size ());

	std::vector<uint32_t> read_offset (4);

	uint32_t pivot_max = param_pivots; // In sketches

	uint32_t read_len = files.size () / 4; // In sketches on each channel
	uint32_t write_len = 0;

	std::list<double> hw_card_dist;
	std::vector<std::string> out_str;
	for (size_t j = 0; j < pivot_max; ++j) out_str.push_back ("");

	size_t p_all = pivot_max * (pivot_max - 1)/2;
	std::vector<dist_result> dist_pp (p_all);

	size_t p_all_2 = ((4 * ((files.size () + 3) / 4)) * pivot_max + 7);
	std::vector<double> card_p (p_all_2);
	std::vector<dist_result> dist_p (p_all_2);

	size_t i = 0;
	size_t dist_dummy = 0;
	std::cout << "iterations " << files.size () / pivot_max << "\n";

	std::ofstream out_file_sim ("test_similarity.bin", std::ios::out | std::ios::binary);

	size_t distances_num = 0;
	for (size_t i = 0; i < files.size () / pivot_max - 1; ++i)
	{
		// define sketches to compare
		size_t k_i = (i+1) * pivot_max;
		size_t k = 0;
		double fraction;

		if (threshold > 0)
		{
			for (size_t i_k = k_i; i_k < k_i + pivot_max - 1; ++i_k)
			{
				size_t j_k = i_k + 1;
				for (; j_k < files.size (); ++j_k)
				{
					fraction = hw_cardinality.at (i_k).second / double (hw_cardinality.at (j_k).second);
					if (fraction < threshold) break;
				}

				if (j_k > k) k = j_k;
			}
		}
		else
		{
			k = files.size ();
		}

		k = k - k_i;

		uint32_t pivot_offset = i * pivot_max * sketch_bytes;
		uint32_t pivot_len = pivot_max;
		uint32_t read_len = 4 * ((k + 3) / 4);
		uint32_t write_len_p = 0;
		uint32_t write_len_r = 0;
		for (uint p = 0; p < pivot_len; ++p) write_len_p += (p + 1) / 2;
		write_len_r += (read_len * pivot_max + 7) / 8;

		uint32_t quarter = (read_len + 0) / 1;

		uint32_t q_offset = (i + 1) * pivot_max * sketch_bytes;
		read_offset[0] = 0 * quarter * sketch_bytes + q_offset;
		uint32_t quarter_read = (quarter + 3) / 4;

		dist_data * dist = krnl_dist.compute (read_offset, pivot_offset, quarter_read, pivot_max, write_len_p + write_len_r);
		uint64_t * dist_data_u64 = (uint64_t *) dist;

		size_t idx_pivot = 0;
		int32_t piv_in = 0;

		for (uint p = 1; p < pivot_len; ++p)
		{
			for (uint j = 0; j < p; ++j)
			{
				size_t p_current = p * (p - 1) / 2 + j;

				if (dist[idx_pivot].pivot == 0) piv_in += 1;

				size_t u_card = hll_estimate<14> (dist[idx_pivot].sum, dist[idx_pivot].zeros);

				size_t a_idx = i * pivot_max + dist[idx_pivot].pivot;
				size_t b_idx = i * pivot_max + piv_in;

				if (a_idx >= files.size ()) a_idx = 1;
				if (b_idx >= files.size ()) b_idx = 1;

				size_t i_card = hw_cardinality.at (a_idx).second + hw_cardinality.at (b_idx).second - u_card;
				float dist_r = jaccard_index (u_card, i_card);
				dist_pp[p_current] = {dist_r};

				idx_pivot += 4;
			}

			if (p % 2) idx_pivot += 4;
		}

		#pragma omp parallel for
		for (size_t j = 8 * write_len_p; j < 8 * (write_len_r + write_len_p); ++j)
		{
			size_t v_idx = j - 8 * write_len_p;
			size_t u_card = hll_estimate<14> (dist[j].sum, dist[j].zeros);
			card_p[v_idx] = u_card;
		}

		out_file_sim.write ((char*) dist_pp.data (), p_all * sizeof (dist_result));

		#pragma omp parallel for
		for (size_t j = 8 * write_len_p; j < 8 * (write_len_r + write_len_p); ++j)
		{
			size_t v_idx = j - 8 * write_len_p;

			size_t a_idx = i * pivot_max + dist[j].pivot;
			size_t b_idx = (i + 1) * pivot_max + dist[j].line;

			if (a_idx >= files.size ()) a_idx = 1;
			if (b_idx >= files.size ()) b_idx = 1;

			size_t u_card = card_p[v_idx];

			size_t i_card = hw_cardinality.at (a_idx).second + hw_cardinality.at (b_idx).second - u_card;
			float dist_r = jaccard_index (u_card, i_card);
			dist_p[v_idx] = {dist_r};
		}

		distances_num += p_all;
		distances_num += 8 * write_len_r;
		out_file_sim.write ((char*) dist_p.data (), 8 * write_len_r * sizeof (dist_result));
	}

	out_file_sim.close();
	return 0;
}

