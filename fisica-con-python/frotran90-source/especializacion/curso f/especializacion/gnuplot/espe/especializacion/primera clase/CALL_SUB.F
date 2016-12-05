c Este programa es un ejemplo para la aplicacion de las expresiones
c logicas.
c Tambi‚n crearemos un menu para aplicar la sentencia do y do while
      program call_sub
      integer menu
      print*, 'Escoja la opcion deseada'
      print*, '1 para sumar dos numeros'
      print*, '2 para restar dos numeros'
      print*, '3 para multiplicar dos numeros'
      print*, '4 para dividir dos numeros'
      print*, '5 para salir'
      read*, menu
      do while (menu.NE.5)
      if (menu.EQ.1) then
          call sum
          else if (menu.EQ.2) then
               call rest
               else if (menu.EQ.3) then
                    call prod
                    else if (menu.EQ.4) then
                         call div
                         else
                         print*, 'escoja otra opcion de 1 a 5'
      end if
      print*, 'Escoja la opcion deseada'
      print*, '1 para sumar dos numeros'
      print*, '2 para restar dos numeros'
      print*, '3 para multiplicar dos numeros'
      print*, '4 para dividir dos numeros'
      print*, '5 para salir'
      read*, menu
      end do
      print*,'Que tenga un buen dia !!!'
      end
c Subrutina para sumar dos numeros
      subroutine sum
      real a,b,suma
      print*, 'entre los numeros a y b'
      read*, a,b
      suma=a+b
      print*, 'La suma de a + b es', suma
      return
      end
c Subrutina para restar dos numeros
      subroutine rest
      real a,b,resta
      print*, 'entre los numeros a y b'
      read*, a,b
      resta=a-b
      print*, 'La resta de a - b es', resta
      return
      end
c Subrutina para multiplicar dos numeros
      subroutine prod
      real a,b,producto
      print*, 'entre los numeros a y b'
      read*, a,b
      producto=a*b
      print*, 'El producto de a * b es', producto
      return
      end
c Subrutina para dividir dos numeros
      subroutine div
      real a,b,division
      print*, 'entre los numeros a y b'
      read*, a,b
      division=a+b
      print*, 'La division de de a / b es', division
      return
      end
