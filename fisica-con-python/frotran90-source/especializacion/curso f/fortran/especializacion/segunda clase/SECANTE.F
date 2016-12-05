c Programa para calcular las ra¡ces por medio del m‚todo de la secante

      FUNCTION FUN(X)
      REAL X,FUN
      FUN=X+1
      END

c Programa para calcular las ra¡ces, usando fun:

      REAL X1,X2,FUN,RAIZ,F1,F2
      PARAMETER(JMAX=100)
      PRINT*,'ENTRE EL INTERVALO X1,X2 RESPECTIVAMENTE'
      READ*,X1,X2

      F1=FUN(X1)
      F2=FUN(X2)
      IF(ABS(F1).LT.ABS(F2))THEN
      RAIZ=X1
      XL=X2
      ELSE
      RAIZ=X2
      XL=X1
      END IF

c LOOP PARA LA SECANTE

      DO 11 J=1,JMAX
      DX=(XL-RAIZ)*F2/(F2-F1)
      XL=RAIZ
      RAIZ=RAIZ+DX
      F=FUN(RAIZ)
11    CONTINUE
      PRINT*,RAIZ

      END


