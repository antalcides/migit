# -*- coding: utf-8 -*-
"""
Created on Fri Oct 16 16:09:00 2015

@author: antalcides
"""

from math import* # in main
def f(x):
    e = exp(-0.1*x)
    s = sin(6*pi*x)
    return e*s # in main
x = 2
y = f(x)
print 'f(%g)=%g' % (x, y)