/*
 * write_struct.cpp
 *
 *  Created on: Nov 21, 2014
 *      Author: jb
 */


#include <cstdint>
#include <iomanip>
#include <iostream>
#include <fstream>
#include <memory.h>
#include <limits>

namespace write_struct{


struct Interaction{

	static constexpr const int StructureVersion=4;

	uint32_t event_id;
	float x, y, z, energy;

} __attribute__ ((packed)); // To jest ważne --- jest to roszerzenie GCC które mowi by nie dodawać 



struct Simple{

	uint8_t a;
	uint64_t b;

};

struct Packed{

	uint8_t a;
	uint8_t b;
	uint64_t c;

}__attribute__ ((packed));;


void test_simple(){

	Simple *s = new Simple();
	Packed *p = new Packed();
	uint8_t* data = reinterpret_cast<uint8_t*>(s);
	uint8_t* pacekd_data = reinterpret_cast<uint8_t*>(p);

	memset(s, 0, sizeof(Simple));
	memset(s, 0, sizeof(Packed));

	std::cout << "Simple" << std::endl;

	*s = {std::numeric_limits<uint8_t>::max(), std::numeric_limits<uint64_t>::max()};

	std::cout << sizeof(*s) << std::endl;

	for (size_t ii=0; ii<sizeof(Simple); ii++){
		std::cout << std::hex << std::setfill('0') << std::setw(2) << (int) data[ii] << " ";
	}

	std::cout << std::endl << "Packed" << std::endl;

	*p = {std::numeric_limits<uint8_t>::max(), 0, std::numeric_limits<uint64_t>::max()};

	std::cout << std::dec << sizeof(*p) << std::endl;

	for (size_t ii=0; ii<sizeof(Packed); ii++){
		std::cout << std::hex << std::setfill('0') << std::setw(2) << (int) pacekd_data[ii] << " ";
	}

//	std::cout << "OK";

}

void test_interaction(){
	std::ofstream output_file;
	output_file.open("/tmp/structure.bin", std::ios::binary | std::ios::out);
	Interaction interaction = {0, 0, 0, 0, 50};
	output_file.write(reinterpret_cast<char*>(&interaction), sizeof(interaction));
	interaction = {1, 1, 1, 1, 55};
	output_file.write(reinterpret_cast<char*>(&interaction), sizeof(interaction));
	output_file.close();
};

}
