# -*- coding: utf-8 -*-
"""
Created on Mon Oct 19 15:23:59 2015

@author: antalcides
"""

def exact(x):
    g = 9.81; y0 = u0[2]
    return x*tan(theta) - g*x**2/(2*v0**2)*1/(cos(theta))**2 + y0
plot(x_values, y_values, "r-",
x_values, exact(x_values), "b-",
legend=("numerical", "exact"),
title="dt=%g" % dt)