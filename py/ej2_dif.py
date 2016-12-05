#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Sat Oct 24 00:56:12 2015

Creado por: antalcides
"""
"""
Resolve the following linear boundary value problem using m = 10:
y" = −4y + 4x
y(0) = 0
y'(π/2) = 0
Solve these equations with a computer program
"""
from numpy import zeros,ones,array,arange
from LUdecomp3 import *
from math import pi
def equations(x,h,m): # Set up finite difference eqs.
    h2 = h*h
    d = ones(m + 1)*(-2.0 + 4.0*h2)
    c = ones(m)
    e = ones(m)
    b = ones(m+1)*4.0*h2*x
    d[0] = 1.0
    e[0] = 0.0
    b[0] = 0.0
    c[m-1] = 2.0
    return c,d,e,b
xStart = 0.0 # x at left end
xStop = pi/2.0 # x at right end
m = 10 # Number of mesh spaces
h = (xStop - xStart)/m
x = arange(xStart,xStop + h,h)
c,d,e,b = equations(x,h,m)
c,d,e = LUdecomp3(c,d,e)
y = LUsolve3(c,d,e,b)
print "\n x y"
for i in range(m + 1):
 print "%14.5e %14.5e" %(x[i],y[i])