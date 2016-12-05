# -*- coding: utf-8 -*-
"""
Created on Mon Oct 19 17:40:06 2015

@author: antalcides
"""
import  numpy as numpy
class ForwardEuler:
    """
    Class for solving an ODE,
      du/dt = f(u, t)
    by the ForwardEuler method.
    Class attributes:
    t: array of time values
    u: array of solution values (at time points t)
    k: step number of the most recently computed solution
    f: callable object implementing f(u, t)
    dt: time step (assumed constant)
    """
    def __init__(self, f, dt):
        self.f, self.dt = f, dt
    def set_initial_condition(self, u0, t0=0):
        self.u = []
        # u[k] is solution at time t[k]
        self.t = []
        # time levels in the solution process
        self.u.append(float(u0))
        self.t.append(float(t0))
        self.k = 0 # time level counter
    def solve(self, N, terminate=None):
        if terminate is None:
            terminate = lambda u, t, k: False
        self.k = 0
        while self.k < N and \
            not terminate(self.u, self.t, self.k):
            unew = self.advance()
            self.u.append(unew)
            tnew = self.t[-1] + self.dt
            self.t.append(tnew)
            self.k += 1
        return numpy.array(self.u), numpy.array(self.t)
    def advance(self):
        """Advance the solution one time step."""
        # load attributes into local variables to
        # obtain a formula that is as close as possible
        # to the mathematical notation:
        u, dt, f, k, t = \
            self.u, self.dt, self.f, self.k, self.t[-1]
        unew = u[k] + dt*f(u[k], t)
        return unew
       