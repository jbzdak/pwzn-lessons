#define BOOST_TEST_MODULE "C++ Unit Tests for MyTangledLibrary"
#define BOOST_TEST_CATCH_SYSTEM_ERRORS yes
#define BOOST_TEST_DYN_LINK
#include <boost/test/unit_test.hpp>
#include <iostream>
#include "sort.hh"

BOOST_AUTO_TEST_SUITE(TestLg)

BOOST_AUTO_TEST_CASE(TestIterator){
        double data[1000][1000];
        for (int ii=0; ii<1000; ii++){
            data[ii][0] = ii;
        }
        auto iter = strided_iterator<double >(reinterpret_cast<char*>(data), sizeof(double)*1000, 0);
        std::cout << data[10][0] << " " << iter[10] << std::endl;
        BOOST_CHECK_MESSAGE(iter[10] == data[10][0], iter[10]);


}

BOOST_AUTO_TEST_CASE(TestStrided){

    double data[1000][1000];
    double expected[1000];
    for (int ii=0; ii<1000; ii++){
        data[ii][0] = -ii;
        expected[ii] = -ii;
    }
    for (int ii=0; ii<1000; ii++) {
            data[ii][0] = -ii;
    }
    sort_inplace_strides(reinterpret_cast<char*>(data),  sizeof(double)*1000, 1000);
    for (int ii=0; ii<1000; ii++){
        std::cout << data[ii][0] << std::endl;
    }



}

BOOST_AUTO_TEST_SUITE_END();
