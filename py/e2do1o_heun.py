#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Tue Oct 20 20:01:39 2015

Creado por: antalcides
"""
def heun2(f,g,x,y,z,h,m): 
    u=[] 
    v=[] 
    w=[] 
    for i in range(m): 
        k1y=h*f(x,y,z) 
        k1z=h*g(x,y,z) 
        k2y=h*f(x+h,y+k1y,z+k1z) 
        k2z=h*g(x+h,y+k1y,z+k1z) 
        y=y+0.5*(k1y+k2y) 
        z=z+0.5*(k1z+k2z) 
        x=x+h 
        u=u+[x] 
        v=v+[y] 
        w=w+[z] 
    return [u,v,w] 
from pylab import*
def f(x,y,z):
    return (x+y+z) 
def g(x,y,z):
    return (y-x-z)
[u,v,w]=heun2(f,g,0,1,2,0.1,20)
plot(u,v,'sk')
plot(u,w,'*k')
grid(True)
show()  
    


