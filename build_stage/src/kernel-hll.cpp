#include "xcl2.hpp"
#include <vector>
#include <chrono>
#include <thread>
#include <cmath>
#include <memory>
#include "kernel-hll.hpp"

kernel_hll::kernel_hll (cl::Program & program, cl::Context & context, cl::CommandQueue & q,
                          int32_t chunk_size, size_t files_num)
{
	transfer_time = 0;
	wait_time = 0;

	this->bus_bytes = 64; // 512 bits
	this->precision = 14;
	this->sketch_size = 1 << precision;
	this->chunk_size = chunk_size;
	this->copy_bytes = this->chunk_size * sizeof (int);
	this->sketch_bytes = this->sketch_size / 2;
	size_t out_buffer_size = (files_num + 1) * sketch_bytes;

	this->context = context;
	this->q = q;

	this->buffer_select = true;

	this->chunk_b1.resize (this->chunk_size, 0);
	this->chunk_b2.resize (this->chunk_size, 0);

	this->sketch_t0.resize (out_buffer_size / sizeof (int));
	this->sketch_t1.resize (out_buffer_size / sizeof (int));
	this->sketch_t2.resize (out_buffer_size / sizeof (int));
	this->sketch_t3.resize (out_buffer_size / sizeof (int));
	this->sketch_t4.resize (out_buffer_size / sizeof (int));
	this->sketch_t5.resize (out_buffer_size / sizeof (int));
	this->sketch_t6.resize (out_buffer_size / sizeof (int));
	this->sketch_t7.resize (out_buffer_size / sizeof (int));

	memset (this->chunk_b1.data (), 0, sizeof (int) * this->chunk_b1.size ());
	memset (this->chunk_b2.data (), 0, sizeof (int) * this->chunk_b2.size ());

	cl_int err;

	this->kernel = cl::Kernel (program, "krnl_hll_rtl", &err);

	this->chunk_ext[0].flags = 0 | XCL_MEM_TOPOLOGY; // DDR[0]
	this->chunk_ext[0].param = 0;
	this->chunk_ext[0].obj   = this->chunk_b1.data ();

	this->chunk_ext[1].flags = 0 | XCL_MEM_TOPOLOGY; // DDR[0]
	this->chunk_ext[1].param = 0;
	this->chunk_ext[1].obj   = this->chunk_b2.data ();

	//Allocate Buffer in Global Memory
	this->buffer_r1 = cl::Buffer (this->context, CL_MEM_EXT_PTR_XILINX | CL_MEM_USE_HOST_PTR | CL_MEM_READ_ONLY,
	                              this->chunk_b1.size () * sizeof (int),
	                              &this->chunk_ext[0], &err);

	this->buffer_r2 = cl::Buffer (this->context, CL_MEM_EXT_PTR_XILINX | CL_MEM_USE_HOST_PTR | CL_MEM_READ_ONLY,
	                              this->chunk_b2.size () * sizeof (int),
	                              &this->chunk_ext[1], &err);

	this->buffer_w0 = cl::Buffer (this->context, CL_MEM_READ_WRITE | CL_MEM_USE_HOST_PTR,
	                             out_buffer_size, this->sketch_t0.data (), &err);
	this->buffer_w1 = cl::Buffer (this->context, CL_MEM_READ_WRITE | CL_MEM_USE_HOST_PTR,
	                             out_buffer_size, this->sketch_t1.data (), &err);
	this->buffer_w2 = cl::Buffer (this->context, CL_MEM_READ_WRITE | CL_MEM_USE_HOST_PTR,
	                             out_buffer_size, this->sketch_t2.data (), &err);
	this->buffer_w3 = cl::Buffer (this->context, CL_MEM_READ_WRITE | CL_MEM_USE_HOST_PTR,
	                             out_buffer_size, this->sketch_t3.data (), &err);
	this->buffer_w4 = cl::Buffer (this->context, CL_MEM_READ_WRITE | CL_MEM_USE_HOST_PTR,
	                             out_buffer_size, this->sketch_t4.data (), &err);
	this->buffer_w5 = cl::Buffer (this->context, CL_MEM_READ_WRITE | CL_MEM_USE_HOST_PTR,
	                             out_buffer_size, this->sketch_t5.data (), &err);
	this->buffer_w6 = cl::Buffer (this->context, CL_MEM_READ_WRITE | CL_MEM_USE_HOST_PTR,
	                             out_buffer_size, this->sketch_t6.data (), &err);
	this->buffer_w7 = cl::Buffer (this->context, CL_MEM_READ_WRITE | CL_MEM_USE_HOST_PTR,
	                             out_buffer_size, this->sketch_t7.data (), &err);

	this->kernel.setArg (3, buffer_w0);
	this->kernel.setArg (4, buffer_w1);
	this->kernel.setArg (5, buffer_w2);
	this->kernel.setArg (6, buffer_w3);
	this->kernel.setArg (7, buffer_w4);
	this->kernel.setArg (8, buffer_w5);
	this->kernel.setArg (9, buffer_w6);
	this->kernel.setArg (10, buffer_w7);
}

kernel_hll::~kernel_hll ()
{
	this->q.finish ();
}

void kernel_hll::insert_chunk (int * data, bool first_file)
{
	int32_t cp_bytes = this->copy_bytes;
	int32_t first_int = 0;
	if (first_file) first_int = 1;

	//Set the Kernel arguments
	this->kernel.setArg (0, this->buffer_select ? this->buffer_r1 : this->buffer_r2);
	this->kernel.setArg (1, cp_bytes / 64);
	this->kernel.setArg (2, first_int);

	if (this->buffer_select)
	{
		// Transfer data to FPGA
		q.enqueueMigrateMemObjects ({this->buffer_r1}, 0, &vec_ev_mem_c2, &ev_memory);
		vec_ev_mem_c1.push_back (ev_memory);
		ev_kernel.wait ();
		q.enqueueTask (this->kernel, &vec_ev_mem_c1, &ev_kernel);
	}
	else
	{
		// Transfer data to FPGA
		q.enqueueMigrateMemObjects ({this->buffer_r2}, 0, &vec_ev_mem_c1, &ev_memory);
		vec_ev_mem_c2.push_back (ev_memory);
		ev_kernel.wait ();
		q.enqueueTask (this->kernel, &vec_ev_mem_c2, &ev_kernel);
	}

	this->buffer_select = !this->buffer_select;
}

void kernel_hll::read_sketches ()
{
	ev_kernel.wait ();

	this->q.enqueueMigrateMemObjects ({this->buffer_w0}, CL_MIGRATE_MEM_OBJECT_HOST);
	this->q.enqueueMigrateMemObjects ({this->buffer_w1}, CL_MIGRATE_MEM_OBJECT_HOST);
	this->q.enqueueMigrateMemObjects ({this->buffer_w2}, CL_MIGRATE_MEM_OBJECT_HOST);
	this->q.enqueueMigrateMemObjects ({this->buffer_w3}, CL_MIGRATE_MEM_OBJECT_HOST);
	this->q.enqueueMigrateMemObjects ({this->buffer_w4}, CL_MIGRATE_MEM_OBJECT_HOST);
	this->q.enqueueMigrateMemObjects ({this->buffer_w5}, CL_MIGRATE_MEM_OBJECT_HOST);
	this->q.enqueueMigrateMemObjects ({this->buffer_w6}, CL_MIGRATE_MEM_OBJECT_HOST);
	this->q.enqueueMigrateMemObjects ({this->buffer_w7}, CL_MIGRATE_MEM_OBJECT_HOST);
	this->q.finish ();
}

uint8_t * kernel_hll::get_buffer (int thread)
{
	int * ret = nullptr;

	switch (thread)
	{
		case 0: ret = this->sketch_t0.data (); break;
		case 1: ret = this->sketch_t1.data (); break;
		case 2: ret = this->sketch_t2.data (); break;
		case 3: ret = this->sketch_t3.data (); break;
		case 4: ret = this->sketch_t4.data (); break;
		case 5: ret = this->sketch_t5.data (); break;
		case 6: ret = this->sketch_t6.data (); break;
		case 7: ret = this->sketch_t7.data (); break;
	}

	return ((uint8_t *) ret) + this->sketch_bytes;
}

uint kernel_hll::get_sketch_bytes ()
{
	return this->sketch_bytes;
}

uint8_t * kernel_hll::get_ptr ()
{
	if (this->buffer_select)
		return (uint8_t *) this->chunk_b1.data ();
	else
		return (uint8_t *) this->chunk_b2.data ();
}

