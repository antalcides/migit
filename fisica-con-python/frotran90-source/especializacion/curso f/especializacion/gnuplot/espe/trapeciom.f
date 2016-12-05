c     Este programa utiliza la regla del trapecio para
c     determinar el tiempo que tarda un cuerpo en deslizarse
c     desde la parte mas alta de un plano partiendo del reposo
c     hasta alcanzar una velocidad v.
c     En este problema se considera la resistencia del aire y la
c     friccion del plano sobre el cuerpo
      program trapeciom
      real v0,vf,d,suma,h,Tn,Ta,et,X,sum,Ln,La,el,e,Y
      integer i,j,n,res
        res =1
30     if (res.eq.1)then
      write(*,*)'******************************************************'
      write(6,*)'Integracion numerica'
      write(6,*)'Regla del Trapecio'
      write(6,*)'******************************************************'
      write(6,*)'Ingrese el valor de v0 entre (0 , 27.215)'
      read(*,*) v0
      write(6,*)'Ingrese el valor de vf mayor que v0 y menor que 27.215'
      read(*,*) vf
      write(6,*)'Ingrese el tama¤o de la particion N'
      read(*,*) n
c     Empieza el algoritmo para calcular la integral usando N subintervalos
      d=(vf-v0)/n
      suma=F(vf)+F(v0)
      X=v0
      do 10 i=2,n
      X=X+d
      suma=suma+2*F(X)
10    continue
      Tn=(d/2.)*suma
c     Ahora calculamos la distancia recorrida

      h=Tn/n
      sum=R(Tn)+R(0)
      Y=0
      do 20 j=2,n
      Y=Y+h
      sum=sum+2*R(Y)
20    continue
      Ln=(h/2.)*sum
      Ta=g(vf)-g(v0)
      et=abs((Tn-Ta)/Ta)*100
      La=P(Tn)-P(0)
      el=abs((Ln-La)/La)*100
      e=s(vf)/(12*n**2)
      write(6,*)'***************************************************'
      write(6,*)'Resultado para N=',N,':'
      WRITE(*,'(3(T3,A/),3(T3,A/T3,(3(A,1PE13.6))/))')
     &'              ³ Valor numerico³ Valor analit. ³              ',
     &'              ³ estimado de la³ de la integral³   Diferencia ',
     &'              ³ integral      ³               ³   en %       ',
     &'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄ',
     &'Tiempo        ³ ' ,Tn    ,  ' ³ ' ,Ta    ,  ' ³ ',et          ,
     &'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ',
     &'Dista.        ³ ' ,Ln    ,  ' ³ ' ,La    ,  ' ³ ',el
      write(6,*) ' Error = ',e
      write(6,*)'***************************************************'
      WRITE(6,*)'El programa termino!'
       print*, 'Si quiere continuar digie 1 si no cero'
       read*,  res
       goto 30
      ENDIF
      open(10,file='trapeciom.txt',status='unknown')
      write(10,200)'Resultado para N=',N,':'
      write(10,201)'***************************************************'
      write(10,202) ' Resultado de la Integral numerica para t: ',Tn
      write(10,203) ' Resultado de la Integral analitica para t: ',Ta
      write(10,204) ' Diferencia = ',et,'%'
      write(10,205) ' Resultado de la Integral numerica para L: ',Ln
      write(10,206) ' Resultado de la Integral analitica para L: ',La
      write(10,207) ' Diferencia = ',el,'%'
      write(10,208) ' Error = ',e
      write(10,209)'***************************************************'


200   format(a20,i4,a2)
201   format(a50)
202   format(a45,f8.6)
203   format(a45,f8.6)
204   format(a15,f8.6,a2)
205   format(a45,f8.6)
206   format(a45,f8.6)
207   format(a15,f8.6,a2)
208   format(a10,d8.3)
209   format(a50)

      end
      
      
      
      
      
      
c           Declaracion de funciones
      function F(x)
      real x
      F= 3./(48-(12*(sqrt(3.)))-x)
      end


      function g(x)
      real x
      g= 3*(3.3038-log(48.-(12*(sqrt(3.)))-x))
      end

      function R(x)
      real x
      R= (48-12*(sqrt(3.)))*(1-exp(-(x/3.)))
      END

      function P(x)
      real x
      P= (48-12*(sqrt(3.)))*(x+3*exp(-(x/3.))-3)
      END
      
      function s(x)
      real x
      s=6/(48.-(12*(sqrt(3.)))-x)**3
      end

      
      
