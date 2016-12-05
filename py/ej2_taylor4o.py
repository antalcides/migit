#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Wed Oct 21 18:41:12 2015

Creado por: antalcides
"""
"""
Solve
y = −0.1y − x
y(0) = 0
y (0) = 1
from x = 0 to 2 with the Taylor series method of order 4. Use h = 0.25 and utilize the
functions taylor and printSoln .

"""
from numpy import*
from printSoln import *
from taylor import *
def deriv(x,y):
    D = zeros((4,2))
    D[0] = [y[1], -0.1*y[1] - x]
    D[1] = [D[0,1], 0.01*y[1] + 0.1*x - 1.0]
    D[2] = [D[1,1], -0.001*y[1] - 0.01*x + 0.1]
    D[3] = [D[2,1], 0.0001*y[1] + 0.001*x - 0.01]
    return D
x = 0.0 # Start of integration
xStop = 2.0 # End of integration
y = array([0.0, 1.0]) # Initial values of {y}
h = 0.25 # Step size
freq = 1 # Printout frequency
X,Y = taylor(deriv,x,y,xStop,h)
printSoln(X,Y,freq)
from pylab import*
#import matplotlib.ticker as ticker
fig = figure(figsize=(7,5))
ax = fig.add_axes([0.1,0.1,0.88,0.88])
#ax = axes()
ax.set_ylim(-1.2,1.2)
ax.set_xlim(-0.2,2.2)
ax.minorticks_on()
ax.tick_params(axis='both',which='minor',length=3,width=1,labelsize=14)
ax.tick_params(axis='both',which='major',length=5,width=1.5,labelsize=14)
#ax.xaxis.set_major_locator(ticker.MultipleLocator(5))
#ax.xaxis.set_minor_locator(ticker.MultipleLocator(1))
# -------------------------------------------#
plot(X,Y[:,0], '--or')
plot(X,Y[:,1], '--ob')
legend(('Y0', 'Y1'))
#grid(True) # grilla por defecto
grid(True, which='minor')
grid(color='k', alpha=1, linestyle='dashed', linewidth=0.5)
#plot(X,Y)
#legend(('Y0',' Y1'),'loc')



