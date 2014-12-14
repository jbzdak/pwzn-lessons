# -*- coding: utf-8 -*-

import numpy as np

import timeit


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

if __name__ == "__main__":
    array = np.random.random(int(1E5))
    assert np.all(pymergesort(array) == sorted(array))
    print(timeit.timeit("pymergesort(array)", setup="from __main__ import pymergesort; import numpy as np; array = np.random.random(int(1E5))", number=3))