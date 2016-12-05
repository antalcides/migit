c Programa para aplicar el metodo de Euler a EDO's
c Como ejemplo usaremos la EDO:
c                        dy/dx = (x**2+y**2)**0.5
c                        y(2) =0.5
c Definimos la funci¢n f=(x**2+y**2)**0.5
      function fun(a,b)
      real a,b,fun
      fun=(x**2+y**2)**0.5
      end
c Iniciamos el programa
      program Euler2
      real x(1),y(1),h
      integer i,n
c Definimos condiciones iniciales:
      x(1)=2.0
      y(1)=0.5
c Valor a calcular: y(2.3)
c Definimos el ancho o paso de iteracion, done n es el numero de itera.
      n=5
      h= (0.1-0.0)/n
c Ciclo para la iteracion:
      do 10 i=1,n+1
      x(i+1)= x(i)+h
      y(i+1)=y(i)+h*fun(x(i),y(i))
      print*, 'El valor aproximado de la funcion es', y(i)
10    continue
       end





