      PROGRAM pendulo
C     PROGRAMA PARA INTEGRAR LA ECUACION DIFERENCIAL EXACTA
C     DEL PENDULO UTILIZANDO EL METODO DE RUNGE-KUTTA DE CUARTO ORDEN
C     LA ECUACION ES:
C
C
C         TETA''=-(G/L)*SIN(TETA)
C
C
C
C
      IMPLICIT REAL*8(A-H,O-Z)
      PARAMETER (N=2,NPT=1000)
      DIMENSION Y(N),DYDX(N),YOUT(N)
      COMMON A,G
C     LONGITUD DEL PENDULO
      A=20.D0
C     GRAVEDAD
      G=10.D0
C     TIEMPO INICIAL
      X=0.D0
C     ANGULO INICIAL
      write(6,*) 'amplitud inicial en radianes'
      read (5,*) y(2)
C     VELOCIDAD INICIAL
      write(6,*) 'velocidad inicial'
      read (5,*) y(1)
      write(6,*) 'factor de amplificacion para la grafica'
      read (5,*) amp
C     PASO DE INTEGRACION
      H=.05D0
      OPEN(2,FILE='ANG1.DAT')
      OPEN(3,FILE='VEL1.DAT')
      CALL DERIVS(X,Y,DYDX)
C     PROCEDIMIENTO RUNGE-KUTTA 4 PARA REALIZAR LA INTEGRACION
      CALL RK4(Y,DYDX,N,X,H,YOUT)
C     CICLO SOBRE EL INTERVALO
      DO 3 J=1,NPT
      X=X+H
      DO 2 I=1,N
      Y(I)=YOUT(I)
    2 CONTINUE
      CALL DERIVS(X,Y,DYDX)
      CALL RK4(Y,DYDX,N,X,H,YOUT)
      WRITE(3,*)X+H,amp*YOUT(1)
      WRITE(2,*)X+H,amp*YOUT(2)
    3 CONTINUE
      CLOSE(2)
      CLOSE(3)
      STOP
      END
      SUBROUTINE DERIVS(X,Y,DYDX)
      IMPLICIT REAL*8(A-H,O-Z)
      COMMON A,G
      DIMENSION Y(*),DYDX(*)
C     ECUACIONES DIFERENCIALES
      DYDX(1)=-(G/A)*dsin(Y(2))
      DYDX(2)=Y(1)
      RETURN
      END
      SUBROUTINE RK4(Y,DYDX,N,X,H,YOUT)
      IMPLICIT REAL*8(A-H,O-Z)
      PARAMETER (NMAX=10)
      DIMENSION Y(N),DYDX(N),YOUT(N),YT(NMAX),DYT(NMAX),DYM(NMAX)
      HH=H*0.5D0
      H6=H/6.D0
      XH=X+HH
      DO 11 I=1,N
      YT(I)=Y(I)+HH*DYDX(I)
11    CONTINUE
      CALL DERIVS(XH,YT,DYT)
      DO 12 I=1,N
      YT(I)=Y(I)+HH*DYT(I)
12    CONTINUE
      CALL DERIVS(XH,YT,DYM)
      DO 13 I=1,N
      YT(I)=Y(I)+H*DYM(I)
      DYM(I)=DYT(I)+DYM(I)
13    CONTINUE
      CALL DERIVS(X+H,YT,DYT)
      DO 14 I=1,N
      YOUT(I)=Y(I)+H6*(DYDX(I)+DYT(I)+2.D0*DYM(I))
14    CONTINUE
      RETURN
      END



