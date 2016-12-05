c     Programa para convertir coordenadas polares a cartesianas

       program polares
       real angulo, r , grados,pi,x,y
       parameter (pi=3.1416)
       print*, 'Entre el angulo en grados '
       read*, grados
       print*, 'Entre el radio'
       read*, r
       angulo=(grados*pi)/180.0
       x=r*cos(angulo)
       y=r*sin(angulo)
       print*, 'el valor de x', x ,'el valor de y es', y
       end

