#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Thu Oct 22 01:58:05 2015

Creado por: antalcides
"""

"""
A spacecraft is launched at the altitude H = 772 km above the sea level with the speed v 0 = 6700 m/s in the direction shown. The differential equations describing the motion of the spacecraft are
r" = r(0')^2 - (GM)/r^2, 0" = -(2r'0')/r
where r and θ are the polar coordinates of the spacecraft. The constants involved in the motion are
G = 6.672 × 10 −11 m^ 3 kg^−1s^−2 = universal gravitational constant
M  = 5.9742 × 10 24 kg = mass of the earth
R  = 6378.14 km = radius of the earth at sea level

"""
from numpy import*
from run_kut4 import *
from printSoln import *
def F(x,y):
    F = zeros(4)
    F[0] = y[1]
    F[1] = y[0]*(y[3]**2) - 3.9860e14/(y[0]**2)
    F[2] = y[3]
    F[3] = -2.0*y[1]*y[3]/y[0]
    return F
x = 0.0
xStop = 1200.0
y = array([7.15014e6, 0.0, 0.0, 0.937045e-3])
h = 50.0
freq = 2
X,Y = integrate(F,x,y,xStop,h)
printSoln(X,Y,freq)
plot(X,Y,'--or')
