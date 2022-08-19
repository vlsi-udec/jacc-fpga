#include "xcl2.hpp"
#include <vector>

#ifndef KERNEL_HLL_H
#define KERNEL_HLL_H

class kernel_hll
{
public:
	kernel_hll (cl::Program & program, cl::Context & context, cl::CommandQueue & q,
                 int32_t chunk_size, size_t files_num);
	~kernel_hll ();
	void insert_chunk (int * data, bool first_file);
	void read_sketches ();
	uint8_t * get_buffer (int thread);
	uint get_sketch_bytes ();
	uint8_t * get_ptr ();

private:
	cl::CommandQueue q;
	cl::Context context;
	cl::Kernel kernel;

	uint precision;
	uint sketch_size;
	uint sketch_bytes;
	uint bus_bytes;
	int32_t chunk_size;
	bool first_chunk;

	size_t n_bases;
	int32_t remaining_data;
	size_t copy_bytes;
	bool buffer_select;
	int * current_chunk;

	cl_mem_ext_ptr_t chunk_ext[2];

	std::vector<int, aligned_allocator<int>> chunk_b1;
	std::vector<int, aligned_allocator<int>> chunk_b2;

	std::vector<int, aligned_allocator<int>> sketch_t0;
	std::vector<int, aligned_allocator<int>> sketch_t1;
	std::vector<int, aligned_allocator<int>> sketch_t2;
	std::vector<int, aligned_allocator<int>> sketch_t3;
	std::vector<int, aligned_allocator<int>> sketch_t4;
	std::vector<int, aligned_allocator<int>> sketch_t5;
	std::vector<int, aligned_allocator<int>> sketch_t6;
	std::vector<int, aligned_allocator<int>> sketch_t7;

	cl::Buffer buffer_r1;
	cl::Buffer buffer_r2;
	cl::Buffer buffer_w0;
	cl::Buffer buffer_w1;
	cl::Buffer buffer_w2;
	cl::Buffer buffer_w3;
	cl::Buffer buffer_w4;
	cl::Buffer buffer_w5;
	cl::Buffer buffer_w6;
	cl::Buffer buffer_w7;

	std::vector<cl::Event> vec_ev_mem_c1;
	std::vector<cl::Event> vec_ev_mem_c2;
	std::vector<cl::Event> vec_ev_krnl_c1;
	std::vector<cl::Event> vec_ev_krnl_c2;

	cl::Event ev_kernel;
	cl::Event ev_memory;
};

#endif // KERNEL_HLL_H
