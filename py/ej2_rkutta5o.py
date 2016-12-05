#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Thu Oct 22 08:52:56 2015

Creado por: antalcides
"""

"""
Integrate the moderately stiff problem
y =−(19/4)y − 10y'
y(0) = −9
y (0) = 0
from x = 0 to 10 with the adaptive Runge–Kutta method and plot the results
"""

from numpy import*
from run_kut5 import *
from printSoln import *
import matplotlib.pyplot as plt
def F(x,y):
    F = zeros(2)
    F[0] = y[1]
    F[1] = -4.75*y[0] - 10.0*y[1]
    return F
x = 0.0
xStop = 10.0
y = array([-9.0, 0.0])
h = 0.1
freq = 10
X,Y = integrate(F,x,y,xStop,h,1.0e-3)
printSoln(X,Y,freq)
u = linspace(0,10,13)
v = -9*cos((sqrt(19)/2)*u)
plot(X,Y[:,1],'og')
plot(X,Y[:,0], '*r')
plot(u,u,'--b')
plt.legend((r"$y'$",r"$y$",'y-exacta'))
grid(True)
xlabel(r'$x$')
