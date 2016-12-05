c     Este programa determina la clasificaci¢n de un triangulo seg£n la
c     longitud de sus lados .
      program triangulo
      integer res
      real a,b,c
      
      res=1
10    if(res.EQ.1)then

        print*,'Digite la longitud del primer lado'
        read*, a
        print*,'Digite la longitud del segundo lado'
        read*, b
        print*,'Digite la longitud del tercer lado'
        read*, c
        if(a+b.LE.c)then
          print*,'Estas medidas no corresponden a ningun triangulo'
        else
         if(a+c.LE.b)then
          print*,'Estas medidas no corresponden a ningun triangulo'
         else
          if(b+c.LE.a)then
           print*,'Estas medidas no corresponden a ningun triangulo'
          else
              if(a.EQ.b)then
                if(b.EQ.c)then
                  print*,'El tri ngulo es equilatero'
                else
                  print*,'El tri ngulo es isosceles'
                endif
              else
                if(b.EQ.c)then
                  print*,'El tri ngulo es isosceles'
                else
                  print*,'El tri ngulo es escaleno'
                endif
              endif
            endif
          endif
         endif
      print*,'Si desea  continuar digite 1 sino digite 0'
      read*, res
      goto 10
      endif
      end
      
