using PyPlot
g = 9.81
v0 = 25
dt = 0.002
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
 m  = datos[:,1]./dt
 n1 = dot(m,[1])
 n  = int(ceil(n1))
 tm = dot(datos[:,1],[1])
 tiempo = linspace(0, tm, n)
 altura =[v0*x - 0.5*g*x^2 for x in tiempo]
 plot(tiempo,altura)
 grid(true)
 xlabel("t [s]");
 ylabel("y [m]");
 title(" lanzamiento vertical de un pelota");
datos
@time [datos];
