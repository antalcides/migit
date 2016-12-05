      PROGRAM TRAPECIO
C     Este programa calcula la integral de una funcion f en el
C     intervalo [a,b] utilizando la regla del trapecio
C     Como ejemplo se utiliza la funcion y(x)= 3./(48-(12*(sqrt(3.)))-x)
c     cuya integral es
C     analitica es: g(z)= 3*(3.3038-log(48.-(12*(sqrt(3.)))-z)) .
C      --Variables de entrada--
C     A:      Limite inferior a
C     B:      Limite superior b
C             {variables de DOBLE PRECISION}
C     N:      Numero de puntos en el intervalo [a,b]
C             {INTEGER-Variable}
C     --Variables de salida--
C     IT:     Integral segun la regla del Trapecio
C     IE:     Valor exacto de la integral (analitico)
C     DT:     Valor absoluto de la diferencia entre la integral
C             calculada con la regla del Trapecio y el valor analit.
C             {variables de DOBLE PRECISION}
C*********************************************************************
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
      DOUBLE PRECISION IE, IT
      WRITE(6,*)'Integracion segun la regla del Trapecio '
      WRITE(6,*)'----------------------------------------'
      WRITE(6,*)'Por favor introduzca los siguientes datos:'
      WRITE(6,*)'Limite inferior de integracion:  A = '
      READ(5,*) A
      WRITE(6,*)'Limite superior de integracion:  B = '
      READ(5,*) B
      WRITE(6,*)'Numero N de puntos en el intervalo [A,B]'
      WRITE(6,*)'(N impar y N ò 5)   N = '
      READ (5,*) N
      write(6,*)
      H=(B-A)/(N-1)
      IT=H/2.D0*(F(A)+F(B))
      DO 10 I=2,N-1
      IT=IT+H*F(A+(I-1)*H)
10    CONTINUE
      IE=G(B)-G(A)
      DT=ABS(IT-IE)
      WRITE(6,*)'Resultados para N= ',N,':'
      WRITE(6,*)'---------------------------------------------------'
      WRITE(*,'(3(T2,A/),2(T2,A/T2,(3(A,1PE13.6))/))')
     &'              ³ Valor numerico³ Valor analit. ³              ',
     &'              ³ estimado de la³ de la integral³   Diferencia ',
     &'              ³ integral      ³               ³              ',
     &'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄ',
     &'Trapecio      ³ ' ,IT    ,  ' ³ ' ,IE    ,  ' ³ ',DT
      WRITE(6,*)'El programa termino!'
      END
      FUNCTION F(x)
      real x
      F=3./(48-(12*(sqrt(3.)))-x)
      END
       FUNCTION G(z)
      real z
      G= 3*(3.3038-log(48.-(12*(sqrt(3.)))-z))
      END
