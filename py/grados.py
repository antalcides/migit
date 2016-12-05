# -*- coding: utf-8 -*-
"""
Created on Fri Oct 16 13:07:37 2015

@author: antalcides
"""
import pylab  as lab
print '--------------------------'
C = -20 
dC = 5 
print '   C     F '
while C <= 40:
    F = (9.0/5)*C + 32
    #print C, F
        #C = C + dC # también se puede usar C += dC
    C += dC
    print '%5d %5.1f' %(C, F)
print '--------------------------'
