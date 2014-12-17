# -*- coding: utf-8 -*-
import timeit

import os

dll_path = os.path.join(os.path.dirname(__file__), "build", 'libsort_ctypes.so')
dll_path = "/home/jb/dydakyka/pwzd/cpp-ex/sort-ctypes/build/libsort_ctypes.so"
print(dll_path)

import ctypes

import numpy as np

import faulthandler, sys

faulthandler.enable(file=sys.stderr, all_threads=True)

random_arr = np.asarray(np.random.random_integers(0, 1000, 1000), dtype=np.float64)

original = np.copy(random_arr)

so = ctypes.cdll.LoadLibrary(dll_path)

data_ptr = random_arr.ctypes.data_as(ctypes.POINTER(ctypes.c_double))
length = ctypes.c_uint64(len(random_arr))

so.sort_inplace_basic(data_ptr, length)

print(np.all(np.sort(original)==random_arr))

random_arr_2d = np.vstack([np.arange(ii, ii+1000, 1, dtype=np.float64) for ii in range(1000, int(1E6), 1000)])

to_be_sorted = random_arr_2d[2, :]
original = np.copy(to_be_sorted)
data_ptr = to_be_sorted.ctypes.data_as(ctypes.POINTER(ctypes.c_char))
length = ctypes.c_uint64(len(to_be_sorted))
stride = ctypes.c_uint64(to_be_sorted.ctypes.strides[0])


# print(to_be_sorted)

so.sort_inplace_strides(data_ptr, length, stride)

print(np.all(np.sort(original)==to_be_sorted))

# print(to_be_sorted)
#
# print(np.sort(original))

print(", ".join([str(i) for i in random_arr_2d[:, 1].ctypes.strides]))
print(random_arr_2d[:, 1].ctypes.strides)
print(", ".join([str(i) for i in random_arr_2d[:, 1].ctypes.shape]))


def sort_fast(array):

    data_ptr = array.ctypes.data_as(ctypes.POINTER(ctypes.c_double))
    length = ctypes.c_uint64(len(array))

    return so.sort_inplace_basic(data_ptr, length)

if __name__ == "__main__":

    print("Python")
    print(timeit.timeit("np.sort(array)", setup="import numpy as np; array =  np.asarray(np.random.random(int(1E7)), dtype=np.float64)", number=10))

    print("Python --- nonstrided")
    print(timeit.timeit("sort_fast(array)", setup="from __main__ import sort_fast; import numpy as np; array = np.asarray(np.random.random(int(1E7)), dtype=np.float64)", number=10))