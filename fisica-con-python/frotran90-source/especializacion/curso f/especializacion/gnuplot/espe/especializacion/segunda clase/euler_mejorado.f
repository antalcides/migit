c Programa para aplicar el metodo de Euler mejorado a EDO's
c Como ejemplo usaremos la EDO:
c                        dy/dx = sqrt(x)+sqrt(y)
c                        y(3) =10
c Definimos la funci¢n f=sqrt(x)+sqrt(y)
      function fun(a,b)
      real a,b,fun
      fun=sqrt(a)+sqrt(b)
      end
c Iniciamos el programa
      program Euler
      real x(1),y(1),h
      integer i,n
c Definimos condiciones iniciales:
      x(1)=0.0
      y(1)=10.0
c Valor a calcular: y(0.1)
c Definimos el ancho o paso de iteracion, done n es el numero de itera.
      n=5
      h= (0.1-0.0)/n
c Ciclo para la iteracion:
      do 10 i=1,n+1
      x(i+1)= x(i)+h
      p=y(i)+h*fun(x(i),y(i))
      y(i+1)=y(i)+(h/2.0)*(fun(x(i),y(i))+fun(x(i+1),p))
      print*, 'El valor aproximado de la funcion es', y(i)
10    continue

      end
