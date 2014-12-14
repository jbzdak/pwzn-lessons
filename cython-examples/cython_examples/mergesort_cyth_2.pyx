# -*- coding: utf-8 -*-

import numpy as np
cimport numpy as np

import cython
cimport cython
import timeit

ctypedef np.float64_t DTYPE_t

@cython.boundscheck(False)
cpdef np.ndarray[np.float64_t, ndim=1] pymergesort(np.ndarray[np.float64_t, ndim=1] array):

    # Da się zrobić merge-sorta za 'w miejscu', ale jest to trudniejsze i mniej czytelne.
    array = np.copy(array)

    if len(array) == 1:
        return array

    cdef unsigned int middle = len(array) // 2

    cdef np.ndarray[np.float64_t, ndim=1] left = pymergesort(array[:middle])
    cdef np.ndarray[np.float64_t, ndim=1] right = pymergesort(array[middle:])

    cdef unsigned int left_idx = 0
    cdef unsigned int right_idx = 0
    cdef unsigned int result_idx = 0

    cdef unsigned int len_left = len(left), len_right = len(right);

    while left_idx < len_left and right_idx < len_right:
        if left[left_idx] <= right[right_idx]:
            array[result_idx] = left[left_idx]
            left_idx += 1
        else:
            array[result_idx] = right[right_idx]
            right_idx += 1

        result_idx+=1

    if left_idx == len_left:
        array[result_idx:] = right[right_idx:]
    else:
        array[result_idx:] = left[left_idx:]

    return array
