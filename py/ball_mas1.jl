  g = 9.81
  v0 = 25
  ym = v0^2/(2*g)
  tm = (2*v0)/g
  tn = int(ceil(tm))
  dt = 0.002
function ball()
  y= 0
  t=0
  while(y >=0.0)
          t += dt
          y = v0*t - 0.5*g*t^2
  end
 return println("$y,  $t")
 end
 t=0
ball()
n = int(ceil(tm/dt))
listat = linspace(0, tm, n);
listay =[v0*t - 0.5*g*t^2 for t in listat];
using PyPlot
plot(listat,listay)
grid(true)
@time [ball()];
