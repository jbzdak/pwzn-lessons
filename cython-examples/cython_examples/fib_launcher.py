# -*- coding: utf-8 -*-
import timeit

import pyximport; pyximport.install()

import mergesort_cyth_1

import numpy as np

if __name__ == "__main__":

    print("Python")
    print(timeit.timeit("fib(35)", setup="from fib import fib", number=3))
    print("Cython -- simple")
    print(timeit.timeit("fib(35)", setup="from fib1 import fib", number=3))
    print("Cython -- advanced")
    print(timeit.timeit("fib(35)", setup="from fib2 import fib", number=3))
    # print("Numba")
    # print(timeit.timeit("pymergesort(array)", setup="from mergesort_numba import pymergesort; import numpy as np; array = np.random.random(int(1E5))", number=3))