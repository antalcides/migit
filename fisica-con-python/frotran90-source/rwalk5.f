      program rwalk05
c-----------------------------------------------------------------
c Random walk in 1 dimension
c Synchronized random walks
c-----------------------------------------------------------------
c input from a keyboard:
c    number of trials
c    site size
c output screen:
c    initial data, average number of steps until synchronization
c Attention!!!
c the code call subroutine 'gettim' to get current time
c that name is not unique, and may be different for different compilers
c You may replace the seed number from current time by some seed number
c-----------------------------------------------------------------
c written by: Alex Godunov
c last revision: October 2006
c-----------------------------------------------------------------
      implicit none
      integer*4 ihour, imin, isec, imsec
      integer*4 x1, x2, nsite, n, ntotal
      integer*4 iu, it, itests, step
      real*4    rand, nav, clr

      call gettim(ihour,imin,isec,imsec)
      iu = imsec*isec*imin+ihour
      call srand(iu)

      write (*,*) ' 1D Synchronized random walks'
      write (*,*) ' enter: numbers of tests and site size'
      read  (*,*) itests, nsite

      ntotal = 0

      do it=1,itests
         n=0
         x1 = 1 + nsite*rand()
         x2 = 1 + nsite*rand()
c---
         do while (x1.ne.x2)
            clr = rand()
            if(clr.lt.0.5000) then
              step =  1
              else
              step = -1
            end if
c---
            if(x1+step.gt.0.and.x1+step.le.nsite) x1 = x1+step
            if(x2+step.gt.0.and.x2+step.le.nsite) x2 = x2+step
            n = n+1
         end do
         ntotal = ntotal + n
      end do
      nav = float(ntotal)/float(itests)
      write(*,101) itests, nsite, nav

101   format(/,' tests =',i7,/,' nsite =',i7,/,' steps =',1pe11.4,/)
      stop
      end