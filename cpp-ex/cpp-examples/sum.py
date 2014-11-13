# -*- coding: utf-8 -*-

import time
import random

size = int(1E7)

start = time.monotonic()
data = [random.randint(1, 1000) for __ in range(size)]
data_sum = sum(data)
# data_sum = 0
# for v in data:
#     data_sum += v
data_avg = data_sum / size
print("Average ", data_sum)
end = time.monotonic()
print("Time ", end-start)