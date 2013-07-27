# File ex2_t.pyx
# 
# Author: Zak Fallows (zakf@mit.edu)
# Copyright 2013
# Released for free use under the terms of the MIT License, see license.txt
# 
# This is typed Cython.

#======================= Typed Cython, Python Functions =======================#

def inner_tpy(seed, factor):
    cdef long intermediate = seed * factor
    return intermediate % 278351


def middle_tpy(seed, n):
    cdef long sum = seed + 34
    cdef long iii
    for iii in range(n):
        sum += inner_tpy(seed, iii)
        seed += 61
        if sum > 94217452:
            sum %= 621943
        if seed > 6129435:
            seed %= 84125
    return sum


def outer_tpy(seed, n0, n1):
    cdef long sum = 0
    cdef long iii
    cdef long curr_seed
    for iii in range(n0):
        curr_seed = (seed + iii) % 6943
        sum += middle_tpy(curr_seed, n1)
        if sum > 7245103:
            sum %= 22581
    return sum

#===================== Typed Cython, Python Functions II ======================#

def inner_tpy2(long seed, long factor):
    # This is still a Python function, even though the arguments have types.
    cdef long intermediate = seed * factor
    return intermediate % 278351


def middle_tpy2(long seed, long n):
    cdef long sum = seed + 34
    cdef long iii
    for iii in range(n):
        sum += inner_tpy2(seed, iii)
        seed += 61
        if sum > 94217452:
            sum %= 621943
        if seed > 6129435:
            seed %= 84125
    return sum


def outer_tpy2(long seed, long n0, long n1):
    cdef long sum = 0
    cdef long iii
    cdef long curr_seed
    for iii in range(n0):
        curr_seed = (seed + iii) % 6943
        sum += middle_tpy2(curr_seed, n1)
        if sum > 7245103:
            sum %= 22581
    return sum

#========================= Typed Cython, C Functions ==========================#

cdef long inner_tc(long seed, long factor):
    cdef long intermediate = seed * factor
    return intermediate % 278351


cdef long middle_tc(long seed, long n):
    cdef long sum = seed + 34
    cdef long iii
    for iii in range(n):
        sum += inner_tc(seed, iii)
        seed += 61
        if sum > 94217452:
            sum %= 621943
        if seed > 6129435:
            seed %= 84125
    return sum


cpdef long outer_tc(long seed, long n0, long n1):
    cdef long sum = 0
    cdef long iii
    cdef long curr_seed
    for iii in range(n0):
        curr_seed = (seed + iii) % 6943
        sum += middle_tc(curr_seed, n1)
        if sum > 7245103:
            sum %= 22581
    return sum
