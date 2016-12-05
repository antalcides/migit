# -*- coding: utf-8 -*-
"""
Created on Wed Apr 20 16:03:30 2016

@author: aolivo
"""

import numpy as np
import matplotlib.pyplot as plt
from pylab import*
x = np.linspace(0, 9, 100)
plt.plot(x, np.exp(x / 3) * np.cos(x) + 10 * np.sin(3 * x), x, x ** 2 / 4)
savefig("myplot4.pdf", bbox_inches="tight")
# definimos la ecuación como una función $f(x) \equiv \displaystyle e^{x / 3} \cos{x} + 10 \sin{3 x} - x^2 / 4 = 0$
def f(x):
    """Ecuación no lineal.
    Asume que se ha importado NumPy de la forma
      import numpy as np
    """
    return np.exp(x / 3.0) * np.cos(x) + 10 * np.sin(3 * x) - x ** 2 / 4
from scipy.optimize import brentq
sol1 = brentq(f, 4.0, 5.0)
print sol1  # 4.40989799172
from scipy.optimize import newton
sol2 = newton(f, 2.0)
print sol2  # 2.17349784856