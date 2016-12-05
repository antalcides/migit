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

      real dift, difd,difc, dif2,dx,x,A, a2,errord,errort,errorc,error2
      Write(*,*) '*****************************************************'
      Write(*,*) ' Este programa calcula la derivada de '
      Write(*,*) ' f(x)= 7(X**5) +4(X**3)-2(X**2)+X-1 '
      Write(*,*) '*****************************************************'
      Write(*,*) '                                                     '
      Write(*,*) '                                                     '
      Write(*,*) '                                                     '
C**********************************************************************
      !definicion de las variables
      ! dift indica que realizaremos la derivada hacia adelante
      ! dift indica que realizaremos la derivada hacia atras
      ! difc indica que realizaremos la derivada centrada
      ! dif2 indica que realizaremos la segunda derivada
      ! dx es el paso
      ! errord,errort,errorc representan los errores de las derivadas
      ! definidas anteriormente
      ! X representa a evaluar de la derivada
      ! A representa el valor analitico de la derivada
       ! A2 representa el valor analitico de la 2¦ derivada
C***********************************************************************
C     valor a evaluar:
      x=0.5
C     tama¤o del paso
      dx= 0.1
C     calculamos la derivada:
      difd=(fun(x+dx)-fun(x))/dx
      dift=(fun(x)-fun(x-dx))/dx
      difc=(fun(x+dx)-fun(x-dx))/(2*dx)
      dif2=(fun(x+dx)-2*fun(x)+fun(x-dx))/(dx**2)
C      print*, 'difd=', difd
C      !print*, 'dift=', dift
C      !print*, 'difc=', difc
      a=fun1(x)
      a2=fun2(x)
      errord=((abs(A-difd))/A)*100
      errort=((abs(A-dift))/A)*100
      errorc=((abs(A-difc))/A)*100
      error2=((abs(A2-dif2))/A2)*100
       WRITE(*,'(3(T4,A/),3(T4,A/T4,(3(A,1PE13.6))/))')
     &'              ³ Valor numerico³ Valor analit. ³              ',
     &'              ³estimado       ³ ******        ³   Diferencia ',
     &'              ³               ³  ******       ³   en %       ',
     &'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄ',
     &'difd          ³ ',difd,     ' ³ ' ,a     ,  ' ³ ', errord     ,
     &'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ',
     &'dift          ³ ',dift   ,  ' ³ ' ,a     ,  ' ³ ',errort,
     &'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ',
     &'difc          ³ ' ,difc ,   ' ³ ' ,a     ,  ' ³ ',errorc   ,
     &'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ',
     &'dif2          ³ ' ,dif2 ,   ' ³ ' ,a2    ,  ' ³ ',error2
      WRITE(6,*)'El programa termino!'

      end
C***********************************************************************
C           Definimos las funciones a evaluar:
      function fun(X)
      real X
      fun = 7*(X**5) +4*(X**3)-2*(X**2)+X-1
      end
C********************************************************
      function fun1(X)
      real X
      fun1 = 35*(X**4) +12*(X**2)-4*X+1
      end
C********************************************************
       function fun2(X)
      real X
      fun2 = 140*(X**3) +24*X-4
      end


      
