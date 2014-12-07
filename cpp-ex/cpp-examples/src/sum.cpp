/*
 * sum.cpp
 *
 *  Created on: Nov 21, 2014
 *      Author: jb
 */

#include "sum.h"

#include <vector>
#include <array>
#include <algorithm>
#include <cstdint>
#include <functional>
#include <iostream>
#include <chrono>
#include <memory>

#include <boost/random/uniform_int_distribution.hpp>
#include <boost/random/mersenne_twister.hpp>



static const constexpr size_t size = 1E7;

void sum_a(){

	auto start = std::chrono::high_resolution_clock::now();

	boost::random::mt19937 gen;
	boost::random::uniform_int_distribution<uint16_t> dist(0, 1000);

	std::unique_ptr<std::array<uint16_t, size>> random_data(new std::array<uint16_t, size>());

	std::generate_n(random_data->begin(), size, [&gen, &dist]() {return dist(gen);});

	auto sum_result = std::accumulate(
			random_data->begin(), random_data->end(), static_cast<uint64_t>(0), std::plus<uint64_t>());

	auto end = std::chrono::high_resolution_clock::now();

	std::chrono::duration<double> elapsed = end-start;

	std::cout << "Average " << sum_result/static_cast<double>(size) << std::endl;
	std::cout << "Elapsed sec " << elapsed.count() << std::endl;

}

void sum_b(){
	auto start = std::chrono::high_resolution_clock::now();

	boost::random::mt19937 gen; //Boost twierdzi że to najszybszy boostowy generator :)
	boost::random::uniform_int_distribution<uint16_t> dist(0, 1000);

	uint64_t sum_result = 0;

	for (size_t ii=0; ii<size; ii++){
		sum_result+=dist(gen);
	}

	auto end = std::chrono::high_resolution_clock::now();

	std::chrono::duration<double> elapsed = end-start;

	std::cout << "Average " << sum_result/static_cast<double>(size) << std::endl;
	std::cout << "Elapsed sec " << elapsed.count() << std::endl;

}
