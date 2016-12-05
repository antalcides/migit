from visual import*
grav = vector(0,-10,0)
solo = box(pos = vector(0,0,0), size = vector(30,1,30), color = color.yellow)
bol = sphere(pos = vector(-9,1,0), radius = 0.5, color = color.red)
t = 0
dt = 0.001
FRAME = 1/dt
bol.velocity = vector(10,10,0)
while True:
	rate(FRAME)
	bol.pos += bol.velocity * dt
	bol.velocity += grav * dt
	if (bol.pos.y <= solo.pos.y - (bol.radius + solo.size.y/2.0)
	   or bol.pos.y <= solo.pos.y + (bol.radius + solo.size.y/2.0)):
		print 'o M O e: ', bol.velocity.x/bol.velocity.y
		break
