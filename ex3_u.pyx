# File ex3_u.pyx
# 
# Author: Zak Fallows (zakf@mit.edu)
# Copyright 2013
# Released for free use under the terms of the MIT License, see license.txt
# 
# This is untyped (dynamic) Cython, but it is compiled. The fact that it is 
# compiled will give a small speed boost, even though I just copy-pasted 
# the normal Python code without changes. (I did change the function names.)

#=============================== Untyped Cython ===============================#

def inner_u(seed, factor):
    intermediate = seed * factor
    return intermediate % 278351


def middle_u(seed, n):
    sum = seed + 34
    for iii in range(n):
        sum += inner_u(seed, iii)
        seed += 61
        if sum > 94217452:
            sum %= 621943
        if seed > 6129435:
            seed %= 84125
    return sum


def outer_u(seed, n0, n1):
    sum = 0
    for iii in range(n0):
        curr_seed = (seed + iii) % 6943
        sum += middle_u(curr_seed, n1)
        if sum > 7245103:
            sum %= 22581
    return sum
