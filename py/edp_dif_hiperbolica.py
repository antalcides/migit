#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Wed Oct 21 13:05:48 2015

Creado por: antalcides
"""
"""
Ecuaciones diferenciales parciales de tipo hiperbólico
En este tipo de ecuaciones el dominio está abierto en uno de los bordes Para aplicar el
método de diferencias finitas usaremos un ejemplo particular para posteriormente interpretar
los resultados obtenidos.
Ejemplo. Ecuación de la onda en una dimensión:
D^2u/Dt^2 = (c^2)D^2u/Dx^2
 u(i-1,j) + u_(i+1,j) - u_(i,j-1) + u_(i,j+1)  = 0, i= 1, 2, 3, 4; j=1,2,3,...

"""

# Método de Diferencias Finitas explícito: EDP Hiperbólica 
 
from numpy import* 
from pylab import*
from numarray import* 
m=11                               # Número de puntos en x 
n=10                               # Número de niveles en t 
c=2                                # dato especificado 
L=1                                # longitud 
dx=float(L/(m-1))                         # incremento 
dt=float(sqrt(dx**2/c**2))               # para cumplir la condición  
U0=zeros([m])                      # Extremos fijos 
 
x=0 
for i in range(1,m-1):         # Nivel inicial 
    x=x+dx 
    if x<float(L/2): 
 
 
 
 
        U0[i]=-0.5*x   
 # Expresión para el desplazamiento 
    else: 
        U0[i]= 0.5*(x-1) 
 
U1=[U0[0]]                         # Primer nivel 
for i in range (1,m-1): 
   U1=U1 + [0.5*(U0[i-1]+U0[i+1])] 
U1=U1+[U0[m-1]]                     
 
for j in range(1,n+1):                  # Siguientes niveles 
    Uj=[U1[0]] 
    for i in range(1,m-1): 
         Uj=Uj + [U1[i+1]+U1[i-1]-U0[i]] 
    Uj=Uj + [U1[m-1]] 
#==============================================================================
    U0=U1.copy()                  # Actualizar niveles anteriores 
    U1=Uj.copy() 
#==============================================================================
     
    # Mostrar la solución en cada nivel  
    print('%4d'%j,[float('%5.2f' % (Uj[j])) for j in range(m)]) 
 
# Mostrar el gráfico de la solución en el último nivel  
x=[] 
for i in range(m): 
    x=x+[i*dx]                  # Coordenadas para el gráfico 
 
grid(True) 
plot(x,Uj,'or')   
 
     # Graficar puntos y cuerda 
plot(x,Uj,'-r') 
show()

"""
En el programa anterior debe hacerse la siguiente sustitución en las líneas para el
desplazamiento inicial de la cuerda. Adicionalmente cambiar n = 14
for i in range(1,m-1):          
    x=x+dx 
    if x<L/4: 
        U0[i]=-x 
    else: 
        U0[i]= 1/3*(x-1) 

"""