c PROGRAMA PARA HALLAR LAS RAICES DE UNA FUNCION POR EL METODO DE LA
c BISECCION.
c definimos la funcion
      function fun(x)
      real x,fun
      fun=x+1
      END
c ITERACIONES:
      real x1,x2,f1,f2,raiz
      integer jmax
c INTERVALOS:
      print*, 'Entre el numero de iteraciones'
      read*, jmax
      print*, 'Entre el primer limite del intervalo'
      read*, x1
      print*, 'Entre el segundo limite del intervalo'
      read*, x2
      f1=fun(X1)
      f2=fun(X2)
      if(f1*f2.LT.0)then
      print*,'EL INTERVALO ES VALIDO'
      else
      stop'EL INTERVALO NO ES VALIDO'
      end if

      if(f1.LE.0)then
      RAIZ=X1
      DX=X2-X1
      else
      RAIZ=X2
      DX=X1-X2
      end if

c LOOP PARA LA BISECCION:
      do 11 J=1,JMAX
      DX=DX*.5
      XMID=RAIZ+DX
      FMID=fun(XMID)
      if(FMID.LE.0)RAIZ=XMID
11    continue
      print*,'la raiz por biseccion es', RAIZ
      end







