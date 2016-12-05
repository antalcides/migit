# -*- coding: utf-8 -*-
"""
Created on Mon Oct 19 22:40:58 2015

@author: antalcides
"""

from ODESolver import*
from RungeKutta4 import* 
from ForwardEuler import*
def f_wrapper(u, t):
        return numpy.asarray(f(u, t), float)
        self.f = f_wrapper
        # or just
        self.f = lambda u, t: numpy.asarray(f(u, t), float) 
def _f1(u, t):
    return 0.2 + (u - _u_solution_f1(t))**5
def _u_solution_f1(t):
    """Exact u(t) corresponding to _f1 above."""
    return 0.2*t + 3
def _verify(f, exact):
    u0 = 3; dt = 0.4; T = 2.8
    for Method_class in ForwardEuler, RungeKutta4:
        method = Method_class(f, dt)
        method.set_initial_condition(u0)
        u, t = method.solve(T)
        print Method_class.__name__, ':\n', u
    u_exact = exact(t)
    print 'Exact:\n', u_exact
    print 'Tiempo:\n', t
if __name__ == '__main__':
    _verify(_f1, _u_solution_f1)