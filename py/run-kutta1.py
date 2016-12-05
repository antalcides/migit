#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Tue Oct 20 15:30:00 2015

Creado por: antalcides
"""
import numpy as np
"""
Veamos la implementación del método de Euler:
En este código estamos integrando un paso de y. La funcion será una función que se define f(y,t) a partir de x, un array con las correspondientes \bar{y_n}, a, otro array con constantes, y t, t_n.
 """
def Paso_Euler(funcion,x0,y0,t,h):
    xp=funcion(x0,y0,t)
    x2=x0+xp*h
    return x2
"""
Otro método sería el método de Runge-Kutta, que evalua la función f(y,t) en distintos puntos. Dependiendo del numero de puntos que se evaluan tendremos el orden del método.
Ahora veremos la implementación de este método para los casos de orden 2 y 4:
"""
def Paso_RK2(funcion,x0,y0,t,h):
    f1=funcion(x0,y0,t)
    f2=funcion(x0+h*f1,y0,t+h)
    r=x0+0.5*h*(f1+f2)
    return r
     
def Paso_RK4(funcion,x0,y0,t,h):
    f1=funcion(x0,y0,t)
    f2=funcion(x0+0.5*h*f1,y0,t+0.5*h)
    f3=funcion(x0+0.5*h*f2,y0,t+0.5*h)
    f4=funcion(x0+h*f3,y0,t+h)
    r=x0+(h/6.0)*(f1+2.0*f2+2.0*f3+f4)
    return r
"""
Para poder conseguir una integración en todo el intervalo, desarrollamos la siguiente función:
"""
def Solver_explicito_paso_simple(integrador,funcion,x0,y0,h,n,t0):
    resultado=[]
    x=[]
    t=t0
    for i in x0:
        resultado.append([i])
        x.append(0.0)
    for i in range(n):
        for j in range(len(x0)):
            x[j]=resultado[j][-1]
        r=integrador(funcion,x0,y0,t,h)
        for j in range(len(x0)):
            resultado[j].append(r[j])
        t=t+h
        
    return np.array(resultado)
"""
Con Solver_explicito_paso_simple, obtendremos la solución de la ecuación diferencial definida por funcion mediante el método definido por integrador, a partir de un valor inicial x0, un array de constantes a, un paso h, un número de pasos n, y un valor de la variable independiente inicial de t0.

Veamos ahora unos ejemplos:
"""
def f1(x,y0,t):
    r=x[0]*y0[0]+y0[0]
    return np.array([r])
     
r=Solver_explicito_paso_simple(Paso_Euler,f1,np.array([0.0]),np.array([6.0]),0.1,10,0.0)
     
r1=Solver_explicito_paso_simple(Paso_RK2,f1,np.array([0.0]),np.array([6.0]),0.1,10,0.0)
     
r2=Solver_explicito_paso_simple(Paso_RK4,f1,np.array([0.0]),np.array([6.0]),0.1,10,0.0)
#t_e = linspace(0,10,10)
#r_e = (1-np.exp((-6)*t_e))*np.exp((6)*t_e)
import pylab
print r
pylab.plot(r[0],'-+')
pylab.plot(r1[0],'-o')
pylab.plot(r2[0],'-*')
#pylab.plot(t_e,r_e, ':h')
pylab.legend(('Euler','Runge-Kutta2','Runge-Kutta4'))#, 'Exacta'))
pylab.grid(True)
pylab.show()
"""  
En la gráfica podremos comparar el grado de precisión de los distintos métodos.
"""  


