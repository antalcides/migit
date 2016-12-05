# -*- coding: utf-8 -*-
"""
Created on Mon Oct 19 21:07:00 2015

@author: antalcides
"""
class Logistic:
    """Problem class for a logistic ODE."""
    def __init__(self, alpha, R, u0):
        self.alpha, self.R, self.u0 = alpha, float(R), u0
    def __call__(self, u, t):
        """Return f(u,t) for the logistic ODE."""
        return self.alpha*u*(1 - u/self.R)
    def __str__(self):
        """Return ODE and initial condition."""
        return "u’(t) = %g*u*(1 - u/%g)\nu(0)=%g" % \
               (self.alpha, self.R, self.u0)
