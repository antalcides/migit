       program energia
       
c      **Este programa calcula la energia cinetica de un cuerpo**

c       **Declaraci¢n de variables**

        real T,m,v,v1
        m=20
        v=80
        v1= (v*1000)/3600
        T=0.5*m*v1**2
         open (10,file='energia.txt',status='old')
         write(10,20) 'El valor de  la energia cinetica es ', T
20       format(a40,f8.3)
        print*,'El valor de  la energia cinetica es ', T , '  J'

       end
