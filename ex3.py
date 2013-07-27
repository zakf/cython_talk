# File ex3.py
# 
# Author: Zak Fallows (zakf@mit.edu)
# Copyright 2013
# Released for free use under the terms of the MIT License, see license.txt
# 
# Demonstrates the speed of Cython.

import time

import ex3_u
import ex3_t

#============================= Interpreted Python =============================#

def inner_ipy(seed, factor):
    intermediate = seed * factor
    return intermediate % 278351


def middle_ipy(seed, n):
    sum = seed + 34
    for iii in range(n):
        sum += inner_ipy(seed, iii)
        seed += 61
        if sum > 94217452:
            sum %= 621943
        if seed > 6129435:
            seed %= 84125
    return sum


def outer_ipy(seed, n0, n1):
    sum = 0
    for iii in range(n0):
        curr_seed = (seed + iii) % 6943
        sum += middle_ipy(curr_seed, n1)
        if sum > 7245103:
            sum %= 22581
    return sum

#================================= Test Speed =================================#

def print_results(mode, t0, t1, dt_base=None, result=None):
    dt_curr = t1 - t0
    print "%s:" % mode
    if result:
        print "    Result = %s" % result
    print "    Time: %s seconds" % dt_curr
    if dt_base != None:
        print "    Ratio: %.3f" % (dt_base / dt_curr)
    print ''
    return dt_curr


def run_tests():
    seed = 73
    n0 = 1000
    n1 = 10000
    
    t0 = time.time()
    r0 = outer_ipy(seed, n0, n1)
    t1 = time.time()
    dt_ipy = print_results("Interpreted Python", t0, t1, result=r0)
    
    t0 = time.time()
    r0 = ex3_u.outer_u(seed, n0, n1)
    t1 = time.time()
    dt_u = print_results("Untyped Cython", t0, t1, dt_ipy, r0)
    
    t0 = time.time()
    r0 = ex3_t.outer_tpy(seed, n0, n1)
    t1 = time.time()
    dt_tpy = print_results("Typed Cython, Python Functions", t0, t1, dt_ipy, r0)
    
    t0 = time.time()
    r0 = ex3_t.outer_tpy2(seed, n0, n1)
    t1 = time.time()
    dt_tpy2 = print_results("Typed Cython, Python Functions II", t0, t1, 
                            dt_ipy, r0)
    
    t0 = time.time()
    r0 = ex3_t.outer_tc(seed, n0, n1)
    t1 = time.time()
    dt_tc = print_results("Typed Cython, C Functions", t0, t1, dt_ipy, r0)


# Do the benchmarks on import, for convenience:
run_tests()
