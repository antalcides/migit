#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Tue Oct 20 15:57:57 2015

Creado por: antalcides
"""
def euler(f,x0,y0,h,m): 
    u=[] 
    v=[] 
    for i in range(m): 
        y0 = y0 + h * f(x0,y0) 
        x0 = x0 + h 
        u = u + [x0] 
        v = v + [y0] 
    return [u,v] 
from pylab import* 
def f(x,y):
    return (y - x**2 + x + 1) 
     
[u,v]=euler(f,0,1,0.1,20)
plot(u,v,'or') 
def y(x):return exp(x) +x**2 + x  #solución
x=arange(0,2.1,0.1)
plot(x,y(x),'--xb')
legend(('$Euler$', '$Anal\'{i}tica$'))
grid(True) 
show()