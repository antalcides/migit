#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Tue Oct 20 17:01:06 2015

Creado por: antalcides
"""
def heun(f,x0,y0,h,m): 
    u=[] 
    v=[] 
    for i in range(m): 
        k1=h*f(x0,y0) 
        k2=h*f(x0+h,y0+k1) 
        y0=y0+0.5*(k1+k2) 
        x0=x0+h 
        u=u+[x0] 
        v=v+[y0]
        return [u,v]
from pylab import* 
def f(x,y):
    return (y - x**2 + x + 1) 
[u,v]=heun(f,0,1,0.1,20)
def y(x):return exp(x) +x**2 + x  #solución
x=arange(0,2.1,0.1)
plot(x,y(x),'--xb')
plot(u,v,'or') 

legend((r'$Anal\'{\i}tica$',r'$Heun$'))
grid(True) 
show()

