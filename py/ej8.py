# -*- coding: utf-8 -*-
"""
Created on Mon Sep 28 12:04:45 2015

@author: antalcides
"""


from matplotlib import cm

from matplotlib.ticker import LinearLocator, FormatStrFormatter

import matplotlib.pyplot as plt

import numpy as np

import sys

fig = plt.figure()

ax = fig.gca(projection='3d')

X = np.arange(-2, 2, 0.1)

Y = np.arange(-2, 2, 0.1)

X, Y = np.meshgrid(X, Y)

R = np.sqrt(X**2 + Y**2)

Z = -np.sin(R)

surf = ax.plot_surface(X, Y, Z, rstride=1, cstride=1, cmap=cm.coolwarm,

linewidth=0, antialiased=False)

ax.set_zlim(-1.01, 1.01)

ax.zaxis.set_major_locator(LinearLocator(10))

ax.zaxis.set_major_formatter(FormatStrFormatter('%.02f'))

fig.colorbar(surf, shrink=0.5, aspect=5)

plt.savefig(sys.argv[1])