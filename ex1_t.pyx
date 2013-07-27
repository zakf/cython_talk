# The _t in the filename signifies that this is “typed Cython”.
# 
# Author: Zak Fallows (zakf@mit.edu)
# Copyright 2013
# Released for free use under the terms of the MIT License, see license.txt

cpdef double do_math(long seed, long power):
    cdef double multiplier = 2**(1.0 / power)
    return seed * multiplier

# py> ex1_t.do_math(3, 4)
# 3.5676213450081633
## Identical result to interpreted Python
