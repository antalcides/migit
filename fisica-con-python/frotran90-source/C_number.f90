 program main
!====================================================================
!  Evaluate the condition number of matrix A
!  Method: straightforward evaluation
!====================================================================
implicit none
integer, parameter :: n=3
double precision a(n,n), CondA, Mcond
integer i,j
! matrix A
!  data (a(1,i), i=1,3) /  3.0,  2.0,  4.0 /
!  data (a(2,i), i=1,3) /  2.0, -3.0,  1.0 /
!  data (a(3,i), i=1,3) /  1.0,  1.0,  2.0 /

  data (a(1,i), i=1,3) /  3.0,  2.0,  4.0 /
  data (a(2,i), i=1,3) /  3.000001, 2.0,  4.000002 /
  data (a(3,i), i=1,3) /  1.0,  1.0,  2.0 /


! print a header and the original matrix
  write (*,200)
  do i=1,n
     write (*,201) (a(i,j),j=1,n)
  end do

CondA = MCond(A,n)

! print the result
write(*,202) CondA

200 format (' Evaluate the condition number of matrix A ',/,/, &
            ' Matrix A')
201 format (6f12.6)
202 format (' The condition number C(A) = ',1pe12.4)
end program main


double precision function MCond(A,n)
!============================================================
! Evaluate the condition number of matrix A
! Method: C(A) = norm(A*A^{-1})
! Alex G. December 2009
!-----------------------------------------------------------
! input ...
! a(n,n) - array of coefficients for matrix A
! n      - dimension
! output ...
! Matnorm- the condition number
! comments ... calls 
!===========================================================
implicit none
integer n
double precision a(n,n), c(n,n)
double precision Mnorm
integer i,j

MCond = Mnorm(A,n)
call inverse(a,c,n)
MCond = MCond*Mnorm(C,n)

end function MCond

double precision function Mnorm(a,n)
!===========================================================
! evaluate the Euclidean norm of matrix A
! Alex G. December 2009
!-----------------------------------------------------------
! input ...
! a(n,n) - array of coefficients for matrix A
! n      - dimension
! output ...
! Mnorm  - the Euclidean norm
!===========================================================
implicit none 
integer n
double precision a(n,n)
double precision Mnorn
integer i, j

Mnorm = 0.0
do i=1,n
  do j=1,n
    Mnorm = Mnorm + a(i,j)**2
  end do
end do
Mnorm = sqrt(Mnorm)

end function Mnorm



  subroutine inverse(a,c,n)
!============================================================
! Inverse matrix
! Method: Based on Doolittle LU factorization for Ax=b
! Alex G. December 2009
!-----------------------------------------------------------
! input ...
! a(n,n) - array of coefficients for matrix A
! n      - dimension
! output ...
! c(n,n) - inverse matrix of A
! comments ...
! the original matrix a(n,n) will be destroyed 
! during the calculation
!===========================================================
implicit none 
integer n
double precision a(n,n), c(n,n)
double precision L(n,n), U(n,n), b(n), d(n), x(n)
double precision coeff
integer i, j, k

! step 0: initialization for matrices L and U and b
! Fortran 90/95 aloows such operations on matrices
L=0.0
U=0.0
b=0.0

! step 1: forward elimination
do k=1, n-1
   do i=k+1,n
      coeff=a(i,k)/a(k,k)
      L(i,k) = coeff
      do j=k+1,n
         a(i,j) = a(i,j)-coeff*a(k,j)
      end do
   end do
end do

! Step 2: prepare L and U matrices 
! L matrix is a matrix of the elimination coefficient
! + the diagonal elements are 1.0
do i=1,n
  L(i,i) = 1.0
end do
! U matrix is the upper triangular part of A
do j=1,n
  do i=1,j
    U(i,j) = a(i,j)
  end do
end do

! Step 3: compute columns of the inverse matrix C
do k=1,n
  b(k)=1.0
  d(1) = b(1)
! Step 3a: Solve Ld=b using the forward substitution
  do i=2,n
    d(i)=b(i)
    do j=1,i-1
      d(i) = d(i) - L(i,j)*d(j)
    end do
  end do
! Step 3b: Solve Ux=d using the back substitution
  x(n)=d(n)/U(n,n)
  do i = n-1,1,-1
    x(i) = d(i)
    do j=n,i+1,-1
      x(i)=x(i)-U(i,j)*x(j)
    end do
    x(i) = x(i)/u(i,i)
  end do
! Step 3c: fill the solutions x(n) into column k of C
  do i=1,n
    c(i,k) = x(i)
  end do
  b(k)=0.0
end do
end subroutine inverse