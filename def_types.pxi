# File: def_types.pxi
# 
# Author: Zak Fallows (zakf@mit.edu)
# Copyright 2013
# Released for free use under the terms of the MIT License, see license.txt
# 
# Define some helpful types, and then check that they are the correct size.
# Size checking occurs at import-time. Size checking is theoretically 
# unnecessary. Here, we use stdint.h. These types are also defined in 
# the standard header inttypes.h, but I could not figure out how to use that 
# header from within Cython.

from libc.stdint cimport int8_t, uint8_t, int16_t, uint16_t
from libc.stdint cimport int32_t, uint32_t, int64_t, uint64_t

ctypedef int8_t int8
ctypedef uint8_t uint8
ctypedef int16_t int16
ctypedef uint16_t uint16
ctypedef int32_t int32
ctypedef uint32_t uint32
ctypedef int64_t int64
ctypedef uint64_t uint64

if sizeof(int8) != 1:
    raise Exception(
        "int8 is the wrong size, it is %s bytes." % sizeof(int8))
if sizeof(int16) != 2:
    raise Exception(
        "int16 is the wrong size, it is %s bytes." % sizeof(int16))
if sizeof(int32) != 4:
    raise Exception(
        "int32 is the wrong size, it is %s bytes." % sizeof(int32))
if sizeof(int64) != 8:
    raise Exception(
        "int64 is the wrong size, it is %s bytes." % sizeof(int64))
