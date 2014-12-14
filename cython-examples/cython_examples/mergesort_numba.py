# -*- coding: utf-8 -*-

import numpy as np
from numba import jit

@jit
def pymergesort(array):

    # Da się zrobić merge-sorta za 'w miejscu', ale jest to trudniejsze i mniej czytelne.
    array = np.copy(array)

    if len(array) == 1:
        return array

    middle = len(array) // 2

    left = pymergesort(array[:middle])
    right = pymergesort(array[middle:])

    left_idx = 0
    right_idx = 0
    result_idx = 0

    while left_idx < len(left) and right_idx < len(right):
        if left[left_idx] <= right[right_idx]:
            array[result_idx] = left[left_idx]
            left_idx += 1
        else:
            array[result_idx] = right[right_idx]
            right_idx += 1

        result_idx+=1

    if left_idx == len(left):
        array[result_idx:] = right[right_idx:]
    else:
        array[result_idx:] = left[left_idx:]

    return array