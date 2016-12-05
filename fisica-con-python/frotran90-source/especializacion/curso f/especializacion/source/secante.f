      program secante
      integer j,resp
      real D,R,a,b,u,v,s

      D=0.00001
      R=0.00001
      resp=1
      do while(resp.EQ.1)
        print*,'Digite el limite inferior del intervalo'
        read*,a
        print*,'Digite el limite superior del intervalo'
        read*,b

        u=f(a)
        v=f(b)
        j=1
        do while(j.LT.30)
          j=j+1
          s=(b-a)/(v-u)
          a=b
          u=v
          b=b-(v*s)
          v=f(b)
          if(abs(v).LT.D)then
           j=30
          endif
          if(abs(b-a).LT.R)then
           j=30
          endif
        enddo
      print*,'El valor de la raiz es',b
      print*,'Si desea continuar digite 1, sino digite 0'
      read*,resp
      
      enddo
      end
      

c      Definimos la funcion f(x)=x**2
      function f(x)
      real x,f
      f=(x**2)-x-6
      end
