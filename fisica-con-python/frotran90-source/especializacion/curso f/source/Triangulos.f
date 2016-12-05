c Este programa identifica cuando un tri ngulo determinado por tres
c puntos es Equil tero, Is¢sceles o Escaleno de acuerdo a la medida de
c sus lados.
      program triangulos
      real a,b,c,m,x1,x2,x3,y1,y2,y3,p,r
      print*, 'Ingrese las coordenadas x e y del primer punto'
      read*, x1
      read*, y1
      print*, ' Ingrese las coordenas x e y del segundo punto'
      read*, x2
      read*, y2
      print*, ' Ingrese las coordenas x e y del tercer punto'
      read*, x3
      read*, y3
      m=(y2-y1)/(x2-x1)
      p=y3-y1
      r=m*(x3-x1)
      if(p.EQ.r)then
        print*, 'Los puntos son colineales, no determinan un tri ngulo'
      else
        print*, 'Los puntos si determinan un tri ngulo'
        a=sqrt((x2-x1)**2+(y2-y1)**2)
        b=sqrt((x3-x1)**2+(y3-y1)**2)
        c=sqrt((x3-x2)**2+(y3-y2)**2)
        if(a.EQ.b)then
          if(b.EQ.c)then
            print*, 'El triangulo es Equil tero'
          else
            print*, 'El triangulo es Is¢sceles'
          endif
        elseif(a.NE.b)then
          if(b.EQ.c)then
            print*, 'El triangulo es Is¢sceles'
          else
            if(a.NE.c)then
              print*, 'El triangulo es Escaleno'
            else
              print*, 'El triangulo es Is¢sceles'
            endif
          endif
        endif
      endif
      end
