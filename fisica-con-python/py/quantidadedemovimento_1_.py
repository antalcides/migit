from visual import*
fog = box(pos = vector(0,1.5,0), size = vector(1,3,1), color = color.white)
solo = box(pos = vector (-5,0,0), size = vector(0.2,0.1,0), color = color.blue)
mg = 100
mf = 1000
mgs = 0.05
v1 = 0
t = 0
dt = 0.001
FRAME = 1/dt
vg = 0.05
fog.velocity = vector(0,v1,0)
while True:
	rate(FRAME)
	mt1 = mf + mg
	fog.pos += fog.velocity * dt
	vgs = fog.velocity.y - vg
	if mg>0:
		fog.velocity.y = fog.velocity.y + mg*vg/(mt1 - mgs)
		mg -= mgs
	#fog.velocity.y-=10
	t+=dt
	print mg, fog.velocity.y
		
