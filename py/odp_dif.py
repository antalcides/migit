#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Wed Oct 21 11:39:19 2015

Creado por: antalcides
"""
"""
Resolver computacionalmente la siguiente ecuación diferencial parcial con una
derivada en el borde izquierdo
D^2u/Dx^2 = kDu/Dt, 0 <= x <= 1, t >= 0
Du(0,t)/Dx = -5, t >= 0
u(1,t) = 60, t >= 0 
x(x,0) = 40, 0 <= x <= 10 <= x <= 1
dx = 0.1, dt = 0.1, k = 4.

"""

# Solución de una EDP con una dervada en un borde 
#from tridiagonal import* 
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
def edpdifpid(P,Q,R,U,der0,dx,m): 
# Método de Diferencias Finitas Implícito 
    a=[];b=[];c=[];d=[] 
    for i in range(m-1): 
        a=a+[P] 
        b=b+[Q] 
        c=c+[R] 
        d=d+[-U[i+1]] 
    c[0]=P+R; 
    d[0]=d[0]+2*dx*P*der0 
    d[m-2]=d[m-2]-c[m-2]*U[m-1] 
    u=tridiagonal(a,b,c,d) 
    U=u+[U[m-1]] 
    return U 
 
from pylab import* 
m=11    # Número ecuaciones: m‐1 
n=50    # Número de niveles en t 
der0=-5 # Derivada en el borde izquierdo 
Tb=60   # Condiciones en los bordes 
To=40   # Condición en el inicio 
dx=0.1  # incrementos 
dt=0.1        
  
L=1     # longitud 
k=4     # dato especificado 
U=[]    # Asignación inicial 
for i in range(m-1): 
   U=U+[To]                
U=U+[Tb] 
lamb=dt/(k*dx**2) 
P=lamb 
Q=-1-2*lamb 
R=lamb 
title(u'Curvas de distribución térmica'); 
xlabel('X (distancia)'); 
ylabel('U (temperatura)') 
x=[] 
for i in range(m): 
    x=x+[i*dx] # Coordenadas para el gráfico 
plot(x,U,'or') # Distribución inicial 
for j in range(n): 
    U=edpdifpid(P,Q,R,U,der0,dx,m) 
    plot(x,U,'-r'); # curvas cada 5 niveles de t 
    plot(x,U,'.r')     
grid(True) 
show()
