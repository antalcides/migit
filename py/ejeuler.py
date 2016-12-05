# -*- coding: utf-8 -*-
"""
Created on Mon Oct 19 15:38:46 2015

@author: antalcides
"""
#from  numpy import*

import  numpy as numpy
#import pylab  as lab
#----------------------- Metodo de Euler --------------------
def ForwardEuler(f, dt, u0, T):
    """Integra u'=f(u,t), u(0)=u0, en los pasos que indica  dt sobre t=T."""
    u = []; t = [] # u[k] es la solución en el tiempo t[k]
    u.append(u0)
    t.append(0)
    n = int(round(T/dt))
    for k in range(n):
        unew = u[k] + dt*f(u[k], t[k])
        u.append(unew)
        tnew = t[-1] + dt
        t.append(tnew)
    return numpy.array(u), numpy.array(t)
#---------------------- ejemplo
def f(u, t):
    return u
u0 = 1
T = 3
dt = 0.1
u, t = ForwardEuler(f, dt, u0, T)
# compare numerical solution and exact solution in a plot:
from scitools.std import plot, exp
u_exact = exp(t)
plot(t, u, 'r-', t, u_exact, 'b-',
     xlabel='t', ylabel='u', legend=('numerical', 'exact'),
     title="Solution of the ODE u'=u, u(0)=1")
