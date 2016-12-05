#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Fri Oct 23 19:27:13 2015

Creado por: antalcides
"""
"""
The differential equations governing the loop current i and the charge q on the capacitor of the electric circuit shown are
L(di/dt) + Ri +(q/C) = E(t), dq/dt =i
If the applied voltage E is suddenly increased from zero to 9 V, plot the resulting loop current during the first 10 s. Use R = 1.0 , L = 2 H, and C = 0.45 F.

"""
from bulStoer import *
from numpy import array,zeros
from printSoln import *
def F(x,y):
    F = zeros(2)
    F[0] = y[1]
    F[1] =(-y[1] - y[0]/0.45 + 9.0)/2.0
    return F
H = 0.2
xStop = 10.0
x = 0.0
y = array([0.0, 0.0])
X,Y = bulStoer(F,x,y,xStop,H)
printSoln(X,Y,1)
from pylab import*
#plot(X,Y[:,0],'or')
plot(X,Y[:,1],'-ob')
#legend(('$q(C)$', r'$i(A)$'))
legend( (r'$i(A)$'))
xlabel(r'$t(s)$')
ylabel(r'$i(A)$')
grid(True)

