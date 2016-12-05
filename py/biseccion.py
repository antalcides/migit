# -*- coding: utf-8 -*-
"""
Created on Fri Oct 16 18:13:47 2015

@author: antalcides
"""
import sys
eps = 1E-10
a= eval(raw_input( 'intrduzca el extremo inferior del intervalo: '))
b = eval(raw_input( 'intrduzca el extremo superior del intervalo: '))
g = raw_input('Intrduzca la función: ')
#r = eval(g)

f =lambda x: eval(g)
# = float(f)
fa = f(a)
if fa*f(b) > 0:
    print 'f(x) no cambia de signo en  [%g,%g].' % (a, b)
    sys.exit(1)
i = 0
# iteration counter
while b-a > eps:
    i += 1
    m = (a + b)/2.0
    fm = f(m)
    if fa*fm <= 0:
        b = m # root is in left half of [a,b]
    else:
        a = m # root is in right half of [a,b]
        fa = fm
    print 'Iteración %d: intervalo=[%g, %g]' % (i, a, b)
x = m
# this is the approximate root
print 'La raíz es %5.3f, encontrada en  %d  iteraciones' %(x , i)
print 'f(%g)=%g' % (x, f(x))
