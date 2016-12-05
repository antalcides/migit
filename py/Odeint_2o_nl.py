#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Tue Oct 20 20:21:36 2015

Creado por: antalcides
"""
"""
Obtenga numéricamente la solución de la ecuación
y’’ + yy’ - x + y - 3 = 0, y(0) = 1, y’(0) = 2, 0≤x≤2
Mediante la sustitución z = y’, se obtiene:
z’ + yz - x + y - 3 = 0
Es un sistema de dos ecuaciones diferenciales de primer orden que se puede escribir
y’ = f(x,y,z) = z, y(0) = 1
z’ = g(x,y,z) = x - y - yz + 3, z(0) = 2
"""
from numpy import* 
from pylab import* 
from scipy.integrate import odeint 
def fun(v0,x):  
    y=v0[0] 
    z=v0[1] 
    vec=[z,x-y-y*z+3] 
    return vec 
x=arange(0,0.6,0.1)
v0=[1,2]
vsol=odeint(fun,v0,x) 
plot(x,vsol,'o')
grid(True) 
show()