from visual import*
q1 = sphere(pos = vector(-4.142135623730951,0,0), radius = 0.5, color = color.blue)
q2 = sphere(pos = vector(0,0,0), radius = 0.5, color = color.blue)
q3 = sphere(pos = vector(5.857864376,0,0), radius = 0.5, color = color.blue)
quadrado = box(pos = vector(0,0,0), size = vector(30,30,30), color = color.yellow, opacity = 0.4)
q1c = 0.0005
q2c = -0.0002
q3c = 0.00010
t = 0	
dt = 0.001
FRAME = 1/dt
q2.velocity = vector(0,0,0)
while True:
	rate(FRAME)
	r = q1.pos - q2.pos
	r2 = q2.pos - q3.pos
	q2.pos += q2.velocity * dt
	F = 9.98*(10**9)*q1c*q2c/(r.mag**2) * -r/r.mag
	F2 = 9.98*(10**9)*q3c*q2c/(r2.mag**2) * -r2/r2.mag
	q2.velocity += -F * dt
	q2.velocity += F2 * dt
	t+=dt
	
