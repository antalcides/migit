c     Programa para calcular la distancia entre dos puntos en un plano
c     y la pendiente de la recta que los contiene
       program distancia
       real x1, x2 , y1, y2,d,m
       integer res
       res =1
20     if (res.eq.1)then

       print*, 'Entre los valores x1 y y1 '
       print*, 'Separe los valores con una coma'
       read*, x1, y1
       print*, 'Entre los valores x2, y2, '
       print*, 'Recuerde que x2 diferente de x1'
       read*, x2,y2
           if(x2.EQ.x1)then
            print*, 'Recuerde , x2 diferente de x1'
            d=sqrt((x2-x1)**2+(y2-y1)**2)
            print*, 'el valor de d es', d
            print*, 'el valor de m es indeterminado'
            
           else
            d=sqrt((x2-x1)**2+(y2-y1)**2)
            m=(y2-y1)/(x2-x1)
            print*, 'el valor de d es', d ,'  el valor de m es', m
          endif

       print*, 'Si quiere continuar digie 1 si no cero'
       read*,  res
       goto 20
       endif
       
       end

