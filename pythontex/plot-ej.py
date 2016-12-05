# -*- coding: utf-8 -*-
"""
Created on Wed Apr 20 16:14:03 2016

@author: aolivo
"""
import numpy as np
from pylab import*
# Define f(t), the desired function to plot
def f(t):
    return np.cos(2 * pi * t) * np.exp(-t)
# Generate the points (t_i, y_i) to plot
t = linspace(0, 5, 500)
y = f(t)
# Begin with an empty plot, 5 x 3 inches
clf()
figure(figsize=(5, 3))
# Use TeX fonts
rc("text", usetex=True)
# Generate the plot with annotations
plot(t, y)
title("Damped exponential decay")
text(3, 0.15, r"$y = \cos(2 \pi t) e^{-t}$")
xlabel("time (s)")
ylabel("voltage (mV)")
# Save the plot as a PDF file
savefig("myplot5.pdf", bbox_inches="tight")
# Include the plot in the current LaTeX document
print(r"\begin{center}")
print(r"\includegraphics[width=0.85\textwidth]{myplot.pdf}")
print(r"\end{center}")