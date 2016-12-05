# -*- coding: utf-8 -*-
"""
Created on Sat Sep 26 23:45:41 2015

@author: antalcides
"""

import math
def f(x):
   b= math.log(x)
   c= round(b,3)
   return c
lo, hi = 1, 6
k=hi + 1

print(r"\begin{tabular}{|*{"+str(k)+ "}{c|}}")
print(r"\hline")
print(r"$x$")
for m in range(lo, hi + 1):
    ligneH=str(m)
    print("&"+ligneH)
print(r"\\")
print(r"\hline")
print(r"$f(x)$")
for m in range(lo, hi + 1):  
    ligneB=str(f(m))
    print("&"+ligneB)
print(r"\\")
print(r"\hline")
print(r"\end{tabular}")