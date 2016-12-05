# -*- coding: utf-8 -*-
"""
Created on Wed Oct 14 11:51:22 2015

@author: antalcides
"""

v0 = 5
g = 9.81
t = 0.6
y = v0*t - 0.5*g*t**2
print 'En un tiempo de t=%g s, la pelota recorre %.2f m.' % (t, y)