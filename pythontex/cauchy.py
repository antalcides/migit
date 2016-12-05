# -*- coding: utf-8 -*-
"""
Created on Wed Apr 20 15:55:14 2016

@author: aolivo
"""
# Problema de Cauchy con el método leapfrog
import numpy as np
import matplotlib.pyplot as plt
from pylab import*
# Matriz del sistema
A = np.array([
    [ 0, 1],
    [-1, 0]
])
# Función
def F(t, u):
    return np.dot(A, u)
def euler_step(t_n0, u_n0, F, dt=0.1):
    """Método Euler explícito."""
    return u_n0 + dt * F(t_n0, u_n0)
def lf_step(t_n1, u_n0, u_n1, F, dt=0.1):
    """Método leapfrog."""
    return u_n0 + 2 * dt * F(t_n1, u_n1)
# Número de pasos
n = 100
# Paso del esquema
dt = 0.1
# Vector solución y vector de tiempos
t = np.linspace(0.0, (n - 1) * dt, n)
x = np.empty(n)
# Condición inicial
x[0] = 1.0
# Vector U^0
u_n0 = np.array([x[0], 0.0])
# Paso 1: Euler explícito
u_n1 = euler_step(t[0], u_n0, F, dt)
x[1] = u_n1[0]  # Primera componente del vector U
# Paso 2: Leapfrog
u_n2 = lf_step(t[1], u_n0, u_n1, F, dt)
x[2] = u_n2[0]
for i in range(3, n):
    u_n0 = u_n1
    u_n1 = u_n2
    u_n2 = lf_step(t[i - 1], u_n0, u_n1, F, dt)
    x[i] = u_n2[0]
# Representación gráfica
plt.plot(t, x)
savefig("myplot2.pdf", bbox_inches="tight")