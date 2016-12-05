      program rwalk04
c-----------------------------------------------------------------
c Random walk in 2 dimensions (self-avoiding 2D random walk)
c 2D Polymer simulation
c-----------------------------------------------------------------
c input from a keyboard:
c    number of trials
c output screen:
c    initial data, average polymer size
c output file:
c    polymer size for each trial (may be used later for histograms)
c Attention!!!
c the code call subroutine 'gettim' to get current time
c that name is not unique, and may be different for different compilers
c You may replace the seed number from current time by some seed number
c-----------------------------------------------------------------
c written by: Alex Godunov
c last revision: November 2006
c-----------------------------------------------------------------
      implicit none
      integer*4 iu, it, is, itests, iway, x, y
      integer*4 size, n, out, ntot, xold, yold, i, j
      integer*4 ihour, imin, isec, imsec
      parameter (size=1000)
      integer*4 a(1000,1000)
      real*4 rand, d, dav, nav, c

      write (*,*) ' 2D Polymer simulation'
      write (*,*) ' enter numbers of tests'
      read  (*,*) itests

      call gettim(ihour,imin,isec,imsec)
      iu = imsec*isec*imin+ihour
      call srand(iu)
      dav=0.0
      nav=0.0
      ntot=0
      open (unit=7,file='polymer.dat')

      do it=1,itests

c initialization before new trial
        x=size/2
        y=size/2
ccc        write(7,103) x-size/2,y-size/2
        out=0
        n=0

        do i=1,size
          do j=1,size
            a(i,j) = 0
          end do
        end do
c---
        do while (out.eq.0)
          xold=x
          yold=y
          c = rand()
            if(c.le.0.25) x = x+1
            if(c.gt.0.25.and.c.le.0.50) x=x-1
            if(c.gt.0.50.and.c.le.0.75) y=y+1
            if(c.gt.0.75) y=y-1
c is the (x,y) site vacant them accept the last step
          if(a(x,y).eq.0) then
            a(x,y)=1
            n = n+1
c output to plot a polymer
c            write(7,103) x-size/2,y-size/2
            else
              x=xold
              y=yold
          end if


c*** exit conditions
c condition 1: polymer is too large for a(x,y) array
c if x or y on array boundaries for a(x,y) then stop simultaion
          if(x.eq.1.or.x.eq.size.or.y.eq.1.or.y.eq.size) then
            write(*,102) x,y
            exit
          end if
c condition 2: no more available steps around new x,y where to go
          if(a(x+1,y)*a(x,y+1)*a(x-1,y)*a(x,y-1).eq.1) out=1

        end do

        d = sqrt((float(x-size/2))**2+(float(y-size/2))**2)
        dav = dav + d
        ntot = ntot + n
	  if((it/100)*100.eq.it) write(*,103) it, n
	  write(7,103) it, n
      end do

      dav = dav/float(itests)
      nav = float(ntot)/float(itests)
      write(*,100) itests, nav, dav

100   format(/,' itests: ',i7,/,' size: ',1pe14.4,/,' Ree:  ',e14.4)
101   format(2i8)
102   format('x or y exceeds a(x,y) size',2i10)
103   format(2i8)

      stop
      end