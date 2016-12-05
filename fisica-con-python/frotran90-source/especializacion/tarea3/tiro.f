C **********************************************************************
C NOMBRE: MOVIMIENTO DE UN PROYECTIL
C AUTOR: OLIVO -RUIZ
C DESCRIPCION:
C FECHA:06/11/03 11:39
C **********************************************************************
      program Tiro
      implicit  real (A-G,O-Z)
      parameter ( pi=3.1415927, g=9.8,TOL=0.00001)
      dimension y(500), X(500), Vy(500),T(500)
      REAL THETA, V, EY
      Write(*,*) ' Introduzca el valor del angulo en grados', theta
      read(*,*) theta
      Write(*,*) ' Introduzca el valor de la RAPIDEZ inicial en m/s',v
      read(*,*) v
      alfa=(theta*pi)/180.0
      X(1)=0.0
      Y(1)=0.0

      Vy(1)=v*sin(alfa)
      Vx=v*cos(alfa)
      TV=(2*V*SIN(ALFA))/G
      T(1)=0
      DT=0.5
      YMAX=0
         h=tv/0.5
      DO 10 I=2,h


      X(I)=X(I-1)+VX*DT
      Y(I)=Y(I-1)+VY(I)*DT
      VY(I)=VY(I-1)-G*DT
      VX=VX
      T(I)=(I-1)*DT


10    CONTINUE

      S=(SIN(ALFA))**2
      A=((V**2)*S)/(2*G)
      R=((V**2)*SIN(2*ALFA))/G
      TM=T(h)
      Xm=X(h)
       EX=(ABS(XM-R))/(R*100)
       EX=(ABS(Y(j)-A))/(A*100)
       ET=(ABS(TM-TV))/(TV*100)
       


      write(6,*)'Resultado para N=',h,':'
      WRITE(*,'(3(T4,A/),3(T4,A/T4,(3(A,1PE13.6))/))')
     &'              ³ Valor numerico³ Valor analit. ³              ',
     &'              ³estimado por la³ ******        ³   Diferencia ',
     &'              ³ Euler m.      ³  ******       ³   en %       ',
     &'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄ',
     &'ALTURA        ³ ',Ymax,     ' ³ ' ,A     ,  ' ³ ',ey          ,
     &'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ',
     &'Dista.        ³ ',XM     ,  ' ³ ' ,R     ,  ' ³ ',ex ,
     &'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ',
     &'TIEMPO.       ³ ' ,Tm  ,    ' ³ ' ,tv    ,  ' ³ ',et
      WRITE(6,*)'El programa termino!'
       print*, 'Si quiere continuar digie 1 si no cero'
       !read*,  res
       !goto 20
      !ENDIF
      open(10,file='trapecio21.txt',status='unknown')
      write(10,200)'Resultado para N=',j,':'
      write(10,201)'***************************************************'
      write(10,202) ' Resultado de la Integral numerica para t: ',TM
      write(10,203) ' Resultado de la Integral analitica para t: ',Tv
      write(10,204) ' Diferencia = ',et,'%'
      write(10,205) ' Resultado de la Integral numerica para H:',Y(j)
      write(10,206) ' Resultado de la Integral analitica para H: ',H
      write(10,207) ' Diferencia = ',ey,'%'
      write(10,208) ' Resultado de la Integral numerica para x:',X(j)
      write(10,209) ' Resultado de la Integral analitica para X: ',R
      write(10,210) ' Diferencia = ',eX,'%'
      write(10,211)'***************************************************'


200   format(a20,i4,a2)
201   format(a50)
202   format(a45,f8.6)
203   format(a45,f8.6)
204   format(a15,f8.6,a2)
205   format(a45,f8.6)
206   format(a45,f8.6)
207   format(a15,f8.6,a2)
208   format(a45,f8.6)
209   format(a45,f8.6)
210   format(a15,f8.6,a2)
211   format(a50)
c     **abrir los archivos y escribir los datos**
      open(20,file='posicion.txt',status='unknown')
      !open(30,file='velocidad.txt',status='unknown')
      do 60  k=1,h
       write(20,*) X(k),VY(K)
60    continue
      !write(30,*) vx
      close(20)

      
      END

