#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Tue Oct 20 20:21:36 2015

Creado por: antalcides
"""
"""
Calcule un punto de la solución de la siguiente ecuación diferencial de segundo
orden con condiciones en el inicio, con la fórmula de Runge-Kutta de cuarto orden, h = 0.1
y’’ – y’ – x + y + 1 = 0, y(0) = 1, y’(0) = 2
Solución
Mediante la sustitución z = y’ se obtiene
z’ – z – x + y + 1 = 0
Constituyen un sistema de dos ecuaciones diferenciales de primer orden que se puede
escribir
y’ = f(x,y,z) = z, y(0) = 1
z’ = g(x,y,z) = x – y + z – 1, z(0) = 2
"""
from numpy import* 
from pylab import* 
from scipy.integrate import odeint 
def fun(v0,x):  
    y=v0[0] 
    z=v0[1] 
    vec=[z,x-y+z-1] 
    return vec 
x=arange(0,2.1,0.1)
v0=[1,2]
vsol=odeint(fun,v0,x) 
plot(x,vsol,'o')
grid(True) 
show()