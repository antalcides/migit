using PyPlot
# load PyPlot, example taken from Matplotlib documentation
g = 9.81
v0 = 20
#ym = v0^2/(2*g)
#tm = (2*v0)/g
#tn = int(ceil(tm))
dt = 0.000002
function dist(t)
        y = v0*t - 0.5*g*t^2
        return y
  end
function table()
        t = 0
  while( dist(t) >= -0.001)
          t += dt
          y = dist(t)
  end
   datos=[t dist(t)]
return datos
end
 datos = table()


