#include "xcl2.hpp"
#include <vector>

#ifndef KERNEL_DIST_H
#define KERNEL_DIST_H

struct __attribute__((packed)) dist_data {
	uint16_t zeros;
	uint32_t sum;
	uint16_t line : 2;
	uint16_t pivot: 7;
	// uint16_t bank : 0;
	uint16_t reserved : 7;
};

class kernel_dist
{
public:
	kernel_dist (cl::Program & program, cl::Context & context, cl::CommandQueue & q,
	             std::vector<uint8_t, aligned_allocator<int>> & full_sketches,
	             std::vector<uint8_t, aligned_allocator<int>> & order_sketches,
	             size_t sketches_num);
	~kernel_dist ();
	dist_data * compute (std::vector<uint32_t> read_offset, uint32_t pivot_offset,
	                     uint32_t read_len, uint32_t pivot_len, uint32_t write_len);
private:
	uint max_pivot;
	uint precision;
	uint sketch_size;
	uint sketch_bytes;

	cl::Event ev_kernel;
	cl::Event ev_mem;
	std::vector<cl::Event> vec_ev;

	cl::CommandQueue q;
	cl::Context context;
	cl::Kernel kernel;

	std::vector <cl_mem_ext_ptr_t> buffer_ext;
	std::vector <cl::Buffer> buffers;
	cl::Buffer buffer_piv;
	cl::Buffer buffer_w;

	std::vector<int, aligned_allocator<int> > hw_results;
};

#endif // KERNEL_DIST_H
