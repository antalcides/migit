    Program main
!=============================================
! Integration of a function using Simpson rule 
!=============================================
implicit none
double precision f, a, b, integral
integer n, i
double precision, parameter:: pi = 3.1415926
external f

a = 0.0
b = pi

n = 2

write(*,100)

do i=1,16
   call simpson(f,a,b,integral,n)
   write (*,101) n, integral
   n = n*2
end do

100   format('     nint   Simpson')
101   format(i9,1pe15.6)
end


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

 Subroutine simpson(f,a,b,integral,n)
!==========================================================
! Integration of f(x) on [a,b]
! Method: Simpson rule for n intervals  
! written by: Alex Godunov (October 2009)
!----------------------------------------------------------
! IN:
! f   - Function to integrate (supplied by a user)
! a	  - Lower limit of integration
! b	  - Upper limit of integration
! n   - number of intervals
! OUT:
! integral - Result of integration
!==========================================================
implicit none
double precision f, a, b, integral,s
double precision h, x
integer nint
integer n, i

! if n is odd we add +1 to make it even
if((n/2)*2.ne.n) n=n+1

! loop over n (number of intervals)
s = 0.0
h = (b-a)/dfloat(n)
do i=2, n-2, 2
   x   = a+dfloat(i)*h
   s = s + 2.0*f(x) + 4.0*f(x+h)
end do
integral = (s + f(a) + f(b) + 4.0*f(a+h))*h/3.0
return
end subroutine simpson