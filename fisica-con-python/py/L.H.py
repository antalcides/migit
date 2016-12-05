from visual import*
grav = vector(0,-10,0)
solo = box(pos = vector(0,0,0), size = vector(30,1,30), color = color.yellow)
bol = sphere(pos = vector(-9,9,0), radius = 0.5, color = color.red)
t = 0
dt = 0.001
FRAME = 1/dt
bol.velocity = vector(20,0,0)
while True:
	rate(FRAME)
	bol.pos += bol.velocity * dt
	bol.velocity += grav * dt
	t+=dt
	if (bol.pos.y <= solo.pos.y - (bol.radius + solo.size.y/2.0)
	   or bol.pos.y <= solo.pos.y + (bol.radius + solo.size.y/2.0)):
		print 'a velocidade em funcao do tempo e: ', bol.velocity.x*t
		break
