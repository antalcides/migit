# -*- coding: utf-8 -*-
"""
Created on Mon Oct 19 22:28:55 2015

@author: antalcides
"""
class RungeKutta4(ODESolver):
    def advance(self):
        u, dt, f, k, t = \
           self.u, self.dt, self.f, self.k, self.t[-1]
        dt2 = dt/2.0
        K1 = dt*f(u[k], t)
        K2 = dt*f(u[k] + 0.5*K1, t + dt2)
        K3 = dt*f(u[k] + 0.5*K2, t + dt2)
        K4 = dt*f(u[k] + K3, t + dt)
        unew = u[k] + (1/6.0)*(K1 + 2*K2 + 2*K3 + K4)
        return unew
