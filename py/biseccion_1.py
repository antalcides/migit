def f(x):
  return x**2 - 2*x -2

def biseccion(a, b, epsilon):
  c = (a + b) / 2.0
  while f(c) != 0 and b - a > epsilon:
    if f(a)*f(c) > 0:
      a = c
    elif f(b)*f(c) > 0:
      b = c
    c = (a + b) / 2.0
  return c
