 program main
!====================================================================
!  A system of tridiagonal linear equations C*x=b
!  Method: calls the Thomas method
!====================================================================
implicit none
integer, parameter :: n=8
double precision c(n,3), b(n), x(n)
integer i,j
! matrix C
  data (c(1,i), i=1,3) / -0.0, 4.0,  -1.0 /
  data (c(2,i), i=1,3) / -1.0, 4.0,  -1.0 /
  data (c(3,i), i=1,3) / -1.0, 4.0,  -1.0 /
  data (c(4,i), i=1,3) / -1.0, 4.0,  -1.0 /
  data (c(5,i), i=1,3) / -1.0, 4.0,  -1.0 /
  data (c(6,i), i=1,3) / -1.0, 4.0,  -1.0 /
  data (c(7,i), i=1,3) / -1.0, 4.0,  -1.0 /
  data (c(8,i), i=1,3) / -1.0, 4.0,  -0.0 /
! matrix b
  data (b(i),i=1,n) / 0.0,0.0,0.0,0.0,0.0,0.0,0.0,16.0/

! print a header and the original equations
  write (*,200)
  do i=1,n
     write (*,201) (c(i,j),j=1,3), b(i)
  end do

  call thomas(c,b,x,n)

! print solutions
  write (*,203)
  write (*,201) (x(i),i=1,n)
200 format (' The Thomas method for tridiagonal systems ',/,/, &
            ' Matrix A and vector b')
201 format (4f12.6)
202 format (/,' Matrix A and vector b after elimination')
203 format (/,' Solutions x(n)')
end

  subroutine thomas(c,b,x,n)
!============================================================
! Solutions to a system of tridiagonal linear equations C*x=b
! Method: the Thomas method
! Alex G. November 2009
!-----------------------------------------------------------
! input ...
! c(n,3) - array of coefficients for matrix C
! b(n)   - vector of the right hand coefficients b
! n      - number of equations
! output ...
! x(n)   - solutions
! comments ...
! the original arrays c(n,3) and b(n) will be destroyed 
! during the calculation
!===========================================================
implicit none 
integer n
double precision c(n,3), b(n), x(n)
double precision coeff
integer i

!step 1: forward elimination
do i=2,n
  coeff=c(i,1)/c(i-1,2)
  c(i,2)=c(i,2)-coeff*c(i-1,3)
  b(i)=b(i)-c(i,1)*b(i-1)
end do

!step 2: back substitution
x(n) = b(n)/c(n,2)
do i=n-1,1,-1
   x(i) = (b(i)- c(i,3)*x(i+1))/c(i,2)
end do
end subroutine thomas