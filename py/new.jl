using PyPlot
# load PyPlot, example taken from Matplotlib documentation
x = linspace(0, 1)
y = sin(4 * pi * x) * exp(-5 * x)
fill(x, y)
# you can access any matplotlib.pyplot function
grid(true)
using Distributions
# second example
srand(1)
x = randn(1000)
# hist conflicts with Julia hist so prepend plt.
n, bins, patches = plt.hist(x, 20, normed = 1, facecolor="y")
points = linspace(bins[1], bins[end])
plot(points, pdf(Normal(), points), "r") # add normal density plot
