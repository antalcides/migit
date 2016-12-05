#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Wed Oct 21 11:59:59 2015

Creado por: antalcides
"""
"""
Resolver la ecuación de difusión en dos dimensiones:
D^2u/Dx^2 + D^2u/Dy^2 = 0 
Suponer que u es una función que depende de x, y, en donde u representa valores de
temperatura, x, y representan posición.
Elegimos las siguientes aproximaciones de diferencias finitas para sustituir las derivadas de la ecuación diferencial:
i) D^2u_(i,j)/Dx^2 = (u_(i+1,j) - u_(i,j) + u_(i-1,j))/(dx)^2 + O(dx)^2
ii) D^2u_(i,j)/Dy^2 = (u_(i,j+1) - u_(i,j) + u_(i,j-1))/(dy)^2 + O(dy)^2.
A partir de estas haciendo dx = dy y simplificando, se obtiene:
u(i-1,j) + u_(i+1,j) + u_(i,j-1) + u_(i,j+1) - 4u_(i,j) = 0, i= 1, 2, 3; j=1,2,
quedando la formula iterativa para cada punto de la malla:
(u_(i,j))^k = (1/4)((u(i-1,j))^k + (u_(i+1,j))^k + (u_(i,j-1))^k + (u_(i,j+1)^k), k= 1,2,3, ...

"""

# Programa para resolver una EDP Elíptica 
# con condiciones constantes en los bordes 
from numpy import* 
Ta=60;Tb=60;Tc=50;Td=70    # Bordes izquierdo, derecho, abajo, arriba 
n=10                       # Puntos interiores en dirección hor. (X) 
m=10                       # Puntos interiores en dirección vert.(Y) 
miter=100                  # Máximo de iteraciones 
e=0.001                    # Error de truncamiento relativo 0.1% 
u=zeros([n+2,m+2]) 
for i in range(n+2): 
    u[i][0]=Tc 
    u[i][m+1]=Td 
for j in range(m+2): 
    u[0][j]=Ta 
    u[n+1][j]=Tb 
p=0.25*(Ta+Tb+Tc+Td)      # valor inicial interior promedio 
for i in range(1,n-1): 
    for j in range(1,m-1): 
        u[i][j]=p 
k=0 
 
 
 
 
 # conteo de iteraciones 
converge=0   
 
 
 # señal de convergencia 
while k<miter and converge==0: 
      k=k+1 
      t=u.copy() 
      for i in range(1,n+1): 
          for j in range(1,m+1): 
              u[i][j]=0.25*(u[i-1][j]+u[i+1][j]+u[i][j+1]+u[i][j-1]) 
      if linalg.norm((u-t),inf)/linalg.norm(u,inf)<e: 
          converge=1 
 
if converge==1: 
    for i in range(n+2):   
        # Malla con la solución final 
        print([float('%5.2f' % (u[i][j])) for j in range(m+2)]) 
                       
    print('Conteo de iteraciones: ',k)    # Conteo de iteraciones  
 
    from pylab import*                   
    from mpl_toolkits.mplot3d import Axes3D      # Gráfico 3D 
    fig=figure() 
    ax=Axes3D(fig) 
    x=arange(0,1.2,0.1) 
    y=arange(0,1.2,0.1) 
    X,Y=meshgrid(x,y) 
    ax.plot_surface(X,Y,u,rstride=1,cstride=1,cmap='hot') 
    show() 
 
else: 
    print('No converge') 

