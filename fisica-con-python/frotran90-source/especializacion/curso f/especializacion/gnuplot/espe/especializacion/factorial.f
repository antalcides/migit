c     Pprograma para calcular el factorial de un numero
       program factorial
       integer factor,n,i
       print*, 'Entre el numero a calcular'
       read*, n
       factor=1
       Do 10 i= 2,n
       factor = factor+((2*i)-1)**2
10       continue

       print*, 'el valor de', n ,'! es', factor
       end

