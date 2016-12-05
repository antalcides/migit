# -*- coding: utf-8 -*-
"""
Editor de Spyder

Este archivo temporal se encuentra aqui:
/home/aolivo/.spyder2/.temp.py
"""

import numpy as np
from sympy import *
M = np.random.randint(-20,20, size=(4,4))
R = np.linalg.det(M)
   # Funcion encargada de imprimir una matriz
def printMatrix(M):
    print(r' $\displaystyle \begin{pmatrix}' )
    for i in range(len(M)):
            for j in range(len(M[0])):
               print(latex((M[i][j])))
               if (j != len(M)-1):
                print ('&')
            print (r'\\')
    print(r'\end{pmatrix}$')
         # Funcion encargada de multiplicar dos matrices
def multMatrix(A,B):
    printMatrix(A.dot(B))
A = np.random.randint(-5,10, size=(4,4))
B = np.random.randint(-10,10, size=(4,4))
printMatrix(M)
lo, hi = 1, 6
print(r"\begin{tabular}{c|c}")
print(r"$m$ & $2^m$ \\ \hline")
for m in range(lo, hi + 1):
    print(r"%d & %d \\" % (m, 2**m))
print(r"\end{tabular}")
print(r"\begin{tabular}{c|c}")
print(r"$m$ & $2^m$ \\ \hline")
print(r"%d & %d \\" % (1, 2**1))
print(r"%d & %d \\" % (2, 2**2))
print(r"%d & %d \\" % (3, 2**3))
print(r"%d & %d \\" % (4, 2**4))
print(r"\end{tabular}")
# definiendo una funcion
from sympy import*
var("x, y")
binomials = []
for m in range(3, 6):
    binomials.append((x + y)**m)
print(r"\begin{align*}")
for expr in binomials:
    print(r"%s &= %s\\" % (latex(expr), latex(expand(expr))))
print(r"\end{align*}")
#derivadas
functions = [sin(x), cos(x), tan(x)]
print(r"\begin{align*}")
for f in functions:
    d = Derivative(f, x)
    print(latex(d) + "&=" + latex(d.doit()) + r"\\")
print(r"\end{align*}")
#Integrales
functions = [sin(x), cos(x), tan(x)]
print(r"\begin{align*}")
for f in functions:
    i = Integral(f, x)
    print(latex(i) + "&=" + latex(i.doit()) + r"\\")
print(r"\end{align*}")

#integracion numerica
import scipy.integrate
l = lambda x : exp(-x**2)
I =scipy.integrate.quad(l, 0, 1)
scipy.integrate.quad(lambda x : exp(-x**2), 0, 1)
