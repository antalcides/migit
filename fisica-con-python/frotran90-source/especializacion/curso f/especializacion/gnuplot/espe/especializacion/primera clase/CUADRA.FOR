c Programa para calcular las ra¡zes de una ecuaci¢n cuadr tica
      real A,B,C,DISC,R3,R4,DISCR,DISC1
      complex DISCC,R1,R2

      print*, 'ENTRE LOS COEFICIENTES DE LA ECUACION,A, B Y C'
      read*,A,B,C

      DISC = B**2.0-4.0*A*C
      print*, 'EL DISCRIMINANTE ES',DISC
      if(DISC.LT.0)THEN
         DISC1=SQRT(ABS(DISC))
         DISCC=cmplx(0,DISC1)
         R1 = (-B+DISCC)/(2.0*A)
         R2 = (-B-DISCC)/(2.0*A)
         PRINT*,'LAS RAICES COMPLEJAS SON', R1,R2
      ELSE
          IF(DISC.GE.0)THEN
         DISCR = SQRT(ABS(DISC))
         R3 = (-B+DISCR)/(2.0*A)
         R4 = (-B-DISCR)/(2.0*A)
         PRINT*, 'LAS RAICES REALES SON', R3, R4
          END IF
      END IF
         OPEN(10,FILE='DAT.TXT',STATUS='UNKNOWN')
         WRITE(10,*)'RAICES REALES', R3,R4, ' RAICES COMPLEJAS',R1,R2
      END


                       
