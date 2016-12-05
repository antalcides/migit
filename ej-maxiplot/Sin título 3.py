# -*- coding: utf-8 -*-
"""
Created on Wed Apr 20 18:12:04 2016

@author: aolivo
"""

# -*- coding: utf-8 -*- #!

# -*- coding: utf-8 -*- #!
import numpy as np
import scipy.stats as stats
import matplotlib.pyplot as plt
import seaborn as sns
a = np.arange(16)
poi = stats.poisson
lambda_ = [1.5, 4.25]
# Begin with an empty plot, 5 x 3 inches
plt.clf()
plt.figure(figsize=(5, 3))
plt.bar(a, poi.pmf(a, lambda_[0]),
        label="$\lambda = %.1f$" % lambda_[0],
        alpha=0.60,
        color=sns.color_palette()[0],
        lw=1)
plt.bar(a, poi.pmf(a, lambda_[1]),
        label="$\lambda = %.1f$" % lambda_[1],
        alpha=0.60,
        color=sns.color_palette()[1],
        lw=1)
#plt.xticks(a + 0.4, a)
plt.xticks(a + 0.4, a)
plt.legend()
plt.ylabel("Probabilidad de $k$")
plt.xlabel("$k$")
plt.title("La funcion de masa de probabilidad de una variable  \n" " aleatoria de Poisson para  diferentes valores de "
          "$\lambda$ \n")
# Save the plot as a PDF file
plt.savefig("myplot.pdf", bbox_inches="tight",format="pdf")