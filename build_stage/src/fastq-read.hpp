#include <iostream>
#include <zlib.h>

#ifndef FASTQ_READ_H
#define FASTQ_READ_H

class fastq_read
{
private:
	gzFile gz_file;
public:
	fastq_read (std::string filename);
	~fastq_read ();
	int read (uint8_t * data, size_t len);
	int eof ();
	int error ();
};

#endif // FASTQ_READ_H
