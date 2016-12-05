#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Sat Oct 24 00:37:21 2015

Creado por: antalcides
"""
"""
Utilize the functions LUdecmp3 and LUsolve3 to solve Ax = b, where
    |  2 -1  0  0  0 |   
    | -1  2 -1  0  0 |
A = |  0 -1  2 -1  0 |
    |  0  0 -1  2 -1 |
    |  0  0  0 -1  2 |
    
   |  5 |
   | -5 |
b =|  4 |
   | -5 |
   |  5 |
"""
from numpy import array,ones
from LUdecomp3 import *
d = ones((5))*2.0
c = ones((4))*(-1.0)
b = array([5.0, -5.0, 4.0, -5.0, 5.0])
e = c.copy()
c,d,e = LUdecomp3(c,d,e)
x = LUsolve3(c,d,e,b)
print "\nx =\n",x
raw_input("\nPress return to exit")


