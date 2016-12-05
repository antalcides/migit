#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Thu Oct 22 08:52:56 2015

Creado por: antalcides
"""

"""
The aerodynamic drag force acting on a certain object in free fall can be approximated by
F_ D = av^2exp(−by)
where
v = velocity of the object in m/s
y = elevation of the object in meters
a = 7.45 kg/m
b = 10.53 × 10^−5 m^−1
The exponential term accounts for the change of air density with elevation. The differential equation describing the fall is
my"= −mg + F_ D
where g = 9.80665 m/s^2 and m = 114 kg is the mass of the object. If the object is
released at an elevation of 9 km, use the adaptive Runge–Kutta method to determine its elevation and speed after a 10-s fall.
The differential equation and the initial conditions are
y" = -9.80665 + (7.45/114)(y')^2exp(-10.53×10^-5y)
y(0) = 9000m y'(0) = 0
"""

from numpy import array,zeros
from run_kut5 import *
from printSoln import *
from math import exp
def F(x,y):
    F = zeros(2)
    F[0] = y[1]
    F[1] = -9.80665 + 65.351e-3 * y[1]**2 * exp(-10.53e-5*y[0])
    return F
x = 0.0
xStop = 10.0
y = array([9000, 0.0])
h = 0.5
freq = 1
X,Y = integrate(F,x,y,xStop,h,1.0e-2)
printSoln(X,Y,freq)
plot(X,X,'og')