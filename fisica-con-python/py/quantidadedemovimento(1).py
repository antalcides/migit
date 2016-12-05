from visual import*
fog = box(pos = vector(0,0,0), size = vector(1,3,1), color = color.yellow)
dm =
dt =
mf =
mg =
vg =
vf =
t = 1
dt = 0.001
FRAME = 1/dt
fog.velocity = vector(0,0,0)
while True:
	rate(FRAME/10)
	fog.pos += fog.velocity* dt
	q = m*fog.velocity.mag			
	a = fog.velocity.mag/t
	F = a*m
	I = F*t
	fog.velocity.y = I *dt														
	t+=dt
