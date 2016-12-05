c     Este programa utiliza la regla del trapecio
c     para resolver el movimiento de un cuerpo
c     sobre un plano inclinado considerando la
c     resistencia del aire y la fricci¢n
      program trapecio
      real a, b,d,suma,It,t,v
      integer i,n
      write(*,*)'***************************************************'
      write(*,*)'Integracion numerica'
      write(*,*)'regla del Trapecio'
      write(*,*)'***********************'
      write(*,*) 'Ingrese el limite inferior entre 0 y L'
      read(*,*) a
      write(*,*) 'Ingrese el limite superior entre 0 y L'
      read(*,*) b
      write(*,*) 'Ingrese el numero N de puntos en [a,b], N es natural'
      read(*,*) n
      d=(b-a)/(2*n)
      suma=0
      do 2  i=1,n
      suma=suma+y(a+i)
2     continue
      It=d*(Y(a)+(2.*suma)+Y(b))
      write(*,*) 'Ingrese el valor de t'
      read(*,*) t
      v=(48.-12.*sqrt(3.))*(1.-exp(-t/3.))
      print*,' La velocidad es v=',v,' ft/s'
      write(*,*)'Resultado para N=',N,':'
      write(*,*)'**************************************************'
      write(*,*) ' Resulatado de la Integral numerica',It
      write(*,*)'*************************************************'
      end
      
c      Declaracion de funciones
      function y(x)
      real x
      y= 1./(48-(12*(sqrt(3.)))-x)
      end
      
      

      
