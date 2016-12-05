       program circulo
c **Este programa calcula el  rea de un c¡rculo.**

c **Declaraci¢n de variables**
       integer res
       real r, area


       parameter (pi=3.1416)
       res=1
11     if(res.EQ.1)then
       print*, 'Digite el radio del circulo'
       read*, r
       area=pi*r**2
       print*,'El valor del area es ', area
       print*, 'Si desea continuar digite 1 sino digite 0'

       read*, res
       goto 11
       endif
       end
