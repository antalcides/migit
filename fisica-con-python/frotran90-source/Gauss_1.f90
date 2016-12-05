 program main
!====================================================================
!  A system of linear equations A*x=b
!  Method: calls the basic elimination
!====================================================================
implicit none
integer, parameter :: n=3
double precision a(n,n), b(n), x(n)
integer i,j
! matrix A
  data (a(1,i), i=1,3) /  3.0,  2.0,  4.0 /
  data (a(2,i), i=1,3) /  2.0, -3.0,  1.0 /
  data (a(3,i), i=1,3) /  1.0,  1.0,  2.0 /
! matrix b
  data (b(i),   i=1,3) /  4.0,  2.0,  3.0 /

! print a header and the original equations
  write (*,200)
  do i=1,n
     write (*,201) (a(i,j),j=1,n), b(i)
  end do

  call gauss_1(a,b,x,n)

! print matrix A and vector b after the elimination 
  write (*,202)
  do i = 1,n
     write (*,201)  (a(i,j),j=1,n), b(i)
  end do
! print solutions
  write (*,203)
  write (*,201) (x(i),i=1,n)
200 format (' Basic elimination (Simple Gauss) ',/,/, &
            ' Matrix A and vector b')
201 format (6f12.6)
202 format (/,' Matrix A and vector b after elimination')
203 format (/,' Solutions x(n)')
end

  subroutine gauss_1(a,b,x,n)
!============================================================
! Solutions to a system of linear equations A*x=b
! Method: the basic elimination (simple Gauss elimination)
! Alex G. November 2009
!-----------------------------------------------------------
! input ...
! a(n,n) - array of coefficients for matrix A
! b(n)   - vector of the right hand coefficients b
! n      - number of equations
! output ...
! x(n)   - solutions
! comments ...
! the original arrays a(n,n) and b(n) will be destroyed 
! during the calculation
!===========================================================
implicit none 
integer n
double precision a(n,n), b(n), x(n)
double precision c
integer i, j, k

!step 1: forward elimination
do k=1, n-1
   do i=k+1,n
      c=a(i,k)/a(k,k)
      a(i,k) = 0.0
      b(i)=b(i)- c*b(k)
      do j=k+1,n
         a(i,j) = a(i,j)-c*a(k,j)
      end do
   end do
end do

!step 2: back substitution
x(n) = b(n)/a(n,n)
do i=n-1,1,-1
   c=0.0
   do j=i+1,n
     c= c + a(i,j)*x(j)
   end do 
   x(i) = (b(i)- c)/a(i,i)
end do
end subroutine gauss_1