c Programa inicial para el curso de FC
c El programa calcula el area de un circulo
      program circ
      c Declaracion de variables
      real pi,r,A
c Pido el valor del radio:
      print*, 'entre el radio del circulo'
      read*, r
c Calculo el area:
      pi= 3.14159
      A=pi*r**2
c Escribo el resultado a la pantalla
      print*, 'El area del circulo es', A
      end

