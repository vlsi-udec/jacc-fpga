#ifndef COMMON_CL_H_
#define COMMON_CL_H_

#include "xcl2.hpp"

void setup_device (cl::Program & program, cl::Context & context, cl::CommandQueue & q,
                   cl::CommandQueue & q2, std::string binaryFile)
{
	cl_int err;

	//Create Program and Kernel
	auto devices = xcl::get_xil_devices();

	// read_binary_file() is a utility API which will load the binaryFile
	// and will return the pointer to file buffer.
	auto fileBuf = xcl::read_binary_file(binaryFile);
	cl::Program::Binaries bins{{fileBuf.data(), fileBuf.size()}};
	int valid_device = 0;

	for (unsigned int i = 0; i < devices.size(); i++)
	{
		auto device = devices[i];
		// Creating Context and Command Queue for selected Device
		context = cl::Context (device, nullptr, nullptr, nullptr, &err);
		q = cl::CommandQueue (context, device, CL_QUEUE_PROFILING_ENABLE
		                     | CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE, &err);
		q2 = cl::CommandQueue (context, device, CL_QUEUE_PROFILING_ENABLE
		                     | CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE, &err);

		std::cout << "Trying to program device[" << i
		          << "]: " << device.getInfo<CL_DEVICE_NAME>() << std::endl;
		program = cl::Program (context, {device}, bins, nullptr, &err);

		if (err != CL_SUCCESS)
		{
			std::cout << "Failed to program device[" << i << "] with xclbin file!\n";
		}
		else
		{
			std::cout << "Device[" << i << "]: program successful!\n";
			valid_device++;
			break; // we break because we found a valid device
		}
	}

	if (valid_device == 0)
	{
		std::cout << "Failed to program any device found, exit!\n";
		exit(EXIT_FAILURE);
	}
}

#endif // COMMON_CL_H_
