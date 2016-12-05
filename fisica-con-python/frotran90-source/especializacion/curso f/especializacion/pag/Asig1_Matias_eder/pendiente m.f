c programa para calcular la distancia entre dos puntos
       program distancia
       real x1,x2,y1,y2,d,m
c este programa lee los numeros reales x,y,d y calcula la distancia entre
c dos puntos
       write(*,*)'entra los valores en este orden x1,x2,y1,y2'
       read(*,*) x1,x2,y1,y2
       d=((x1-x2)**2+(y1-y2)**2)**0.5
       write(*,*)'distancia',d
       continue
c subrutina para calcular la pendiente entre dos puntos
      write(*,*)'entra los valores en este orden x1,x2,y1,y2'
      read(*,*)x1,x2,y1,y2
      m=((y2-y1)/(x2-x1))
      write(*,*)'la pendiente es m=',m
      end
       
