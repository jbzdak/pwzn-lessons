/*
 * parse_csv.cpp
 *
 *  Created on: Nov 21, 2014
 *      Author: jb
 */


#include<iostream>
#include<boost/tokenizer.hpp>
#include<string>
#include <vector>
#include <tuple>

void parse_csv(){
	typedef boost::tokenizer<boost::escaped_list_separator<char>> tokenizer;

	boost::escaped_list_separator<char> tokenize_func('\\', ',', '\"');

	std::vector<std::tuple<double, double, double>> result;


}



