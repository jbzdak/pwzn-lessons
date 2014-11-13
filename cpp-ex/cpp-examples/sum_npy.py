# -*- coding: utf-8 -*-

import time
import random
import numpy as np
from numpy.random import random_integers

size = int(1E7)

start = time.monotonic()
data = random_integers(0, 1000, size)
data_sum = np.sum(data)
data_avg = data_sum / size
print("Average ", data_avg)
end = time.monotonic()
print("Time ", end-start)