from visual import*
g = vector(0,-10,0)
Pg = float(input('digite a pressao inicial: '))
m = float(input('digite a massa da tampa: '))
referencia = box(pos =vector(0,0,0), size = vector(10,0.1,1), color = color.green)
caixa = box(pos =vector(0,2.5,0), size = vector(5,5,5), color = color.red, opacity = 0.5)
tampa = box(pos =vector(0,4,0), size = vector(5,0.1,5), color = color.blue)
A=25
t = 0
dt = 0.0001
FRAME = 1/dt
tampa.velocity = vector(0,0,0)
PA=-10**5
while True:
	rate(FRAME)
	P=PA+Pg
	Vi=A*caixa.pos.y
	tampa.pos.y += tampa.velocity.y*dt
	F=(P*A) - g.mag*m
	tampa.velocity.y += F/m * dt
	Vf=A*caixa.pos.y
	Pg = Vi*Pg/Vf
