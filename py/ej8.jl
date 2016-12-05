using PyCall
@pyimport matplotlib.pyplot as plt
#using PyPlot
using Distributions
nbins = 10
function plot_histogram(distribution, n)
    l = rand(distribution, n)  # n draws from distribution
    plt.hist(l)
    plt.show()
end

lp = Laplace()
plot_histogram(lp, 500)

