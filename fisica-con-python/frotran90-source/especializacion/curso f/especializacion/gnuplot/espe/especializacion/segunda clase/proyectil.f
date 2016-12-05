c Programa para calcular el movimiento de proyectiles con fuerza de
c arrastre o 'drag force'.
c x(i) e y(i) son las posiciones del proyectil.
c dt es el intervalo de tiempo.
c D es el coeficiente de arrastre o 'drag coeficient'
      program proyectil
      real x(1),y(1),dt, v(1),theta,vx(1),vy(1)
      integer i,imax
      Parameter(pi=3.14159)
      parameter(imax=10)
      parameter(g=9.8)
c Imponemos condiciones iniciales:
      dt=0.1
      x(1)=0.0
      y(1)=0.0
      v(1)=30.0
      theta=35.0*(pi/180.0)
      vx(1)=v(1)*cos(theta)
      vy(1)=v(1)*sin(theta)
c Ciclo para los calculos:
      do 10 i=1,imax
      x(i+1)=x(i)+vx(i)*dt
      vx(i+1)=vx(i)
      y(i+1)=y(i)+vy(i)*dt
      vy(i+1)=vy(i+1)-g*dt
      open(20,file='x.txt',status='new')
      write(20,*) x(i)
      open(30,file='y.txt',status='new')
      write(30,*) y(i)
10    continue
      end
      
