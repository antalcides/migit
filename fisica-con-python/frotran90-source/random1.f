      program random1
c================================================================
c random number generator based on Linear Congruent Method
c
c the code
c 1. generates two arrays xr() and yr() with random numbers
c    between 0.0 and 1.0
c 2. calculates k-th momentum for both arrays (has to be 1.0/(k+1.0)
c 3. the near-neighbor correlation (has to be 0.25)
c
c written by Alex Godunov (October 2006)
c================================================================
      implicit none
      real*8 xr(5000), yr(5000), xm, ym
      integer*4 i, a, c, m, x0, x(5000), y(5000), kshift, nmax
      integer*4 kmoment
c
c good choice of a, c, m and initial x(1)
c is important for getting good random numbers
c
      parameter (a=123, c=0, m=1000000,kshift=5,nmax=5000)
c first file = output two random arrays
      open (unit=7,file='random01.dat')
c second file = output correlation between x(i) and x(kshift)
      open (unit=8,file='random02.dat')
c correlation moment to be calculated
      kmoment = 3

      xm = 0
      ym = 0
      x(1)=      33
      y(1) = 777777

      do i=2,nmax
         x(i) = mod(a*x(i-1)+c,m)
         y(i) = mod(a*y(i-1)+c,m)
         xr(i)= float(x(i))/float(m-1)
         yr(i)= float(y(i))/float(m-1)
         xm=xm+(xr(i)**kmoment)/float(nmax)
         ym=ym+(yr(i)**(kmoment))/float(nmax)
         write(7,101) xr(i),yr(i)
      end do

      write(*,100) kmoment, xm, ym

c*** write correlation (same array)
c and calculate the near-neighbor correlation (has to be close to 0.25)
      xm = 0.0
      do i=2,nmax-kshift
         write(8,101) xr(i),xr(i+kshift)
         xm = xm + xr(i)*xr(i+kshift)/float(nmax)
      end do
      write(*,103) xm

100   format(' k-th moment test for two RNGs',/,' k=',i3,2f8.4)
101   format(2(1pe14.4))
103   format(' near-neighbor correlation = ',f7.4)
      stop
      end