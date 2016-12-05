
c     **Seudocodigo para calcular el movimiento de proyectiles simples**

      program proyectilsimple
      
c     **Declaraci¢n de variables**
      integer i,imax  !imax numero de itereciones maxImas
      real v0,vx,vy,dt,g,r,th,s,teta,tet ,tv,hmax,timax,ymax,ex,ey,et
      !v0 es la RAPIDEZ INICIAL, vx y vy son las componentes horizontal
      !y vertical de la velocidad instantanea, g la gravedad,teta angulo
      ! de tiro en grados y tetangulo de tiro en rad,tv tiempo de vuelo,
      !hmax altura maxima.
      ! timax, ymax,son los valores del tiempo de vuelo, altra maxima y
      !alcance maximos numericos respectivamente.
      !ex, ey, et son los errores relativos del alcance maximo, altura
      ! maxima, tiempo de vuelo respectivamente
c     **Declaraci¢n de arreglos**
      real x(400),y(400),t(400),vyi(400)
      
c     **Condiciones iniciales**
       v0=700
       g=9.8
       dt=0.5
      !write(*,*)'digite la rapidez inicial en m/s',v0
      !read(*,*) v0
      print*,'digite el angulo en grados'
      read(*,*) teta
       tet=(teta*3.1416)/180.0
      print*,'el angulo es ',tet
      
c     **hallar las velocidades iniciales en x y en y**
       vx=v0*cos(tet)
      print*,'la velocidad inicial en x es',vx
       vy=v0*sin(tet)
       vyi(1)=vy
      print*,'la velocidad inicial en y es',vy
       x(1)=0
       y(1)=0
       t(1)=0
c     **Soluci¢n analitica para el tiempo de vuelo, el alcance
c     ** y la altura maxima

c     **alcance por metodo analitico**
       th=2*tet
       r=((v0**2)*sin(th))/g
      print*,'el alcance es',r
      
c     **tiempo de vuelo por m‚todo analitico**
       tv=(2*vy)/g
      print*,'El tiempo de vuelo es',tv
      
c     **altura m xima por m‚todo analitico**
       s=sin(tet)
       hmax=((v0**2)*(s**2))/(2*g)
      print*,'La altura m xima es',hmax

c     **M‚todo de Euler para las ecuaciones**
c     **calculando el n£mero de iteracciones imax**
       imax=tv/dt
      print*, 'El n£mero de iteracciones a realizar es',imax
       ymax=0
      do 10 i=2,imax
        x(i)=x(i-1)+(vx*dt)
        y(i)=y(i-1)+(vy*dt)
        vy=vy-(g*dt)
        vyi(i)=vy
        vx=vx
        t(i)=i*dt
        if(y(i).GT.ymax)then
c        **altura m xima por metodos num‚ricos**
         ymax=y(i)
        endif
        print*, x(i),y(i),i,vyi(i),t(i)
10    continue

c     **Alcance por metodos num‚ricos**
       xmax=x(imax)
c     **Tiempo de vuelo por m‚todos num‚ricos**
       timax=t(imax)
      !Print*, 'la altura m xima num‚rica es',ymax
      !Print*, 'el alcance num‚rico es',xmax
      !Print*, 'el tiempo de vuelo num‚rica es',timax
      
c     **Calculo de los errores**
       ex=(abs(r-xmax))*100/r
      !print*,'el error para el alcance es:',ex,'%'
      
       ey=(abs(hmax-ymax))*100/hmax
      !print*,'el error para la altura maxima  es:',ey,'%'
      
       et=(abs(tv-timax))*100/tv
      !print*,'el error para el tiempo de vuelo es:',et,'%'
      WRITE(*,'(3(T4,A/),3(T4,A/T4,(3(A,1PE13.6))/))')
     &'              ³ Valor numerico³ Valor analit. ³              ',
     &'              ³estimado por la³ ******        ³   Diferencia ',
     &'              ³ Euler m.      ³  ******       ³   en %       ',
     &'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄ',
     &'ALTURA        ³ ',Ymax,     ' ³ ' ,hmax  ,  ' ³ ',ey          ,
     &'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ',
     &'Dista.        ³ ',XMax   ,  ' ³ ' ,R     ,  ' ³ ',ex ,
     &'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ',
     &'TIEMPO.       ³ ' ,Timax,   ' ³ ' ,tv    ,  ' ³ ',et
      WRITE(6,*)'El programa termino!'
      
c     **abrir los archivos y escribir los datos**
      open(20,file='posicion60.txt',status='unknown')
      !open(30,file='velocidad.txt',status='unknown')
      do 60  i=1,imax
       write(20,*) X(i),Y(i)
60    continue
      !write(30,*) vx
      close(20)
      !close(30)
      end
