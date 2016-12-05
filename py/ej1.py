# -*- coding: utf-8 -*-
"""
Editor de Spyder

Este archivo temporal se encuentra aquí:
/home/antalcides/.spyder2/.temp.py
"""
lo, hi = 1, 6
print(r"\begin{tabular}{c|c}")
print(r"$m$ & $3^m$\\ \hline")
for m in range(lo, hi + 1):
    print(r"%d & %d \\" % (m, 3**m))
    print(r"\end{tabular}")
    
   
def modulo(a, n):
    return a % n

print(modulo(11, 10))

def sumar(x, y):
    return x+y
print sumar(2,3)

