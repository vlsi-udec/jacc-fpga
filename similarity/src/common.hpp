#include <getopt.h>
#include <iostream>
#include <fstream>
#include <chrono>
#include <map>

#ifndef COMMON_H
#define COMMON_H


void load_file_list (std::vector<std::string> & files, std::string & list_file, std::string path = "./")
{
	std::string line;

	if (list_file.empty ())
	{
		std::cerr << "No input file provided\n";
		exit (-1);
	}

	std::ifstream file (list_file);

	if (!file.is_open ())
	{
		std::cerr << "No valid input file provided\n";
		exit (-1);
	}

	while (getline (file, line)) files.push_back (path + line);
	file.close();
}

#endif // COMMON_H
