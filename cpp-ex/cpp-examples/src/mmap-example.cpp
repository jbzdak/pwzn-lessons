/*
 * mmap-example.cpp
 *
 *  Created on: Nov 21, 2014
 *      Author: jb
 */

#include <iostream>
#include <string>
#include <exception>
#include <stdexcept>
#include <array>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/mman.h>
#include <errno.h>

static const std::string filepath("/tmp/mmap-example.bin");

namespace mmap_exampe{

static const constexpr size_t array_len = 1E7;
static const constexpr size_t array_bytes = array_len*2*sizeof(double);

static const constexpr size_t rowlen = 2*sizeof(double);

void mmap_example(){

	auto fd = open(filepath.c_str(), O_RDWR | O_CREAT, (mode_t)0600);

	if (fd < 0){
		throw std::logic_error("Couldn't open file");
	}

	if(ftruncate(fd, array_bytes)!=0){
		throw std::logic_error("Couldnt' resize file");
	}

	void * raw_data = mmap(NULL, array_bytes, PROT_READ | PROT_WRITE, MAP_POPULATE | MAP_SHARED, fd, 0);


	double * double_data = reinterpret_cast<double*>(raw_data);

	double_data[0] = 1.5;
	double_data[2*rowlen + 1] = 3;

	close(fd);


}

}
