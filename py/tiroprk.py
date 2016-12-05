# -*- coding: utf-8 -*-
"""
Created on Mon Oct 19 15:18:11 2015

@author: antalcides
"""
# condiciones iniciales
from ODESolver import*
from RungeKutta4 import*
from scitools.std import *
#from  math import*
#import pylab  as lab
#----------------------- Metodo de Euler --------------------
#def ForwardEuler(f, dt, u0, T):
#    """Integra u’=f(u,t), u(0)=u0, en los pasos que indica  dt sobre t=T."""
#    u = []; t = [] # u[k] es la solución en el tiempo t[k]
#    u.append(u0)
#    t.append(0)
#    n = int(round(T/dt))
#    for k in range(n):
#        unew = u[k] + dt*f(u[k], t[k])
#        u.append(unew)
#        tnew = t[-1] + dt
#        t.append(tnew)
#    return numpy.array(u), numpy.array(t)
#----------------------
def f_wrapper(u, t):
        return numpy.asarray(f(u, t), float)
        self.f = f_wrapper
def f(u, t):
    x, vx, y, vy = u
    g = 9.81
    return [vx, 0, vy, -g]
# solución de las ODE's
v0 = 10
theta = 45*pi/180
u0 = [0, v0*cos(theta), 0, v0*sin(theta)]
T = 3.2
dt = 0.1
method = RungeKutta4(f, dt)
method.set_initial_condition(u0, 0)
u, t = method.solve(T)
# ------------------------------------------
#x_values = u[:,0]
## or (slower):
#x_values = array([x for x, vx, y, vy in u])
#plot(t, x_values)
#--------------------------------------------
#x_values = u[:,0]
#y_values = u[:,2]
#plot(x_values, y_values)
#----------------------------
def exact(x):
    g = 9.81; y0 = u0[2]
    return x*tan(theta) - g*x**2/(2*v0**2)*1/(cos(theta))**2 + y0
plot(x_values, y_values, "r-",
x_values, exact(x_values), "b" "o",
legend=("numerical", "exact"),
title="dt=%g" % dt
                   )
print t
print x_values