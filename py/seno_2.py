from math import pi, sin

window_size (500, 500) 
window_coordinates(-2*pi, -1.5, 2*pi, 1.5)

x = -2*pi
while x <= 2*pi:
  create_point(x, sin(x))
  x += 0.05
