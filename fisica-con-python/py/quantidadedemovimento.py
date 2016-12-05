from visual import*
p = float(input("digite a velocidade"))
fog = box(pos = vector(0,0,0), size = vector(1,7,1), color = color.yellow)
m = 1000
t = 1
dt = 0.001
FRAME = 1/dt
fog.velocity = vector(0,p,0)
while True:
	rate(FRAME/10)
	fog.pos += fog.velocity* dt
	q = m*fog.velocity.mag			
	a = fog.velocity.mag/t
	F = a*m
	I = F*t
	fog.velocity.y = I *dt														
	t+=dt
