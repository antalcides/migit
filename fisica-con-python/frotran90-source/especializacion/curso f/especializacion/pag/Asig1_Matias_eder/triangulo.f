c     este programa dertermina si un trianùgulo es isosceles, escaleno o equilatero
c       de acuerdo a sus lados
       program triangulo
c este programa lee los numeros x,y,z y determina si el triangulo es isosceles
c escaleno o equilatero
       real x,y,z
    6   print*,' triangulo isosceles x.eq.y, y.ne.z ,x.ne.z'
    7   print*,' trianculo escaleno x.ne.y.ne.z'
    8   print*,'triangulo equilatero x.eq.y.eq.z'
       print*,'identifica el triangulo segun los lados'
       print*,'entra los valores x,y,z'
       read(*,*) x,y,z
        if( x.eq.y.ne.z) goto 6
        if(x.ne.y.ne.z) goto 7
        if(x.eq.y.eq.z) goto 8
       write(*,*)'eltriangulo es'
       end
