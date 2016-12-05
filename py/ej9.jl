using PyPlot

#################
#  Create Data  #
#################
x = randn(1000) # Values
nbins = 50 # Number of bins

##########
#  Plot  #
##########
fig = figure("pyplot_histogram",figsize=(10,10)) # Not strictly required
ax = axes() # Not strictly required
h = PyPlot.plt.hist(x,nbins) # Histogram, PyPlot.plt required to differentiate with conflicting hist command

grid("on")
xlabel("X")
ylabel("Y")
title("Histogram")
