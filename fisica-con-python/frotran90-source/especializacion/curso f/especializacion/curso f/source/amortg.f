C**********************************************************************
C NOMBRE:  Amortiguamiento
C AUTOR: Antalcides Olivo Burgos
C DESCRIPCION: Comportamiento de un carro cuando se golpea en un anden
C FECHA: 29-10-2003
C**********************************************************************
C 29/10/03 10:47
      program amortig
      implicit real (a-h,o-z)
      parameter (n=4, npt=200)
      dimension Y(N), dydx(n), yout(n)
      real*8 m1,m2,k1,k2
      common


