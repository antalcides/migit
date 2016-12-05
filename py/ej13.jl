

using Winston
p = Winston.FramedPlot(title="", xlabel="x", ylabel="Density")
xhist2=(xhist[1],xhist[2]./xauc)
Winston.add(p, Winston.Histogram(xhist2...))
Winston.add(p, Winston.Curve(xp[:x],xp[:dens],color="orange"))

Out[8]:
