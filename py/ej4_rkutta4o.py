#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Wed Oct 21 21:50:17 2015

Creado por: antalcides
"""



"""
Use the  Runge–Kutta method of order 4 to integrate
y" = −(19/4)y −  10y'
y(0) = -9
y'(0) = 0
from x = 0 to 2 in increments of h = 0.25
"""
#!/usr/bin/python
from numpy import array,zeros
from printSoln import *
from run_kut4 import *
from matplotlib import *
def F(x,y):
    F = zeros(2)
    F[0] = y[1]
    F[1] = -(19.0/4)*y[0] - 10*y[1]
    return F
x = 0.0 # Start of integration
xStop = 10.0 # End of integration
y = array([-9, 0]) # Initial values of {y}
h = 0.1 # Step size
freq = 100 # Printout frequency
X,Y = integrate(F,x,y,xStop,h)
printSoln(X,Y,freq)
# -------------------------------------------#
from pylab import*
fig = figure(figsize=(7,5))
ax = fig.add_axes([0.1,0.1,0.88,0.88])
ax.set_ylim(0,4)
ax.set_xlim(-0.5,10)
ax.minorticks_on()
ax.tick_params(axis='both',which='minor',length=3,width=1,labelsize=14)
ax.tick_params(axis='both',which='major',length=5,width=1.5,labelsize=14)
# -------------------------------------------#
plot(X,Y, '--or')
legend(('Y0', 'Y1'))
grid(True) # grilla por defecto
grid(color='k', alpha=1, linestyle='dashed', linewidth=0.5)
#raw_input("Press return to exit")