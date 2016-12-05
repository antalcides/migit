c Programa para calcular la distancia entre dos puntos y la pendiente
c que pasa por esos dos puntos.
      program dist
      real x1,x2,y1,y2,d,m
      print*, 'entre las coordenadas de los puntos:x1,y1,x2,y2'
      read*, x1,y1,x2,y2
      d=sqrt((x2-x1)**2+ (y2-y1)**2)
      m=(y2-y1)/(x2-x1)
      print*, 'La distancia entre los dos puntos es', d
      print*, 'La pendiente de la recta que une los dos puntos es', m
      open(10,file='resultados.txt',status='unknown')
      write(10,40) d,m
40    format(f8.5)
      end


