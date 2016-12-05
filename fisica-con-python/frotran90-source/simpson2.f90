Program main
!------------------------------------------------------------------
! Integration of a function using Simpson rule 
! with doubling number of intervals
!------------------------------------------------------------------
implicit none
double precision a, b, f, integral, eps
external f
integer nint
double precision, parameter :: pi = 3.1415926
 a = 0.0
 b = pi
 eps = 1.0e-8
 call simpson2(f,a,b,eps,integral,nint)
 write(*,103) nint, integral
103 format(' intervals = ',i8,/,' integral  = ',f15.9)
stop
End

  Function f(x)
!----------------------------------------
! Function for integration
!----------------------------------------
implicit none
double precision f, x
! f = sin(x)
 f = x*cos(10.0*x**2)/(x**2 + 1.0)
return
end

 Subroutine simpson2(f,a,b,eps,integral,nint)
!==========================================================
! Integration of f(x) on [a,b]
! Method: Simpson rule with doubling number of intervals  
!         till  error = coeff*|I_n - I_2n| < eps
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
double precision f, a, b, eps, integral
double precision sn, s2n, h, x
integer nint
double precision, parameter :: coeff = 1.0/15.0 ! error estimate coeff
integer, parameter :: nmax=1048576              ! max number of intervals
integer n, i

! evaluate integral for 2 intervals (three points)
h = (b-a)/2.0
sn = (1.0/3.0)*h*(f(a)+4.0*f(a+h)+f(b))

! loop over number of intervals (starting from 4 intervals)
n=4
do while (n <= nmax)
   s2n = 0.0   
   h = (b-a)/dfloat(n)
   do i=2, n-2, 2
      x   = a+dfloat(i)*h
      s2n = s2n + 2.0*f(x) + 4.0*f(x+h)
   end do
   s2n = (s2n + f(a) + f(b) + 4.0*f(a+h))*h/3.0
   if(coeff*abs(s2n-sn) <= eps) then
      integral = s2n + coeff*(s2n-sn)
      nint = n
      exit
   end if
   sn = s2n
   n = n*2
end do
return
end subroutine simpson2