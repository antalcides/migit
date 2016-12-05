# -*- coding: utf-8 -*-


# Calculo de la matriz de cofactores y matriz adjunta
from sympy import latex, Matrix
from numpy import matrix,zeros,size
from numpy.linalg import det
B=Matrix([[1,2,-1],[0,1,2],[5,1,1]])
A=matrix([[1,2,-1],[0,1,2],[5,1,1]])
MC=Matrix(zeros((3,3))) # Matriz de cofactores
idx=matrix(range(3))
for i in range(size(A,0)):
    for j in range(size(A,1)):
        fidx=idx[idx!=i]
        cidx=idx[idx!=j]
        cof=A[[[fidx[0,0]],[fidx[0,1]]],cidx]
        MC[i,j]=pow(-1,i+j)*det(cof)

MADJ=MC.transpose() # Matriz adjunta 
print(latex(MC, mode='equation'))
print(latex(MADJ, mode='equation'))
print(latex(B, mode='equation'))