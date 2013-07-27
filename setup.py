# File setup.py
# 
# Author: Zak Fallows (zakf@mit.edu)
# Copyright 2013
# Released for free use under the terms of the MIT License, see license.txt
# 
# This is the build automation file, it is like a makefile.
# To compile all modules, do this at the command line:
# python setup.py build_ext --inplace

from distutils.core import setup
from Cython.Build import cythonize

pyx_modules = [
    'ex1_t.pyx',
    'ex2_u.pyx',
    'ex2_t.pyx',
    'ex3_u.pyx',
    'ex3_t.pyx',
    'ex4_t.pyx',
    'ex4_other.pyx',
]

setup(name = "Zak Fallows Cython Examples",
      ext_modules = cythonize(pyx_modules))
