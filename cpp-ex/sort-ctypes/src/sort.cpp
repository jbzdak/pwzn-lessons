#include <algorithm>

#include "sort.hh"
#include <iostream>
extern "C" {

void sort_inplace_basic(double* arr, uint64_t len){
    std::sort(arr, arr+len);
}

void print_strided(char* arr, uint64_t stride, uint64_t len){
    auto begin = strided_iterator<double>(arr, stride);
    auto end = strided_iterator<double>(arr, stride, len);
    while(begin!=end){
        std::cout << *begin << std::endl;
        begin++;
    }
}

void sort_inplace_strides(char* arr, uint64_t stride, uint64_t len){
    auto begin = strided_iterator<double>(arr, stride);
    auto end = strided_iterator<double>(arr, stride, len);
    std::sort(begin, end);
}

}