# -*- coding: utf-8 -*-
"""
Created on Mon Oct 19 15:38:46 2015

@author: antalcides
"""
#from  numpy import*
from ForwardEuler import*

#import pylab  as lab
#----------------------- Metodo de Euler --------------------
#==============================================================================
# def ForwardEuler(f, dt, u0, T):
#     """Integra u'=f(u,t), u(0)=u0, en los pasos que indica  dt sobre t=T."""
#     u = []; t = [] # u[k] es la solución en el tiempo t[k]
#     u.append(u0)
#     t.append(0)
#     n = int(round(T/dt))
#     for k in range(n):
#         unew = u[k] + dt*f(u[k], t[k])
#         u.append(unew)
#         tnew = t[-1] + dt
#         t.append(tnew)
#     return numpy.array(u), numpy.array(t)
#==============================================================================
#---------------------- ejemplo
def _f1(u, t):
    return 0.2 + (u - _u_solution_f1(t))**4
def _u_solution_f1(t):
    return 0.2*t + 3
# compare la solucion numerica y la exacta:
u0 = 3
dt = 0.4
T = 3
method = ForwardEuler(_f1, dt)
method.set_initial_condition(u0, 0)
u, t = method.solve(T)
u_exact = _u_solution_f1(t)
print 'Numerical:\n', u
print 'Exact:', '\n', u_exact
