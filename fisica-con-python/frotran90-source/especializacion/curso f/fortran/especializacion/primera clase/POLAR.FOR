c Programa para convertir coordenadas polares a cartesianas
      program polar
      real r,Z,X,Y
      parameter(PI=3.14159)
      print*, 'ENTRE LA DISTANCIA r'
      read*, r
      print*, 'ENTRE EL ANGULO EN GRADOS'
      read*, Z
       X = r*COS(Z*PI/180.0)
       Y = r*SIN(Z*PI/180.0)
      print*, 'LAS COORDENADAS X,Y SON',X,Y
      end
