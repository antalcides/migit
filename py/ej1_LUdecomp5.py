#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Fecha de creación: Sat Oct 24 16:46:38 2015

Creado por: antalcides
"""

from numpy import array,ones
from LUdecomp3 import *
d = ones((5))*2.0
c = ones((4))*(-1.0)
b = array([5.0, -5.0, 4.0, -5.0, 5.0])
e = c.copy()
c,d,e = LUdecomp3(c,d,e)
x = LUsolve3(c,d,e,b)
print "\nx =\n",x

