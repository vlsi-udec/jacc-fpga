#include "fastq-read.hpp"

fastq_read::fastq_read (std::string filename)
{
	this->gz_file = gzopen (filename.c_str(), "r");
	gzrewind (this->gz_file);
}

fastq_read::~fastq_read()
{
	gzclose (this->gz_file);
}

int fastq_read::read (uint8_t * data, size_t len)
{
	return gzread (this->gz_file, data, len);
}

int fastq_read::eof ()
{
	return gzeof (this->gz_file);
}

int fastq_read::error ()
{
	int err;
	const char * a = gzerror (this->gz_file, &err);
	// std::cout << "ERR" << std::string (a) << "\n";
	return err;
}
