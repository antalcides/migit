c Programa para calcular el factorial de un numero
      program factorial
      integer factor,n,i
      print*, 'Entre el numero a calcular'
      read*, n
      factor=1
      DO 10 i=2,n
         factor = factor*i
10    CONTINUE
      print*, 'el valor de', n ,'! es', factor
      END



