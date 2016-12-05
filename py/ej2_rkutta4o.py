#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Wed Oct 21 23:34:26 2015

Creado por: antalcides
"""

"""
Use the fourth-order Runge–Kutta method to integrate
y' = 3y − 4e^(−x)
y(0) = 1
from x = 0 to 10 in steps of h = 0.1. Compare the result with the analytical solution y = e^(−x) .

"""

#!/usr/bin/python
## example7_5
from numpy import*
from run_kut4 import *
from printSoln import *
#from math import exp
def F(x,y):
    F = zeros(1)
    F[0] = 3.0*y[0] - 4.0*exp(-x)
    return F
x = 0.0 # Start of integration
xStop = 10.0 # End of integration
y = array([1.0]) # Initial values of {y}
h = 0.1 # Step size
freq = 20 # Printout frequency
X,Y = integrate(F,x,y,xStop,h)


printSoln(X,Y,freq)
U = np.linspace(0, 10, 7)
v = array(V)
u = array(U)
V = (exp(-4*U))*(exp(3*U))
print V
print v
#plt.plot(U, V)
#plot(u,v)
plot(X,Y,'or')
plot(U,V,'--xg')