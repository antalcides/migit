#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Wed Oct 21 09:32:05 2015

Creado por: antalcides
"""
"""
Lotka-Volterra model
x˙=kx−axy
y˙=−ly+bxy
"""
from scipy.integrate import odeint
import numpy as np
from matplotlib import pyplot as plt
#matplotlib inline  

def plotODE(field=None,t0=0.0,t1=1.0,p0s=None, stepsCount=100):
    for val in p0s:
        times = np.linspace(t0, t1, 100)
        sol = odeint(field, val, times)
        solT = sol.transpose()
        xs = solT[0]
        ys = solT[1]
        plt.plot(xs, ys)
# Lotka-Volterra vector field
def v(p,t):
    x = p[0]
    y = p[1]
    return [k*x-a*x*y,-l*y+b*x*y]



k = 1.0
l = 1.0
a = .6
b = .5

xp = l/b # 
yp = k/a #
ic = [[xp,.5],[xp,1.2],[xp,1.5],[xp,yp-.05]] #Initial conditions

plotODE(field=v,t0=0.0,t1=10.0,p0s=ic)


