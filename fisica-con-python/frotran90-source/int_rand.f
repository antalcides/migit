      program rinteg
c================================================================
c 1D intergration using Monte-Carlo method
c random numbers are generated either by rand() or urand
c
c written by Alex Godunov (October 2006)
c================================================================
      implicit none
      real*4 rint, x, xint, fint, a, b, pi
      real*4 rand, urand
      integer i, nmax, key, ix
      parameter (pi=3.1415926)

      write(*,*) ' enter number of random points'
      read(*,*) nmax

c*** initial values (rng, limits of integration)
      key = 1
      a = 0.0
      b = pi
      rint = 0.0
c initialization for random number generators
      call srand(1000)
      ix = 1000
c***
      do i=1,nmax
         if(key.eq.1) x = rand()
         if(key.eq.2) x = urand(ix)
         xint = a+(b-a)*x
         rint = rint+fint(xint)
      end do
      rint = rint*(b-a)/float(nmax)
      write(*,*) nmax, rint

      stop
      end

	function fint(x)
c----------------------------------------
c Function for integration
c----------------------------------------
      implicit none
      real*4 fint,x
      fint = sin(x)
c      fint = 0.2/((x-6.0)**2 + 0.02)
c      fint = x*cos(10.0*x**2)/(x**2 + 1.0)
      return
      end