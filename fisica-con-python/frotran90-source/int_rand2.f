      program rinteg2
c================================================================
c N-dimension integration
c Intergration using Monte-Carlo method
c random numbers are generated either by rand()
c
c written by Alex Godunov (October 2006)
c================================================================
      implicit none
      real*8 rint, x(5), xint, fint, a, b, pi
      real*4 rand
      integer i, nmax, key, ix, j
      parameter (pi=3.1415926)
      
      write(*,*) ' enter number of random points'
      read(*,*) nmax

c*** initialization
      rint = 0.0
      call srand(777)
c***
      do i=1,nmax
        do j=1,5
          x(j) = rand()
        end do
        rint = rint+fint(x)
      end do
      rint = rint/float(nmax)
      write(*,100) nmax, rint
100   format(' n points = ',I7,5x,'Integral = ',f10.6)
      stop
      end

      function fint(x)
c----------------------------------------
c Function for integration
c----------------------------------------
      implicit none
      real*8 fint,x(5)
      fint = (x(1)+x(2)+x(3)+x(4)+x(5))**2
      return
      end
