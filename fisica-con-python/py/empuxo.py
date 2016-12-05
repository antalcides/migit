from visual import*
g = vector(0,-10,0)
referenciaparazero = box(pos = vector(0,0,0), size = vector(1,0.1,1), color = color.green)
corpo = box(pos = vector(0,9,0), size = vector(3,3,3), color = color.yellow)
agua = box(pos = vector(0,-10,0), size = vector(5,20,5), color = color.blue, opacity = 0.5)
solo = box(pos = vector(0,-20,0), size = vector(5,0.1,5), color = color.yellow, opacity = 0.5)
m = 4
df = 0.80
t = 0 
dt = 0.001
FRAME = 1/dt
corpo.velocity = vector(0,0,0)
while True:
	rate(FRAME/10)
	E=vector(0,0,0)
	if corpo.size.y/2-corpo.pos.y>= 0:
		r = corpo.size.y/2 - corpo.pos.y
		E=vector(0,df*g.mag*corpo.size.x*corpo.size.z*r,0)
	if corpo.pos.y+corpo.size.y/2<0:
		E=vector(0,df*g.mag*corpo.size.x*corpo.size.z*corpo.size.y,0)
	corpo.pos += corpo.velocity * dt
	corpo.velocity += (g+E/m) * dt

	if g.y*m+E.y>=0:
		print r
		break
