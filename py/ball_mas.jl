function ball()
  g = 9.81
  v0 = 10
  ym = v0^2/(2*g)
  tm = (2*v0)/g
  dt = 0.02
  y= 0
  t=0
  while(y >-0.01)
          t += dt
          y = v0*t - 0.5*g*t^2
          if(y< -0.01)
            break
          end
  end


 return println("$y,  $t")
 end
