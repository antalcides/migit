def f(x):
  return x**2 - 2*x -2

def biseccion(a, b, epsilon):
  c = (a + b) / 2.0
  fc = f(c)
  while fc != 0 and b - a > epsilon:
    if f(a)*fc > 0:
      a = c
    elif f(b)*fc > 0:
      b = c
    c = (a + b) / 2.0
    fc = f(c)
  return c

print 'El cero está en:', biseccion(0.5, 3.5, 1e-5)
