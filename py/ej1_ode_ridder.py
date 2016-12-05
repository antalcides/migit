#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Fri Oct 23 01:28:28 2015

Creado por: antalcides
"""
"""
Solve the boundary value problem
y" + 3yy" = 0
y(0) = 0
y(2) = 1
"""
from numpy import* 
from run_kut4 import *
from ridder import *
from printSoln import *
from matplotlib import *
def initCond(u): # Init. values of [y,y’]; use ’u’ if unknown
    return array([0.0, u])
def r(u):
# Boundary condition residual--see Eq. (8.3)
    X,Y = integrate(F,xStart,initCond(u),xStop,h)
    y = Y[len(Y) - 1]
    r = y[0] - 1.0
    return r
def F(x,y):
# First-order differential equations
    F = zeros(2)
    F[0] = y[1]
    F[1] = -3.0*y[0]*y[1]
    return F
xStart = 0.0 # Start of integration
xStop = 2.0 # End of integration
u1 = 1.0 # 1st trial value of unknown init. cond.
u2 = 2.0 # 2nd trial value of unknown init. cond.
h = 0.1 # Step size
freq = 2 # Printout frequency
u = ridder(r,u1,u2) # Compute the correct initial condition
X,Y = integrate(F,xStart,initCond(u),xStop,h)
from pylab import*
printSoln(X,Y,freq)
plot(X,Y[:,0],'or')
plot(X,Y[:,1],'ob')
legend(('Y0', 'Y1'))
