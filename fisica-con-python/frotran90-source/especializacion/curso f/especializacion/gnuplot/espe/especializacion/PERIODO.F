           program circulo
c           declaramos las variables
           real g,L, pi,T

           parameter (pi=3.14159,g=9.8)
c        Este programa lee un numero real L y muestra el periodo
c        del pendulo simple
           write (*,*) 'Escribe la Longitud del pendulo en m:'
           read  (*,*) L
           T=2*pi**2*(sqrt(L/g))
         write (*,*) 'T = ', area ,' s'
          stop
           end

           
