module simpson
double precision eps
end module simpson

Program main
!------------------------------------------------------------
! Integration of a function f(x,y) using Simpson rule twice
! with doubling number of intervals and recursive calling
!------------------------------------------------------------
use simpson
implicit none
double precision a, b, f, simpson2D, integral
external f

a = 0.0
b = 1.0
eps = 1.0e-7
write(*,100)

 integral = simpson2D(f,a,b,eps)

write(*,103) integral
100 format(' 2D integration + Simpson rule')
103 format(' integral = ',f12.8)
stop
End

  Function f(x)
!----------------------------------------
! Function for integration over x
!----------------------------------------
use simpson
implicit none
double precision f, g, x, x1
double precision c, d, simpson2D
common/fxy/x1
external g
c = 0.0
d = sin(x)
x1 = x                     ! x1 passes the value of x to g(y)
 f = simpson2D(g,c,d,eps)
return
end

  Function g(y)
!----------------------------------------
! Function for integration over y
!----------------------------------------
implicit none
double precision g, y, x
common/fxy/x
!  g = (x + y)**2
  g = x*x/(y*y+2.0)
return
end  

  recursive function simpson2D(f,a,b,eps)
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
!==========================================================
implicit none
double precision f, a, b, eps, simpson2D
double precision sn, s2n, h, x
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
      simpson2D = s2n
      exit
   end if
   sn = s2n
   n = n*2
end do
return
end function simpson2D