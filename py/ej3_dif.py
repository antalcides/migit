#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Sat Oct 24 16:48:44 2015

Creado por: antalcides
"""
"""
The uniform beam of length L and bending rigidity E I is attached to rigid sup-
ports at both ends. The beam carries a concentrated load P at its mid-span. If we
utilize symmetry and model only the left half of the beam, the displacement v can be
obtained by solving the boundary value problem
v|_x=0 = 0. (dv/dx)|_x=0 = 0, (dv/dx)|_(x=L/2) = 0, EI(d^3v/dx^3)|_x=L/2 = -P/2.
Use the finite difference method to determine the displacement and the bending mo-
ment M = −EI(d^2v/dx^2) at the mid-span (the exact values are v = PL^3/(192EI) and
M = PL/8).
"""
from numpy import zeros,ones,array,arange
from LUdecomp5 import *
def equations(x,h,m): # Set up finite difference eqs.
    h4 = h**4
    d = ones(m + 1)*6.0
    e = ones(m)*(-4.0)
    f = ones(m-1)
    b = zeros(m+1)
    d[0] = 1.0
    d[1] = 7.0
    e[0] = 0.0
    f[0] = 0.0
    d[m-1] = 7.0
    d[m] = 3.0
    b[m] = 0.5*h**3
    return d,e,f,b
xStart = 0.0 # x at left end
xStop = 0.5 # x at right end
m = 20 # Number of mesh spaces
h = (xStop - xStart)/m
x = arange(xStart,xStop + h,h)
d,e,f,b = equations(x,h,m)
d,e,f = LUdecomp5(d,e,f)
y = LUsolve5(d,e,f,b)
print "\n        x              y"
for i in range(m + 1):
 print "%14.5e %14.5e" %(x[i],y[i])

