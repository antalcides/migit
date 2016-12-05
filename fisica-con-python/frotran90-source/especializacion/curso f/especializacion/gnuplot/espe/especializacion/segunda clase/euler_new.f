c Programa para aplicar el metodo de Euler a EDO's
c Como ejemplo usaremos la EDO:
c                        dy/dx = 2xy
c                        y(0) =1
c Definimos la funci¢n f=2xy
      function fun(a,b)
      real a,b,fun
      fun=2*a*b
      end
c Iniciamos el programa
      program Euler
      real x(1),y(1),h,error,A
      integer i,n
c Definimos condiciones iniciales:
      x(1)=0.0
      y(1)=1.0
c Valor a calcular: y(0.5)
c Definimos el ancho o paso de iteracion, done n es el numero de itera.
      n=5
      h= (0.5-0.0)/n
c Ciclo para la iteracion:
      do 10 i=1,n+1
      x(i+1)= x(i)+h
      y(i+1)=y(i)+h*fun(x(i),y(i))
      print*, 'El valor aproximado de la funcion es', y(i)
10    continue
c calculamos el error:
      A= exp((0.5)**2)
      error=((A-y(6))/A)*100
      print*, 'El error es',error,'%'
      end
