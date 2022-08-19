#include <getopt.h>
#include <iostream>
#include <fstream>
#include <chrono>
#include <map>
#include <algorithm>

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

	while (getline (file, line))
	{
		std::ifstream file2 (path + line);

		if (file2.is_open ()) files.push_back (path + line);
		file2.close();
	}
	file.close();
}

void load_sort_files (std::vector<std::string> & files, std::string & list_file, std::string path = "./")
{
	std::string line;
	std::vector<std::pair<std::string, size_t>> file_map;

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

	while (getline (file, line))
	{
		std::ifstream file2 (path + line);
		if (file2.is_open ())
		{
			file2.seekg (0, file2.end);
			size_t size = file2.tellg ();
			file_map.push_back (std::make_pair (path + line, size));
			file2.close();
		}
	}
	file.close();

	// Sort the map by value
	std::sort (file_map.begin (), file_map.end (),
	           [](const std::pair<std::string, size_t> &x,
	              const std::pair<std::string, size_t> &y)
	{
		return x.second > y.second;
	});

	for (auto &x : file_map)
	{
		files.push_back (x.first);
	}

}

#endif // COMMON_H
