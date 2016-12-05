#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Tue Oct 20 21:55:39 2015

Creado por: antalcides
"""



"""
Resolvemos el siguiente problema por diferencias finitas:
y’’ - y’ + y - 2e^x - 3 = 0, y’(0) = 0.5, y(1) = 5, 0 <= x <= 1
Por simplicidad, consideremos que h = 0.25
Este es un enfoque más general para resolver ecuaciones diferenciales ordinarias con condiciones en los bordes. Consiste en sustituir las derivadas por aproximaciones de diferencias finitas. La ecuación resultante se denomina ecuación de diferencias y puede resolverse por métodos algebraicos.
Esta es ahora una ecuación diferencial de segundo orden con condiciones en el inicio.
Es importante usar en la sustitución aproximaciones del mismo orden para las derivadas, de tal manera que la ecuación de diferencias tenga consistencia en el error de truncamiento.
Aproximaciones de diferencias finitas de segundo orden O(h^2) conocidas:
i) y’_i = (y_(i+1)-y_(i-1))/2h + O(h^2)
ii) y"_i = (y_(i+1)-2y_i+y_(i-1))/h^2
En nuestro caso obtenemos la solución:
(2+h)y_(i-1)+(2h^2-4)y_i +(2-h)y_(i+1)=4(h^2)exp(x_i)+6h^2, i=1,2,3,...,n-1
Py_(i-1)+ Qyi +Ry(i+1) = S,  i=1,2,3,...,n-1
La slucuión analítica es:
y(x) == (C1*sin(sqrt(3)*x/2) + C2*cos(sqrt(3)*x/2))*sqrt(exp(x)) + 2*exp(x) + 3

"""
def tridiagonal(a, b, c, d): 
    n=len(d) 
    w=[b[0]] 
    g=[d[0]/w[0]] 
    for i in range(1,n): 
        w=w+[b[i]-a[i]*c[i-1]/w[i-1]] 
        g=g+[(d[i]-a[i]*g[i-1])/w[i]] 
    x=[] 
    for i in range(n): 
        x=x+[0]     
    x[n-1]=g[n-1] 
    for i in range(n-2,-1,-1): 
        t=x[i+1] 
        x[i]=g[i]-c[i]*t/w[i] 
    return x 
def edodif(P,Q,R,S,x0,y0,xn,yn,n): 
    h=float((xn-x0))/n 
    u=[];a=[];b=[];c=[];d=[] 
    for i in range(0,n-1): 
        x=x0+h*i 
        a=a+[P(x,h)] #diagonales del sistema tridiagonal 
        b=b+[Q(x,h)] 
        c=c+[R(x,h)] 
        d=d+[S(x,h)] 
        u=u+[x] 
    d[0]=d[0]-a[0]*y0 #corrección para la primera ecuación 
    d[n-2]=d[n-2]-c[n-2]*yn #corrección para la última ecuación 
    v=tridiagonal(a,b,c,d) 
    return [u,v] 
from pylab import*
def P(x,h):
    return (2+h)
def Q(x,h):
    return (2*h**2-4)
def R(x,h):
    return (2-h)
def S(x,h):
    return (4*h**2*exp(x)+6*h**2)
[u,v]=edodif(P,Q,R,S,0,1,1,5,20)
plot(u,v,'ob')
title(u'Gráfica para diferencias finitas')
grid(True) 
show()  
