

c     **Este programa halla las raices de una ecuaci¢n cuadr tica por el
c     m‚todo de la secante**
      program biseccion
      
c     **Declaraci¢n de variables**

      real G,H,I,D,R,u,v,w,a,b,c,e,dis
      integer n,j,resp,k
      D=0.00001
      R=0.00001
      n=300
      resp=1
      do while(resp.EQ.1)
        print*, 'Este programa resuelve una ecuaci¢n cuadr tica:'
        print*, 'ax**2 + bx  +c '
        Print*, 'Digite el coeficiente a'
        read*, G
        Print*, 'Digite el coeficiente b'
        read*, H
        Print*, 'Digite  c'
        read*, I
        dis=(H**2)-(4*G*I)
        if(dis.GT.0)then
         Print*, 'Digite el l¡mite inferior del intervalo'
         read*, a
         Print*, 'Digite el l¡mite superior del intervalo'
         read*, b
         write(*,*)'La funcion es : ',G,'x**2 ',H,'x ', I

         u= (G*(a**2))+(H*a)+I
         v= (G*(b**2))+(H*b)+I
         if(u.EQ.0)then
          print*,'La raiz es',a
         else
          if(v.EQ.0)then
           print*,'La raiz es',b
          else
            k=1
            do while((v*u.GE.0).and.(k.LT.30))
             k=k+1
             a=a+0.1
             u= (G*(a**2))+(H*a)+I
             v= (G*(b**2))+(H*b)+I
            enddo
            e=b-a
            j=1
            if((u*v).LT.0)then
               do while(j.LT.n)
                 j=j+1
                 e=e/2
                 c=a+e
                 w=(G*(c**2))+(H*c)+I

                 if(abs(e).GE.D)then
                   if(abs(w).GE.R)then
                     if((u*w).LT.0)then
                      b=c
                      v=w
                     else
                      a=c
                      u=w
                     endif
                   else
                     j=n
                   endif
                 else
                 j=n
                 endif
               enddo
               write(*,*)'*********************************************'
               print*, 'El numero de iteraciones es',j
               print*, 'La raiz es',c
               print*, 'El error es',e
               write(*,*)'*********************************************'
            else
               print*, 'No existen raices en el intervalo dado,'
               print*,'o el la longitud del intervalo es muy grande'
            endif
           endif
          endif
        else
         print*,'Esta ecuaci¢n no tiene raices reales'
        endif
      open(10,file='biseccion.txt',status='unknown')
      write(10,201)'***************************************************'
      write(10,200)'La funcion es : ',G,'x**2 ',H,'x  ', I
      write(10,202) ' El numero de iteraciones es : ',j
      write(10,203) ' La raiz es: ',c
      write(10,204) ' El error es ',e
      write(10,205)'***************************************************'
201   format(a50)
200   format(a15,f8.6,a5,f8.3,a2,2f8.3)
202   format(a25,i4)
203   format(a15,f8.6)
204   format(a15,f8.6,a2)
205   format(a50)
        print*,'Si desea continuar digite 1, sino digite 0'
        read*,resp
      enddo


      end
