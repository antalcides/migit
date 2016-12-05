#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Wed Oct 21 18:33:38 2015

Creado por: antalcides
"""



"""
Dada la ecuación
y' + 4y = x^2, y(0) = 1
determine y(0.1) con el método de Taylor de cuarto orden usando una siple intgración por pasos, también calcule el error estimado. dado que su solución analítica es:
y = (31/32)exp(−4x) + (1/4)x^2 -(1/8)x +(1/32)
"""
from numpy import*
from printSoln import *
from taylor import *
def deriv(x,y):
    D = zeros((4,2))
    D[0] = [x**2 -4*y[1]]
    D[1] = [16*y[1] - 4*x**2 + 2*x]
    D[2] = [-64*y[1] +16*x**2 -8*x +2]
    D[3] = [256*y[1]- 64*x**2 +32*x -8 ]
    return D
x = 0.0 # Start of integration
xStop = 3.0 # End of integration
y = array([1.0, 1.0]) # Initial values of {y}
h = 0.1 # Step size
freq = 1 # Printout frequency
X,Y = taylor(deriv,x,y,xStop,h)
u = frange(0,3,0.1)
def v(u):
    return ((31.0/32)*exp(-4*u) + (1.0/4)*u**2 -(1.0/8)*u +(1.0/32))
printSoln(X,Y,freq)
print u
print v
plot(X,Y[:,0], 'or')
plot(u,v(u), '--g')
#legend(( 'Y1', 'Exacta'))
