from visual import*
fog = box(pos = vector(0,1.5,0), size = vector(1,3,1), color = color.white)
planet = sphere(pos = vector(0,-5,0), radius = 4, color = color.blue)
mp = 10000000000
mg = 100
mf = 1000
mgs = 0.01
v1 = 0
t = 0
dt = 0.001
FRAME = 1/dt
vg = 0.0005
fog.velocity = vector(0,v1,0)
while True:
	rate(FRAME)
	mt1 = mf + mg
	fog.pos += fog.velocity * dt
	vgs = fog.velocity.y - vg
	r = planet.pos - fog.pos 
	F = 6.67*10**-11 * (mt1*mp)/r.mag**2 
	if mg>0:
		fog.velocity.y = fog.velocity.y + mg*vg/(mt1 - mgs)
		mg -= mgs
	fog.velocity += F/mt1 * r/r.mag * dt
	#fog.velocity.y-=10
	t+=dt
	print mg, fog.velocity.y
		
