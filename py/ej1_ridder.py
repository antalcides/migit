#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Thu Oct 22 23:54:22 2015

Creado por: antalcides
"""

"""
Determine the root of f(x) = x^3 − 10x^2 + 5 = 0 that lies in (0.6, 0.8) with Ridder’s
method.
"""
from numpy import*
from ridder import*
from matplotlib import*
def f(x):
    return (x**3-10*x**2+5)
print "root =", ridder(f,-0.8,0)
print "root =", ridder(f,0.6,0.8)
print "root =", ridder(f,8,10)
x= linspace(-0.8,10,20)
y = x**3-10*x**2+5
plot(x,y,'or')
