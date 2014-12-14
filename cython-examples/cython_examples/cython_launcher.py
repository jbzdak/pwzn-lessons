# -*- coding: utf-8 -*-
import timeit

import pyximport; pyximport.install()

import mergesort_cyth_1

import numpy as np

if __name__ == "__main__":

    # print("Python")
    # print(timeit.timeit("pymergesort(array)", setup="from mergesort import pymergesort; import numpy as np; array = np.random.random(int(1E5))", number=3))
    # print("Cython -- simple")
    # print(timeit.timeit("pymergesort(array)", setup="from mergesort_cyth_1 import pymergesort; import numpy as np; array = np.random.random(int(1E5))", number=3))
    print("Cython -- advanced")
    print(timeit.timeit("pymergesort(array)", setup="from mergesort_cyth_2 import pymergesort; import numpy as np; array = np.random.random(int(1E5))", number=3))
    # print("Cython -- advanced")
    # print(timeit.timeit("pymergesort(array)", setup="from mergesort_cyth_3 import pymergesort; import numpy as np; array = np.random.random(int(1E5))", number=3))
    # print("Numba")
    # print(timeit.timeit("pymergesort(array)", setup="from mergesort_numba import pymergesort; import numpy as np; array = np.random.random(int(1E5))", number=3))