
c     **Seudocodigo para calcular el movimiento de proyectiles simples**

      program proyectilsimple
      
c     **Declaraci¢n de variables**
      integer i!j ,imax
c     real v0,vx,vy,dt,g,r,th,teta

c     **Declaraci¢n de arreglos**
      real x(30),y(30)
c     **asignaci¢n de valores al arreglo angulos**
      !teta(1)=20
      !teta(2)=30
      !teta(3)=35
      !teta(4)=40
      !teta(5)=45
      !teta(6)=50
      !teta(7)=55
      
c     **Condiciones iniciales**
      v0=700
      g=9.8
      dt=0.5
      teta=20
c      !print *,'Digite el n£mero de segundos para el cual desee'
c      !print *,'que se ejecute el prograna'
c      !read  (*,*) n
c      !imax=n*dt
      !do j=1,7,1
c       **estableciendo condiciones iniciales**
        vx=v0*cos(teta)
        vy=v0*sin(teta)
        x(1)=0
        y(1)=0
        !th=2*teta(j)
        !r=((v0**2)+sin(th))/g
        
c       **Metodo de Euler para las ecuaciones**
         i=2
         dt=0.5
         print*, 'para el angulo',teta
         do while((y(i).GE.0.00001 ).or.(vx.GT.0) )
           x(i)=x(i-1)+vx*dt
           y(i)=y(i-1)+vy*dt
           vy=vy-g*dt
           vx=vx
           i=i+1
           dt=dt+0.5
           print*, x(i),y(i)

         end do

      !end do
      end
