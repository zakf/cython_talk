# File ex4_t.pyx
# 
# Author: Zak Fallows (zakf@mit.edu)
# Copyright 2013
# Released for free use under the terms of the MIT License, see license.txt
# 
# Demonstrates several features of Cython.

#=========================== Including a .pxi File ============================#

include "def_types.pxi"     # Import integer types from def_types.pxi

cdef uint16 my_num = 57     # Use one of the integer types


#========================= cimporting a Cython Module =========================#

cimport ex4_other           # Import another Cython module, ex4_other.pyx

ex4_other.func_one(4)       # This works, because it is in ex4_other.pxd

# ex4_other.func_two(5)     # NameError at run-time. func_two was not in the 
                            # file ex4_other.pxd, so it is not shared.

# ex4_other.func_three(6)   # NameError at run-time. func_three is a Python 
                            # function, not a C function, so it is not 
                            # imported by cimport statements.


#====================== Python importing a Cython Module ======================#

import ex4_other as ex4_other_py

ex4_other_py.func_three(7)  # This works, because we used a normal Python 
                            # import.

# To share C functions as well as Python functions, you must do both a 
# cimport and a normal import, as demonstrated above with ex4_other.pyx.


#============================ Compiler Directives =============================#

cimport cython

# Using decorators, you can set a compiler directive for a whole function:

@cython.cdivision(True)
cpdef long with_cdivision(long top, long bottom):
    return top / bottom

@cython.cdivision(False)    # This decorator is unnecessary
cpdef long without_cdivision(long top, long bottom):
    return top / bottom

print with_cdivision(537, -19)      # Prints "-28"
print without_cdivision(537, -19)   # Prints "-29"


# Using with statements, you can set a compiler directive for an arbitrary 
# block of code:

def test_overflow():
    cdef long num1 = 2**62
    cdef long num2 = 2**62
    cdef long result
    
    with cython.overflowcheck(False):
        result = num1 + num2 + 5
        print result
        # Prints -9223372036854775803, which is wrong.
    
    with cython.overflowcheck(True):
        result = num1 + num2 + 5
        print result
        # Raises an OverflowError.

test_overflow()
