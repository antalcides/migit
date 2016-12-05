
      
c Este programa determine el valor aproximado de una integral definida
c dada por medio del metodo de Simpson
      program simpson
      real a,b,h,s,t,integral
      integer n,i,resp
      
      resp=1
      do while(resp.EQ.1)
      print*,'Digite el l¡mite inferior de la integra'
      read*,a
      print*,'Digite el l¡mite superior de la integral'
      read*,b
      print*,'Digite el n£mero de intervalos (debe ser par)'
      read*,n
      h=(b-a)/n
      s=0
      t=0
      do 20 i=1,n-2,2
        s=s+4*f(a+(i*h))
        t=t+2*f(a+((i+1)*h))
20    continue
      s=s+4*f(a+(i*h))
      integral=(h/3)*(f(a)+s+t+f(b))
      print*,'El valor de la integral dada es:',integral
      
      print*,'Si desea continuar digite 1 sino digite 0'
      read*,resp
      enddo
      end
      
c definimos la funcion f(x)=x**2
      function f(x)
      real x,f
      f=(x**2)+(2*x)+1
      end
