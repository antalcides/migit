function ball(v0,t)
  g = 9.81
  t1 = 2*v0/g
  y1  = v0^2/(2*g)
    y = v0*t - 0.5*g*t^2
    if(y <= 0)
  return println( "la pelota solo tarda $t1 s, en el aire y alcanzó una altura máxima de $y1 m." )
  end
      if(y <= 0)
      return println( "En un tiempo de $t s, la pelota está a una altura de  $y m." )
    end
    y = v0*t - 0.5*g*t^2
    return println( "En un tiempo de $t s, la pelota está a una altura de  $y m." )
  end
