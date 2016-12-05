# -*- coding: utf-8 -*-
"""
Created on Wed Apr 20 22:01:50 2016

@author: aolivo
"""

# Solucion de Ecuaciones diferenciales simbolicas de primer ordenpython
from sympy import *
x, y = symbols("x y")

# Definicion de E.D a resolver: y' = y*x*sin(x)
eq = y(x).diff(x)-y(x)*x*sin(x)
sol=dsolve(eq, y(x)) 
print sol # imprime en pantalla
# Otra manera y desplegando mas informacion de la EDOpython
from sympy import *
from sympy import init_printing # para mejor despliege de la EDO
x, y = symbols("x y")
f, g = map(Function, 'fg')
# Definicion de E.D a resolver: y' = y*x*sin(x)
eq = Eq(Derivative(f(x),x), f(x)*x*sin(x)) # otra manera de definir la EDO
sol=dsolve(eq, f(x)) 
print sol