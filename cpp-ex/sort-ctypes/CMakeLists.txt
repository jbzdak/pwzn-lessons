cmake_minimum_required(VERSION 2.8.4)
project(sort_ctypes)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}  -std=c++14 -O3  -lboost_unit_test_framework")

set(SOURCE_FILES src/sort.cpp)
add_executable(test src/test.cpp src/test.cpp ${SOURCE_FILES})
ADD_LIBRARY(sort_ctypes SHARED ${SOURCE_FILES})