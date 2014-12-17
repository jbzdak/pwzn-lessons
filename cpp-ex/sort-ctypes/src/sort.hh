#pragma once

# include <boost/iterator/iterator_facade.hpp>
#include <stddef.h>

template<typename item>
struct strided_iterator: public boost::iterator_facade<
    strided_iterator<item>,
    item,
    boost::random_access_traversal_tag
>
{
public:
    char* data;
    uint64_t stride;
    ptrdiff_t current_pos;

    strided_iterator(char* data, uint64_t stride, size_t current_pos=0):
        data(data), stride(stride), current_pos(current_pos){;}

    item& dereference()const {
        return *reinterpret_cast<item*>(data+current_pos*stride);
    }

    bool equal(const strided_iterator& other) const{
        return other.data == this->data && other.current_pos == this->current_pos && other.stride == this->stride;
    }

    void advance(int64_t distance){
        current_pos+=distance;
    }

    void increment(){
        advance(1);
    }

    void decrement(){
        advance(-1);
    }

    ptrdiff_t distance_to(const strided_iterator& other) const{
        return other.current_pos - current_pos;
    }

};



extern "C" {

void sort_inplace_basic(double* arr, uint64_t len);



void sort_inplace_strides(char* arr, uint64_t stride, uint64_t len);

}