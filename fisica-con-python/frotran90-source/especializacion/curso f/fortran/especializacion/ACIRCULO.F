           program circulo
c           declaramos las variables
           real r, area, pi

           parameter (pi=3.14159)
c        Este programa lee un numero real r y muestra el area
c        del circulo con radio r
           write (*,*) 'Escribe el radio r en cm:'
           read  (*,*) r
           area=pi*r*r
           write (*,*) 'Area = ', area ,' cm^2'
           write (*,*) 'Desea ingresar otro valor para el radio'
           read (*,*) r
             area=pi*r*r
             write (*,*) 'Area = ', area ,' cm^2'

           end

           
