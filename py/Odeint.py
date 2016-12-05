#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Tue Oct 20 20:21:36 2015

Creado por: antalcides
"""
from numpy import* 
from pylab import* 
from scipy.integrate import odeint 
def fun(v0,x):  
    y=v0[0] 
    z=v0[1] 
    vec=[x+y+z,-x+y-z] 
    return vec 
x=arange(0,2.1,0.1)
v0=[1,2]
vsol=odeint(fun,v0,x) 
plot(x,vsol,'o')
grid(True) 
show()