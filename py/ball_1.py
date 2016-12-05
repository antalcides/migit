def ball(v0,t):
  g = 9.81
  y = v0*t - 0.5*g*t^2
  return println( "En un tiempo de $t s, la pelota recorre $y m." )
