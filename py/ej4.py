# -*- coding: utf-8 -*-
"""
Created on Sun Sep 27 02:05:03 2015

@author: antalcides
"""
import matplotlib.pyplot as plt
n = 16
m = 6
plt.figure(figsize=(n*0.2, m*0.2))
plt.gca().axison = False
x = 8
y = 4
plt.fill( (x,x+1,x+1,x), (y,y,y+1,y+1), 'r', linewidth=0)
for i in range(0,n+1):
    ii = (i,i)
    jj = (0,m)
    plt.plot(ii,jj,'0.4', linewidth=0.2)
for j in range(0,m+1):
    ii = (0,n)
    jj = (j,j)
    plt.plot(ii,jj,'0.4', linewidth=0.2)
plt.savefig('myplot.pdf', bbox_inches='tight')
