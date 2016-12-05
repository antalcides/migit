#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Fri Oct 23 15:20:35 2015

Creado por: antalcides
"""
"""
The displacement v of the simply supported beam can be obtained by solving the boundary value problem
(d^4v/dx^4) = (w_0 x)/(EIL), v = (d^2v)/(dx^2) = 0 at x = 0 and x = L 
where EI is the bending rigidity. Determine by numerical integration the slopes at the two ends and the displacement at mid-span.
"""
from numpy import zeros,array
from bulStoer import *
from newtonRaphson2 import *
from printSoln import *
def initCond(u): # Initial values of [y,y’,y",y"’];
# use ’u’ if unknown
    return array([0.0, u[0], 0.0, u[1]])
def r(u): # Boundary condition residuals--see Eq. (8.7)
    r = zeros(len(u))
    X,Y = bulStoer(F,xStart,initCond(u),xStop,H)
    y = Y[len(Y) - 1]
    r[0] = y[0]
    r[1] = y[2]
    return r
def F(x,y): # First-order differential equations
    F = zeros(4)
    F[0] = y[1]
    F[1] = y[2]
    F[2] = y[3]
    F[3] = x
    return F
xStart = 0.0 # Start of integration
xStop = 1.0 # End of integration
u = array([0.0, 1.0]) # Initial guess for {u}
H = 0.5 # Printout increment
freq = 1 # Printout frequency
u = newtonRaphson2(r,u,1.0e-4)
X,Y = bulStoer(F,xStart,initCond(u),xStop,H)
printSoln(X,Y,freq)
from pylab import*
plot(X,Y[:,0],'or')
plot(X,Y[:,1],'ob')
legend(('Y0', 'Y1'))

