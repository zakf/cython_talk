# File ex2_t.pyx
# 
# Author: Zak Fallows (zakf@mit.edu)
# Copyright 2013
# Released for free use under the terms of the MIT License, see license.txt
# 
# This is typed Cython with a C function instead of a Python function. C 
# functions have much lower function call overhead.

#======================= Typed Cython, Python Function ========================#

def inner_py():
    return 2


def outer_py(n):
    cdef int iii
    for iii in range(n):
        inner_py()
    return 0

#========================= Typed Cython, C Functions ==========================#

cdef long inner_t():
    return 2


def outer_t(n):
    cdef int iii
    for iii in range(n):
        inner_t()
    return 0

#====================== Typed Cython, C Function, Fudged ======================#

cdef long inner2_t(long seed):
    return seed % 261


def outer2_t(n):
    cdef int iii
    cdef long sum = 0
    for iii in range(n):
        sum += inner2_t(iii)
    return sum
