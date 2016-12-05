# -*- coding: utf-8 -*-
"""
Created on Mon Oct 19 22:34:17 2015

@author: antalcides
"""
class BackwardEuler(ODESolver):
    def __init__(self, f, dt):
        ODESolver.__init__(self, f, dt)
        # make a sample call to check that f is a scalar function:
        value = f(1,1)
        if not isinstance(value, (int, float)):
           raise ValueError\
           ('f(u,t) must return float/int, not %s' % type(value))
