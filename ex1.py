# ex1.py is short for "example 1".
# This is a normal Python module (file).
# 
# Author: Zak Fallows (zakf@mit.edu)
# Copyright 2013
# Released for free use under the terms of the MIT License, see license.txt

def do_math(seed, power):
    multiplier = 2**(1.0 / power)
    return seed * multiplier

# py> ex1.do_math(3, 4)
# 3.5676213450081633
