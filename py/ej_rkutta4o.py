#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Wed Oct 21 21:50:17 2015

Creado por: antalcides
"""



"""
Use the  Runge–Kutta method of order 4 to integrate
y" = −0.1y' − x
y(0) = 0
y'(0) = 1
from x = 0 to 2 in increments of h = 0.25
"""
#!/usr/bin/python
from numpy import array,zeros
from printSoln import *
from run_kut4 import *
def F(x,y):
    F = zeros(2)
    F[0] = y[1]
    F[1] = -0.1*y[1] - x
    return F
x = 0.0 # Start of integration
xStop = 2.0 # End of integration
y = array([0.0, 1.0]) # Initial values of {y}
h = 0.25 # Step size
freq = 1 # Printout frequency
X,Y = integrate(F,x,y,xStop,h)
printSoln(X,Y,freq)
plot(X,Y, '--or')

legend(('Y0', 'Y1'))
#raw_input("Press return to exit")