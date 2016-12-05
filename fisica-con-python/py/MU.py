from visual import*
carro = box(pos=vector(0,0,0), size = vector(2,0.5,1), color = color.yellow)
solo = box(pos=vector(0,-0.3,0), size = vector(20,0.1,10), color = color.green)
t =0

dt = 0.001

FRAME=1/dt

carro.velocity = vector(20,0,0)
while True:
	rate(FRAME)
	carro.pos += carro.velocity * dt
	print carro.velocity
	t+=dt
