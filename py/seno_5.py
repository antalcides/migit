from math import pi, sin

x1 = float(raw_input('Dime el límite inferior del intervalo: '))
x2 = float(raw_input('Dime el límite superior del intervalo: '))
puntos = int(raw_input('Dime cuántos puntos he de mostrar: '))

window_size(500, 500)
window_coordinates(x1, -1.5, x2, 1.5)

incremento = (x2 - x1) / puntos

x = x1
while x <= x2 - incremento:
  create_line(x, sin(x), x+incremento, sin(x+incremento))
  x += incremento
