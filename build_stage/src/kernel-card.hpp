#include "xcl2.hpp"
#include <vector>

#ifndef KERNEL_CARD_H
#define KERNEL_CARD_H

struct __attribute__((packed)) card_data {
	uint16_t thread;
	uint16_t zeros;
	uint32_t sum;
	// uint64_t ptr;
};

class kernel_card
{
public:
	kernel_card (cl::Program & program, cl::Context & context, cl::CommandQueue & q, size_t files);
	~kernel_card ();
	card_data * result ();

private:
	cl::CommandQueue q;
	cl::Context context;
	cl::Kernel kernel;
	cl::Buffer buffer_w;
	cl::Event ev_kernel;

	int32_t files_num;
	std::vector<int, aligned_allocator<int> > hw_results;
};

#endif // KERNEL_CARD_H
