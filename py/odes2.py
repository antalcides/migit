# -*- coding: utf-8 -*-
"""
Created on Mon Oct 19 23:23:11 2015

@author: antalcides
"""
#import interest as method
from ODESolver import *
from scitools.std import *
from ForwardEuler import*
from RungeKutta4 import* 
def f(u, t):
    return u
T = 3
dt = 0.01
method = ForwardEuler(f, dt)
method.set_initial_condition(1.0)
u, t = method.solve(T)
plot(t, u,'b')
#--------------------------------------------
if __name__ == '__main__':
    _verify(_f1, _u_solution_f1)
dt = 1
figure()
for Method_class in ForwardEuler, RungeKutta4:
    method = Method_class(f, dt)
    method.set_initial_condition(1)
    u, t = method.solve(T)
    plot(t, u, )
    #legend('%s' % method.__name__)
    hold('on')
    t = linspace(0, T, 302)
    plot(t, u_exact, '__')
    legend('exact')
#plot(t, u_exact)