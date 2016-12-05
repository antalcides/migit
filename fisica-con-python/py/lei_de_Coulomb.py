from visual import*
d = 6.0
q1 = sphere(pos = vector(d/2,0,0), radius = 0.5, color = color.blue)
q2 = sphere(pos = vector(-d/2,0,0), radius = 0.5, color = color.blue)
quadrado = box(pos = vector(0,0,0), size = vector(30,30,30), color = color.yellow, opacity = 0.4)
q1c = 0.00002
q2c = -0.00005
m1 = 1.1
t = 0	
dt = 0.001
FRAME = 1/dt
q1.velocity = vector(0,0,0)
while True:
	rate(FRAME)
	r = q1.pos - q2.pos
	q1.pos += q1.velocity * dt
	F = 9.98*(10**9)*q1c*q2c/(r.mag**2) * -r/r.mag
	q1.velocity += -F/m1 * dt
	t+=dt
	print F.mag
	if (q1.radius + q2.radius)>r.mag:
		break
