#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Created on Fri Oct 16 16:44:40 2015

@author: antalcides
"""
from time import*
import numpy as np
import pylab  as lab
g = 9.81; v0 = 30
dt = 0.002
ym = v0**2/(2*g)
tm = (2*v0)/g
def y(t):
    return v0*t - 0.5*g*t**2
def table():
    data = [] # store [t, y] pairs in a nested list
    t = 0
    while y(t) >= -0.001:
        data.append([t, y(t)])
        t += dt
    return data
data = table()
np.savetxt('ball.txt',data)
for t, y in data:
    print '%5.3f   %5.3f' %(t, y) 
    # extract all y values from data:
data1 = np.loadtxt('ball.txt')
lab.plot(data1[:,0], data1[:,1])	

lab.xlabel('t [s]');
lab.ylabel('y [m]');
lab.title(' lanzamiento vertical de un pelota');
lab.grid(True);
lab.savefig('ball.pdf')
lab.show()
t1=clock(); data;
print "este es el tiempo de ejecucion en Python %5.3f" %(t1)