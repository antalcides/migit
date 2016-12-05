      Program Integral
c------------------------------------------------------------------
c Integration of a function using external programs:
c int_trap - integration using trapezoid approximation
c int_simp - integration using Simpson's rule
c quanc8   - from "Computer Methods for Mathematical Computations",
c            by Forsythe, Malcolm, and Moler (1977)
c------------------------------------------------------------------
      Real*8 a, b, f, r, pi, s
      Real*8 abserr,relerr,rq,errest,flag
      integer*4 nint(6), i, n, nofun
      external f
      parameter (pi = 3.1415926)
      parameter (abserr=0.0, relerr=1.0e-16)

c* trapezoid and Simpson are calculated on following intervals
      data nint / 4, 8, 16, 256, 1024, 1048575/

      a = 0.0
      b = pi

      write(*,100)
      do i=1,6
         n = nint(i)
         call int_trap(f,a,b,r,n)
         call int_simp(f,a,b,s,n)
         write (*,101) n, r, s
      end do

      call quanc8(f,a,b,abserr,relerr,rq,errest,nofun,flag)
      write (*,102) rq, errest, nofun
100   format('     nint     Trapez.       Simpson')
101   format(I9,2(1pe14.5))
102   format(/,'quanc8 =',1pe12.5,'   error =',1pe12.5,I6' calls')

      End

c----------------------------------------
c Function for integration
c----------------------------------------
      Function f(x)
      Real*8 f, x, y
      f = sin(x)
c2    f = 0.2/((x-6.0)**2 + 0.02)
c3    f = x*cos(10.0*x**2)/(x**2 + 1.0)
c4    f = sqrt(x)/(x**2 + 1.0)
      return
      end