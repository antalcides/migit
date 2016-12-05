# -*- coding: utf-8 -*-
"""
Created on Mon Sep 28 12:30:03 2015

@author: antalcides
"""

from math import *
import numpy as np
import matplotlib.pylab as plt
#gravity
g = 9.8
#initial height
h0 = 1
wallHeight = 2
distance = 10
Vy0 = sqrt(2*g*wallHeight)


#now we calculate the time...
time = 2*Vy0/g
#the other solution is time = 0


#now we calculate the initial X velocity


Vx0 = distance/time
alpha = atan(Vx0/Vy0)
V0 = Vx0/cos(alpha)


#Results...
print "la velocidad inicial en el eje y es ",Vy0, "m/s"
print "la velocidad inicical en el eje x es ", Vx0, "m/s"
print "el angulo es ", alpha, "rads"
print "la velocidad incial en módulo és ", V0, "m/s"
t = np.linspace(0, time, 100)
y = h0+Vy0*t-0.5*g*(t**2)
plt.plot(t,y)
plt.show()