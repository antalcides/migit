
c     **Seudocodigo para calcular el movimiento de proyectiles **
c      **afectados por la fuerza de fricci¢n (Drag force)
      program proyectildrag
      
c     **Declaraci¢n de variables**
      integer i,imax,k  !imax numero de itereciones maxImas
      real v0,vx,vy,v,v1,dt,g,teta,tet,cd,m
      !v0 es la RAPIDEZ INICIAL, vx y vy son las componentes horizontal
      !y vertical de la velocidad instantanea,v es la velocidad instan-
      !tanea, g la gravedad,teta angulo de tiro en grados
      ! y tet angulo de tiro en rad,cd es el coeficiente de arrastre
      !m es la masa

c     **Declaraci¢n de arreglos**
      real x(400),y(400),t(400),vyj(400)
      
c     **Condiciones iniciales**
       v0=700
       g=9.8
       dt=0.5
       m=600
       cd=1
      print*,'digite el angulo en grados'
      read(*,*) teta
       tet=(teta*3.1416)/180.0
      print*,'el angulo es ',tet
      
c     **hallar las velocidades iniciales en x y en y**
       vx=v0*cos(tet)
      print*,'la velocidad inicial en x es',vx
       vy=v0*sin(tet)
       vyj(1)=vy
      print*,'la velocidad inicial en y es',vy
       x(1)=0
       y(1)=0
       t(1)=0


c     **M‚todo de Euler para las ecuaciones**
      imax=100
      
      v=v0
      ymax=0
      i=1

      do while (i.LT.imax)
        i=i+1
        x(i)=x(i-1)+(vx*dt)
        y(i)=y(i-1)+(vy*dt)
        vy=vy-(g*dt)-(cd*v*vy*dt)/m
        vyj(i)=vy
        vx=vx-(cd*v*vy*dt)/m
        t(i)=i*dt
        v1=(vx**2)+(vy**2)
        v=sqrt(v1)
        if(y(i).GT.ymax)then
c        **altura m xima por metodos num‚ricos**
         ymax=y(i)
        end if
       if(y(i).LT.0)then
        k=i
        i=imax
       endif

      print*, x(i),y(i),i,vyj(i),t(i)
      enddo

c     **Alcance por metodos num‚ricos**
       xmax=x(k)
c     **Tiempo de vuelo por m‚todos num‚ricos**
       timax=t(k)
      Print*, 'la altura m xima num‚rica es',ymax
      Print*, 'el alcance num‚rico es',xmax
      Print*, 'el tiempo de vuelo num‚rica es',timax


c     **abrir los archivos y escribir los datos**
      open(20,file='posiciondr60.dat',status='unknown')
      !open(30,file='velocidad.txt',status='unknown')
      do 60  i=1,k-1
       write(20,*) X(i),Y(i)
60    continue
      !write(30,*) vx
      close(20)
      !close(30)
      end
