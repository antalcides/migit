# -*- coding: utf-8 -*-
"""
Created on Mon Oct 19 22:05:20 2015

@author: antalcides
"""
class ForwardEuler(ODESolver):
    def advance(self):
        u, dt, f, k, t = \
            self.u, self.dt, self.f, self.k, self.t[-1]
        unew = u[k] + dt*f(u[k], t)
        return unew
