c Programa para calcular la depresion de un articulo
      program depre
      real V0,R,N
      print*, 'ENTRE EL VALOR INICIAL'
      read*, V0
      print*, 'ENTRE LA TASA DE DEPRESIACION'
      read*, R
      print*, 'ENTRE EL NUMERO DE AÒOS'
      read*, N
      VN = V0*(1-R)**N
      print*, 'LA DEPRESIACION ES',VN
      END
