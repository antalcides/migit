#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Tue Oct 20 17:15:58 2015

Creado por: antalcides
"""
 
def rungekutta(f,x,y,h,m): 
    u=[] 
    v=[] 
    for i in range(m): 
        k1=h*f(x,y) 
        k2=h*f(x+h/2,y+k1/2) 
        k3=h*f(x+h/2,y+k2/2) 
        k4=h*f(x+h,y+k3) 
        r = (1.0/6)*(k1+2*k2+2*k3+k4)
        y =y+ r 
        x=x+h 
        u=u+[x] 
        v=v + [y] 
       
    return [u,v] 
from pylab import* 
#from scitools.std import *

def f(x,y):
    return (y - x**2 + x + 1)     
[u,v]=rungekutta(f,0,1,0.1,20)
print [u,v] 
def y(x):return exp(x) + x**2 + x  #solución
x=arange(0,2.1,0.1)
plot(u,v,'og') 
plot(x,y(x),'--xb')
legend(('Kutta',r'$Anal\'itica$'))
grid(True) 
#plot(u, v, "r-",
#x, y(x), "b-",
#legend=("numerical", "exact"),
#title="dt=%g" % dt
#                   )
show()    


