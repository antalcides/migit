      program random2
c================================================================
c testing two random number generators
c rand  : standard Fortran library
c urand : from "Computer Methods for Mathematical Computations",
c         by Forsythe, Malcolm, and Moler (1977) 
c         (see also www.netlib.org)
c the code
c 1. generates two arrays xr() and yr() with random numbers
c    between 0.0 and 1.0
c 2. calculates k-th momentum for both arrays (has to be 1.0/(k+1.0)
c 3. the near-neighbor correlation (has to be 0.25)
c
c written by Alex Godunov (October 2006)
c================================================================
      implicit none
      real*4 x(10000), y(10000)
      real*4 rand, urand, xm, ym, xth
      integer i, ix, iy, key, nmax, kmoment, kshift
      parameter (nmax=1000)
      xm = 0.0
      ym = 0.0
c if key =1 then rand program is used
c if key =2 then urand program is used
      key = 1
      kmoment = 4
      kshift =  5
        open (unit=7,file='random03.dat')
        open (unit=8,file='random04.dat')

c*** first random array x(i)
      call srand(1000)
      ix = 1000
      do i=1,nmax
         if(key.eq.1) x(i) = rand()
         if(key.eq.2) x(i) = urand(ix)
      end do
c*** second random array y(i)
      call srand(321)
      iy = 9999
      do i=1,nmax
         if(key.eq.1) y(i) = rand()
         if(key.eq.2) y(i) = urand(iy)
      end do
c*** write x and y arrays together with k-th momentum      
      do i=1,nmax
        write(7,101) x(i),y(i)
        xm=xm+(x(i)**kmoment)/float(nmax)
        ym=ym+(y(i)**kmoment)/float(nmax)
	end do
        xth = 1.0/float(kmoment+1)
        write(*,102) kmoment, xm, ym

	xm = 0.0
c*** write correlation (same array)
c and calculate the near-neighbor correlation (has to be close to 0.25)
       do i=1,nmax-kshift
          write(8,101) x(i),x(i+kshift)
          xm = xm + x(i)*x(i+kshift)/float(nmax)
       end do
       write(*,103) xm

101   format(2(1pe14.4))
102   format(' k-th moment test for two RNGs',/,' k=',i3,2f8.4)
103   format(' near-neighbor correlation = ',f7.4)
	stop

	end