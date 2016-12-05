c     Este programa utiliza la regla del trapecio
c     para resolver el movimiento de un cuerpo
c     sobre un plano inclinado considerando la
c     resistencia del aire y la fricci¢n
      program trapecio
      real a,b,d,suma,Ia,In,et,h,sum,Ln,La,el
      integer i,n,j ,res
            res =1
20     if (res.eq.1)then
      write(*,*)'******************************************************'
      write(*,*)'Integracion numerica'
      write(*,*)'regla del Trapecio'
      write(*,*)'******************************************************'
      write(*,*) 'Ingrese el limite inferior entre 0 y 27.215'
      read(*,*) a
      write(*,*)'Ingrese el limite superior mayor que v0 y menor que 27'
      read(*,*) b
      write(*,*) 'Ingrese el numero N de puntos en [a,b], N es natural'
      write(*,*)' y menor de 60'
      read(*,*) n
      d=(b-a)/(2*(n-1))
      suma=0
      do 2  i=1,n-2
      suma=suma+y(a+i*(2*d))
2      continue
      In=d*(Y(a)+(2.*suma)+Y(b))
      Ia=g(b)-g(a)
      et=abs((Ia-In)/Ia)*100
c     definimos en esta parte la forma para determinar la distancia
      h=In/(2*(n-1))
      sum=0
      do 3 j=1,n-2
      sum=sum+R(j*(2*h))
3     continue
      Ln=h*(R(0)+(2*sum)+R(In))
      La=T(In)-T(0)
      el=abs((La-Ln)/La)*100.
      
      write(6,*)'Resultado para N=',N,':'
      WRITE(*,'(3(T3,A/),3(T3,A/T3,(3(A,1PE13.6))/))')
     &'              ³ Valor numerico³ Valor analit. ³              ',
     &'              ³ estimado de la³ de la integral³   Diferencia ',
     &'              ³ integral      ³               ³   en %       ',
     &'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄ',
     &'Tiempo        ³ ' ,In    ,  ' ³ ' ,Ia    ,  ' ³ ',et          ,
     &'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ',
     &'Dista.        ³ ' ,Ln    ,  ' ³ ' ,La    ,  ' ³ ',el
      WRITE(6,*)'El programa termino!'
       print*, 'Si quiere continuar digie 1 si no cero'
       read*,  res
       goto 20
      ENDIF
      open(10,file='trapecio21.txt',status='old')
      write(10,200)'Resultado para N=',N,':'
      write(10,201)'***************************************************'
      write(10,202) ' Resultado de la Integral numerica para t: ',In
      write(10,203) ' Resultado de la Integral analitica para t: ',Ia
      write(10,204) ' Diferencia = ',et,'%'
      write(10,205) ' Resultado de la Integral numerica para L: ',Ln
      write(10,206) ' Resultado de la Integral analitica para L: ',La
      write(10,207) ' Diferencia = ',el,'%'
      write(10,208)'***************************************************'


200   format(a20,i4,a2)
201   format(a50)
202   format(a45,f8.6)
203   format(a45,f8.6)
204   format(a15,f8.6,a2)
205   format(a45,f8.6)
206   format(a45,f8.6)
207   format(a15,f8.6,a2)
208   format(a50)

      end
      
c      Declaracion de funciones
      function y(x)
      real x
      y= 3./(48-(12*(sqrt(3.)))-x)
      end
      
      
      function g(z)
      real z
      g= 3*(3.3038-log(48.-(12*(sqrt(3.)))-z))
      end
      
      function R(t)
      real t
      R= (48-12*(sqrt(3.)))*(1-exp(-(t/3.)))
      END
      
      function T(w)
      real w
      T= (48-12*(sqrt(3.)))*(w+3*exp(-(w/3.))-3)
      END
      
