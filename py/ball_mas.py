# -*- coding: utf-8 -*-
"""
Created on Fri Oct 16 11:57:16 2015

@author: antalcides
"""

g = 9.81
v0 = 15
theta = 60
x = 0.5
y0 = 1
print """\
v0 = %.1f km/h
theta = %d degrees
y0 = %.1f m
x = %.1f m\
""" %(v0, theta, y0, x)
from math import pi, tan, cos
# convert v0 to m/s and theta to radians:
v0 = v0/3.6
theta = theta*pi/180
y = x*tan(theta) - 1/(2*v0**2)*g*x**2/((cos(theta))**2) + y0
print 'y = %.1f m' % y