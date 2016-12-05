from visual import*
bloco = box(pos=vector(0,0,0), size = vector(1,0.3,0.3), color = color.yellow)
solo = box(pos=vector(0,-0.5,0), size = vector(5,1,1), color = color.green)
u = 0.98
n = 10
m = 1
t = 0
dt = 0.001
FRAME = 1/dt
bloco.velocity = vector (10,0,0)
while True:
	rate(FRAME)
	fat = u*n*(bloco.velocity/-bloco.velocity.mag)
	bloco.acel = fat/m 
	bloco.pos += bloco.velocity * dt
	bloco.velocity += bloco.acel *dt  
	print bloco.velocity
