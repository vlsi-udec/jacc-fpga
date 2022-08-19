#include "xcl2.hpp"
#include <vector>
#include <chrono>
#include <thread>
#include <cmath>
#include <memory>
#include "kernel-dist.hpp"

kernel_dist::kernel_dist (cl::Program & program, cl::Context & context, cl::CommandQueue & q,
                          std::vector<uint8_t, aligned_allocator<int>> & full_sketches,
                          std::vector<uint8_t, aligned_allocator<int>> & order_sketches,
                          size_t files_num)
{
	cl_int err;

	size_t sketches_num;

	this->max_pivot = 96;
	this->precision = 14;
	this->sketch_size = 1 << precision;
	this->sketch_bytes = this->sketch_size / 2;
	this->context = context;
	this->q = q;
	this->kernel = cl::Kernel (program, "krnl_dist_rtl", &err);

	sketches_num = files_num * this->max_pivot;
	std::cout << "sketches_num " << sketches_num << "\n";

	std::vector<int, aligned_allocator<int>> f_sketches;
	std::vector<int, aligned_allocator<int>> o_sketches;

	f_sketches.resize (full_sketches.size () / 4);
	o_sketches.resize (order_sketches.size () / 4);

	memcpy (f_sketches.data (), full_sketches.data (), full_sketches.size ());
	memcpy (o_sketches.data (), order_sketches.data (), order_sketches.size ());

	for (size_t i = 0; i < 2; ++i)
	{
		this->buffers.push_back (cl::Buffer (this->context,
		                             CL_MEM_USE_HOST_PTR | CL_MEM_READ_ONLY,
		                             o_sketches.size () * sizeof (int),
		                             o_sketches.data (), &err));
	}

	this->buffer_piv = cl::Buffer (this->context,
	                               CL_MEM_USE_HOST_PTR | CL_MEM_READ_ONLY,
	                               f_sketches.size () * sizeof (int),
	                               f_sketches.data (), &err);

	this->hw_results.resize (8 * sketches_num * sizeof (dist_data) / sizeof (int));
	memset (this->hw_results.data (), 0, this->hw_results.size () * sizeof (int));

	this->buffer_w = cl::Buffer (this->context, CL_MEM_USE_HOST_PTR | CL_MEM_WRITE_ONLY,
	                             this->hw_results.size () * sizeof (int),
	                             this->hw_results.data (), &err);

	for (size_t i = 0; i < 1; ++i) this->kernel.setArg (i, this->buffers[i]);
	this->kernel.setArg (3, this->buffer_piv);
	this->kernel.setArg (6, this->buffer_w);

	for (size_t i = 0; i < 1; ++i)
	{
		q.enqueueMigrateMemObjects ({this->buffers[i]}, 0);
	}

	q.enqueueMigrateMemObjects ({this->buffer_piv}, 0);

	this->q.finish ();
}

kernel_dist::~kernel_dist ()
{
	this->q.finish ();
}

dist_data * kernel_dist::compute (std::vector<uint32_t> read_offset, uint32_t pivot_offset,
                                  uint32_t read_len, uint32_t pivot_len, uint32_t write_len)
{
	for (size_t i = 0; i < 1; ++i) this->kernel.setArg (1+i, read_offset[i]);

	this->kernel.setArg (2, read_len);
	this->kernel.setArg (4, pivot_offset);
	this->kernel.setArg (5, pivot_len);
	this->kernel.setArg (7, write_len);

	this->ev_mem.wait ();
	this->q.enqueueTask (this->kernel, nullptr, &ev_kernel);
	vec_ev.clear ();
	vec_ev.push_back (ev_kernel);
	this->q.enqueueReadBuffer ({this->buffer_w}, CL_FALSE, 0, sizeof(dist_data)*write_len, this->hw_results.data (), &vec_ev, &ev_mem);

	return reinterpret_cast<dist_data *> (this->hw_results.data ());
}
