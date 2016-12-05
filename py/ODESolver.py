# -*- coding: utf-8 -*-
"""
Created on Mon Oct 19 21:44:39 2015

@author: antalcides
"""
import  numpy as numpy
class ODESolver:
    
    def __init__(self, f, dt):
        #self.f = f
        self.f = lambda u, t: numpy.asarray(f(u, t), float) 
        self.dt = dt
          
    def advance(self):
        """Advance solution one time step."""
        raise NotImplementedError
    
    def set_initial_condition(self, u0, t0=0):
        self.u = [] # u[k] is solution at time t[k]
        self.t = [] # time levels in the solution process
        self.u.append(u0)
        self.t.append(float(t0))
        self.k = 0 # time level counter (k in formulas)
    def solve(self, T):
        """Advance solution in time until t <= T."""
        tnew = 0
        while tnew <= T:
            unew = self.advance()
            self.u.append(unew)
            tnew = self.t[-1] + self.dt
            self.t.append(tnew)
            self.k += 1
        return numpy.array(self.u), numpy.array(self.t)
        
    