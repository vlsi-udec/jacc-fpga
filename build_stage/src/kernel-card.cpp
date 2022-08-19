#include "xcl2.hpp"
#include <vector>
#include <chrono>
#include <thread>
#include <cmath>
#include <memory>
#include "kernel-card.hpp"

kernel_card::kernel_card (cl::Program & program, cl::Context & context, cl::CommandQueue & q, size_t files)
{
	cl_int err;

	this->files_num = files;
	this->context = context;
	this->q = q;

	this->hw_results.resize ((this->files_num + 1) * sizeof (card_data) / sizeof (int));
	memset (this->hw_results.data (), 0, this->hw_results.size () * sizeof (int));

	this->kernel = cl::Kernel (program, "krnl_card_rtl", &err);

	this->buffer_w = cl::Buffer (this->context, CL_MEM_USE_HOST_PTR | CL_MEM_WRITE_ONLY,
	                             this->hw_results.size () * sizeof (int),
	                             this->hw_results.data (), &err);

	this->kernel.setArg (0, this->buffer_w);
	this->kernel.setArg (1, this->files_num);
	this->q.enqueueTask (this->kernel, nullptr, &ev_kernel);
}

kernel_card::~kernel_card ()
{
}

card_data * kernel_card::result ()
{
	ev_kernel.wait ();
	this->q.enqueueMigrateMemObjects({this->buffer_w}, CL_MIGRATE_MEM_OBJECT_HOST);
	this->q.finish ();

	return (card_data *) this->hw_results.data ();
}
