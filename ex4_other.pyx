# File ex4_other.pyx
# 
# Author: Zak Fallows (zakf@mit.edu)
# Copyright 2013
# Released for free use under the terms of the MIT License, see license.txt
# 
# This module will be cimport'ed by ex4_t.pyx.

cdef long func_one(long arg):
    print "In func_one"
    return arg * 2

cdef long func_two(long arg):
    print "In func_two"
    return arg * 7

def func_three(arg):
    print "In func_three"
    return arg
