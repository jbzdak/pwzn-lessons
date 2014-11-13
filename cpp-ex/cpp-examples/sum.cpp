/*
 * sum.cpp
 *
 *  Created on: Nov 13, 2014
 *      Author: jb
 */

#include <vector>
#include <algorithm>
#include <cstdint>
#include <functional>
#include <iostream>

#include <boost/random/uniform_int_distribution.hpp>
#include <boost/random/taus88.hpp>

template<typename G, typename D>
class Generate{
private:
	G g;
	D d;
public:

	Generate(G g, D d): g(g), d(d){};

	uint16_t operator()(){
		return d(g);
	}
};

template<typename G, typename D>
Generate<G, D> make_generate(G g, D d){
	return Generate<G, D>(g, d);
}


int main(){

	static boost::random::taus88 gen;
	static boost::random::uniform_int_distribution<> dist(1, 1000);

	const size_t size = 10000000;
	std::vector<uint16_t> random_data;
	random_data.resize(size);

	std::generate_n(random_data.begin(), size, []() -> uint16_t {return dist(gen);});
//	std::generate_n(random_data.begin(), size, make_generate(gen, dist));
//	for (size_t ii=0; ii < size; ii++){
//		random_data[ii] = dist(gen);
//	}
	auto sum_result = std::accumulate(random_data.begin(), random_data.end(), static_cast<uint64_t>(0), std::plus<uint64_t>());

	std::cout << "Average " << sum_result/static_cast<double>(size) << std::endl;

}
