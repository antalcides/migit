#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Tue Oct 20 20:01:39 2015

Creado por: antalcides
"""
"""
Obtenga numéricamente la solución de la ecuación
y’’ + yy’ - x + y - 3 = 0, y(0) = 1, y’(0) = 2, 0≤x≤2
Mediante la sustitución z = y’, se obtiene:
z’ + yz - x + y - 3 = 0
Es un sistema de dos ecuaciones diferenciales de primer orden que se puede escribir
y’ = f(x,y,z) = z, y(0) = 1
z’ = g(x,y,z) = x - y - yz + 3, z(0) = 2
"""
def rungekutta2(f,g,x,y,z,h,m): 
    u=[] 
    v=[] 
    w=[] 
    for i in range(m): 
        k1y=h*f(x,y,z) 
        k1z=h*g(x,y,z) 
        k2y=h*f(x+h/2,y+k1y/2,z+k1z/2) 
        k2z=h*g(x+h/2,y+k1y/2,z+k1z/2) 
        k3y=h*f(x+h/2,y+k2y/2,z+k2z/2) 
        k3z=h*g(x+h/2,y+k2y/2,z+k2z/2) 
        k4y=h*f(x+h,y+k3y,z+k3z) 
        k4z=h*g(x+h,y+k3y,z+k3z) 
        y=y+1.0/6*(k1y+2*k2y+2*k3y+k4y) 
        z=z+1.0/6*(k1z+2*k2z+2*k3z+k4z) 
        x=x+h 
        u=u+[x] 
        v=v+[y] 
        w=w+[z] 
    return [u,v,w] 
from pylab import*
def f(x,y,z):
    return (z) 
def g(x,y,z):
    return (x-y+y*z+3)
[u,v,w]=rungekutta2(f,g,0,1,2,0.1,5)
plot(u,v,'sk')
plot(u,w,'*k')
grid(True)
show()  
    


