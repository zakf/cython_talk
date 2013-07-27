# File ex2.py
# 
# Author: Zak Fallows (zakf@mit.edu)
# Copyright 2013
# Released for free use under the terms of the MIT License, see license.txt
# 
# Demonstrates Python function call overhead.
# 
# Notation: _ipy means "interpreted Python".
# _py means "untyped Python function, maybe compiled by Cython".
# _c means "C function, statically typed".

import time

import ex2_u
import ex2_t

#============================= Interpreted Python =============================#

def inner_ipy():
    return 2


def outer_ipy(n):
    for iii in range(n):
        inner_ipy()
    return 0

#================================= Test Speed =================================#

# NOTE: This is a very naive and unsophisticated way to benchmark Python and 
# Cython code. Cython has fantastic tools for benchmarking code and it gives 
# you hints for how to optimize. I am using the simplest method possible in 
# this educational example so that it is easy to understand. The results 
# may be slightly less accurate, but they are close enough.

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
    t0 = time.time()
    r0 = outer_ipy(10**7)
    t1 = time.time()
    dt_ipy = print_results("Interpreted Python", t0, t1)
    
    t0 = time.time()
    r0 = ex2_u.outer_u(10**7)
    t1 = time.time()
    dt_u = print_results("Untyped Cython", t0, t1, dt_ipy)
    
    t0 = time.time()
    r0 = ex2_t.outer_py(10**7)
    t1 = time.time()
    dt_u = print_results("Typed Cython, Python Function", t0, t1, dt_ipy)
    
    t0 = time.time()
    r0 = ex2_t.outer_t(10**7)
    t1 = time.time()
    dt_t = print_results("Typed Cython, C Function", t0, t1, dt_ipy)
    
    print "# That is an implausibly large speed boost."
    print "# By inspecting the C code output by Cython, I can see that the "
    print "# C code really does call the function 10,000,000 times. So the "
    print "# speed boost probably comes from either the compiler inlining "
    print "# the function, or more likely, the compiler (in my case GCC) "
    print "# noticed that the result is unused so it completely skipped "
    print "# this piece of code, it generated no corresponding machine code "
    print "# at all. GCC is too smart for us!"
    print ''
    
    t0 = time.time()
    r0 = ex2_t.outer2_t(10**7)
    t1 = time.time()
    dt_t = print_results("Typed Cython, C Function, Fudged", t0, t1, dt_ipy)


# Do it on import, because it is convenient:
run_tests()
