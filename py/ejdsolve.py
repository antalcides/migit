#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Tue Oct 20 20:50:00 2015

Creado por: antalcides
"""
from sympy import*
x=Symbol('x')
y=Function('y') 
dsolve(Derivative(y(x),x,x)-Derivative(y(x),x)-x+y(x)+1) 
""" la solución es :
y(x) == x + (C1*sin(sqrt(3)*x/2) + C2*cos(sqrt(3)*x/2))*sqrt(exp(x))
"""
