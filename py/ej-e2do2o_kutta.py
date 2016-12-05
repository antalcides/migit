#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Tue Oct 20 20:01:39 2015

Creado por: antalcides
"""
"""
Resolvemos el siguiente problema por Runge Kuta cuarto orden:
y’’ - y’ + y - 2e^x - 3 = 0, y’(0) = 0.5, y(1) = 5, 0 <= x <= 1
Por simplicidad, consideremos que h = 0.25
Esta es ahora una ecuación diferencial de segundo orden con condiciones en el inicio, la cual se puede re-escribir como dos ecuaciones diferenciales de primer orden:
y’ = f(x,y,z) = z, y(0) = 1
z’ = g(x,y,z) = 2e^x - y + z + 3, z(0) = 1
Aquí se puede aplicar alguno de los métodos estudiados (Heun, Runge-Kutta, etc.). 
El cálculo debe continuar hasta llegar al otro extremo del intervalo de interés. Entonces se debe comparar el resultado obtenido en el extremo derecho con el dato dado para ese borde: y(1) = 5 .
Esto permite corregir la condición inicial supuesta y volver a calcular todo nuevamente. Este procedimiento se puede repetir varias veces.
Realizaremos tres intentos con el método de Runge-Kutta de cuarto
orden probando con valores iniciales z(0) = y’(0) = 1, 0.5, 0.8
la solución analítica es:
y(x) == (C1*sin(sqrt(3)*x/2) + C2*cos(sqrt(3)*x/2))*sqrt(exp(x)) + 2*exp(x) + 3
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
    return (2*exp(x)-y+z+3)
[u1,v1,w1]=rungekutta2(f,g,0,1,1,0.05,20)
[u05,v05,w05]=rungekutta2(f,g,0,1,0.5,0.05,20)
[u057,v057,w057]=rungekutta2(f,g,0,1,0.5765,0.05,20)
plot(u1,v1,'*k')
plot(u1,w1,'*k')
plot(u05,v05,'+r')
plot(u05,w05,'+r')
plot(u057,v057,'og')
plot(u05,w057,'og')
grid(True)
show()  
print v1[19] 
print v05[19]
print v057[19] 


