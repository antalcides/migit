CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C     Curso de Fisica Matematica  Y Computacional
C     Especializacion En Fisica General
C NOMBRE: Derivada
C AUTOR: Antalcides Olivo
C DESCRIPCION: Este programa calcula las derivadas parciales usando
C              diferncias finitas .
C FECHA: 07/11/03 17.50
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C

      program derivadas
      integer i,j ,k

      real dift(5),difd(5),difc(5), dif2(5),dx(5),x,A ,b
      real errorc(5),error2(5),errord(5),errort(5)
      Write(*,'(T5,A/)')
     & '***************************************************************'
C     Introducion:
      Write(6,'(T5,A/)')
     & 'Å*******************Å********************Å********************Å'
      write(6,'(T5,A/)')
     & ' calcule la 1§ y 2¦ derivada de f(x) = sin((pi/2)*x)',
     & 'para los valores de dx 0.0005,0.001,0.01,0.1 y 0.2'
      Write(6,'(T5,A/)')
     & 'Å****************Å*****************Å**************************Å'
      Write(*,'(T5,A/)')
     & '***************************************************************'
      Write(*,*) '                                                     '
      Write(*,*) '                                                     '

C**********************************************************************
      !definicion de las variables
      ! dift indica que realizaremos la derivada hacia adelante
      ! dift indica que realizaremos la derivada hacia atras
      ! difc indica que realizaremos la derivada centrada
      ! dx es el paso
      ! errord,errort,errorc representan los errores de las derivadas
      ! definidas anteriormente
      ! X representa el valor numerico de la derivada
      ! A representa el valor analitico de la derivada
C***********************************************************************

C     valor a evaluar:
      Write(6,'(T5,A/)') 'Ingrese el valor x a evaluar'
      read (5,*)  x
C     tama¤o del paso
      dx(1)=0.00001
      dx(2)=0.0001
      dx(3)=0.001
      dx(4)=0.1
      dx(5)=0.5
C      ** Valores analiticos de las derivadas
      A=fun1(x)
      b=fun2(x)
      Write(*,*) '                                                     '

       WRITE(*,'(3(T5,A/),3(T5,A/T5,(3(A,1PE13.6))/))')
     &' 1§ Derivada  ³ 1§ Derivada   ³  2¦ Derivada  ³              ',
     &'  diferencia  ³  diferencia   ³   diferncia   ³    N§ de paso',
     &'    hacia     ³    hacia      ³    centrada   ³              ',
     &'  adelaante   ³    atras      ³               ³              ',
     &'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄ'
C     calculamos la derivada:
      do 10 i=1,5
      difd(i)=(fun(x+dx(i))-fun(x))/dx(i)
      dift(i)=(fun(x)-fun(x-dx(i)))/dx(i)
      difc(i)=(fun(x+dx(i))-fun(x-dx(i)))/(2*dx(i))
      dif2(i)=(fun(x+dx(i)) -2*fun(x)+fun(x-dx(i)))/(dx(i)**2)
      write(6,100) difd(i), dift(i),dif2(i),dx(i)

100   format(t5,f8.5,10x,f8.5,10x,f8.5,10x,f8.5)


10    continue
      write(6,'(T5,A/)')'Resultado analitico'
      write(6,'(T5,A/)')'                                              '
      write(6,200) a, a,b
      write(6,'(T5,A/)')'                                              '
       WRITE(*,'(3(T5,A/),3(T5,A/T5,(3(A,1PE13.6))/))')
     &'     Error    ³    Error      ³  Error        ³              ',
     &'     En %     ³    En %       ³  En %         ³    N§ de paso'
200   format(t5,f8.5,10x,f8.5,10x,f8.5)

      do 30 j=1,5
      errord(j)=abs(((A-difd(j))/A)*100)
      errort(j)=abs(((A-dift(j))/A)*100)
      errorc(j)=abs(((A-difc(j))/A)*100)
      error2(j)=abs(((B-dif2(j))/B)*100)
       write(6,300) errord(j),errort(j),error2(j),dx(j)
300   format(t5,f8.5,10x,f8.5,10x,f8.5,10x,f8.5)

30      continue

       !WRITE(6,*)'El programa termino!'
C           **abrir los archivos y escribir los datos**


      close(20)
      do 50 k=1,5

      open(20,file='derivadad2.dat',status='unknown')
      open(40,file='derivada2c2.dat',status='unknown')
      open(60,file='derivadat2.dat',status='unknown')
      write(20,*) dx(k),errord(k)
      write(40,*) dx(k),error2(k)
      write(60,*) dx(k),errort(k)
50    continue
      close(20)
      close(40)
      close(60)
      end
C***********************************************************************
C           Definimos la funcion a evaluar:
C***********************************************************************
      function fun(X)
      real X
      fun = (x**3)-5*x
      end
C***********************************************************************
C     Primera derivada
      function fun1(X)
      real X
      fun1 = 3*(x**2)-5
      end
C***********************************************************************
C     Segunda derivada
      function fun2(X)
      real X
      fun2 = 6*x
      end
