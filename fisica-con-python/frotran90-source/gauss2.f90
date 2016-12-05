Program main
!------------------------------------------------------------------
! Integration of a function using Gauss 8 and 16 points 
! with doubling number of intervals 
! till  error = |I_16 - I_8| < eps
!------------------------------------------------------------------
implicit none
double precision a, b, f, integral, eps
external f
integer nint
double precision, parameter :: pi = 3.1415926
 a = 0.0
 b = pi
 eps = 1.0e-6
 call gauss2(f,a,b,eps,integral,nint)
 write(*,103) nint, integral
103 format(' intervals = ',i8,/,' integral  = ',f12.8)
stop
End

  Function f(x)
!----------------------------------------
! Function for integration
!----------------------------------------
implicit none
double precision f, x
 f = sin(x)
! f = x*cos(10.0*x**2)/(x**2 + 1.0)
return
end

 Subroutine gauss2(f,a,b,eps,integral,nint)
!==========================================================
! Integration of f(x) on [a,b]
! Method: Gauss quadratures with doubling number of intervals  
!         till  error = |I_16 - I_8| < eps
! written by: Alex Godunov (October 2009)
!----------------------------------------------------------
! IN:
! f   - Function to integrate (supplied by a user)
! a	  - Lower limit of integration
! b	  - Upper limit of integration
! eps - tolerance
! OUT:
! integral - Result of integration
! nint     - number of intervals to achieve accuracy
!==========================================================
implicit none
double precision f, a, b, eps, integral, gauss8, gauss16
double precision s1, s2, h, ax, bx
integer nint
integer, parameter :: nmax=16384    ! max number of intervals
integer n, i
external f

! loop over number of intervals (starting from 1 interval)
n=1
do while (n <= nmax)
   s1 = 0.0
   s2 = 0.0   
   h = (b-a)/dfloat(n)
   do i=1, n
      ax = a+h*dfloat(i-1)
      bx = ax + h
      s1 = s1 + gauss8(f,ax,bx)
      s2 = s2 + gauss16(f,ax,bx)
!write(*,101) i, ax, bx, s1, s2
!101 format(i5,4f15.5)
   end do
   if(abs(s2-s1)<= eps .and. abs(s2-s1)/abs(s2+s1)<= eps) then
      integral = s2
      nint = n
      exit
   end if
   integral = s2
   nint = n
   n = n*2
end do
return
end subroutine gauss2

  Function gauss8(f,a,b)
!==========================================================
! Integration of f(x) on [a,b]
! Method: Gauss 8 points  
! written by: Alex Godunov (October 2009)
!----------------------------------------------------------
! IN:
! f   - Function to integrate (supplied by a user)
! a	  - Lower limit of integration
! b	  - Upper limit of integration
! OUT:
! gauss8 - Result of integration
!==========================================================
implicit none
integer, parameter :: n=4
double precision gauss8, f, a, b
double precision ti(n), ci(n)
data ti/0.1834346424, 0.5255324099, 0.7966664774, 0.9602898564/
data ci/0.3626837833, 0.3137066458, 0.2223810344, 0.1012285362/ 
double precision r, m, c
integer i

r = 0.0;
m = (b-a)/2.0;
c = (b+a)/2.0;

do i = 1,n 
r = r + ci(i)*(f(m*(-1.0)*ti(i) + c) + f(m*ti(i) + c))
end do
    gauss8 = r*m
return
end function gauss8

  Function gauss16(f,a,b)
!==========================================================
! Integration of f(x) on [a,b]
! Method: Gauss 16 points  
! written by: Alex Godunov (October 2009)
!----------------------------------------------------------
! IN:
! f   - Function to integrate (supplied by a user)
! a	  - Lower limit of integration
! b	  - Upper limit of integration
! OUT:
! gauss16 - Result of integration
!==========================================================
implicit none
integer, parameter :: n=8
double precision gauss16, f, a, b
double precision ti(n), ci(n)
data ti/0.0950125098, 0.2816035507, 0.4580167776, 0.6178762444, &  
        0.7554044083, 0.8656312023, 0.9445750230, 0.9894009349/ 
data ci/0.1894506104, 0.1826034150, 0.1691565193, 0.1495959888, &
        0.1246289712, 0.0951585116, 0.0622535239, 0.0271524594/ 
double precision r, m, c
integer i

r = 0.0;
m = (b-a)/2.0;
c = (b+a)/2.0;

do i = 1,n 
r = r + ci(i)*(f(m*(-1.0)*ti(i) + c) + f(m*ti(i) + c))
end do
    gauss16 = r*m
return
end function gauss16

