# File ex2_u.pyx
# 
# Author: Zak Fallows (zakf@mit.edu)
# Copyright 2013
# Released for free use under the terms of the MIT License, see license.txt
# 
# This is untyped (dynamic) Cython, but it is compiled. The fact that it is 
# compiled will give a small speed boost, even though I just copy-pasted 
# the normal Python code without changes.

#=============================== Untyped Cython ===============================#

def inner_u():
    return 2


def outer_u(n):
    for iii in range(n):
        inner_u()
    return 0
