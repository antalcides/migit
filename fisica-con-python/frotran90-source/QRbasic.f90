  Program Main
!====================================================================
! QR basic method to find the eigenvalues
! of matrix A
!====================================================================
implicit none
integer, parameter :: n=3
double precision, parameter:: eps=1.0e-07
double precision :: a(n,n), e(n)
integer i, j, iter

! matrix A
!  data (a(1,i), i=1,3) /   8.0, -2.0, -2.0 /
!  data (a(2,i), i=1,3) /  -2.0,  4.0, -2.0 /
!  data (a(3,i), i=1,3) /  -2.0, -2.0, 13.0 /

  data (a(1,i), i=1,3) /   1.0,  2.0,  3.0 /
  data (a(2,i), i=1,3) /   2.0,  2.0, -2.0 /
  data (a(3,i), i=1,3) /   3.0, -2.0,  4.0 /


! print a header and the original matrix
  write (*,200)
  do i=1,n
     write (*,201) (a(i,j),j=1,n)
  end do
! print: guess vector x(i)
!  write (*,204) 
!  write (*,201) (y(i),i=1,3)

  call QRbasic(a,e,eps,n,iter)

! print solutions
  write (*,202)
  write (*,201)  (e(i),i=1,n)
  write (*,205) iter

200 format (' QR basic method - eigenvalues for A(n,n)',/, &
            ' Matrix A')
201 format (6f12.6)
202 format (/,' The eigenvalues')
205 format (/,' iterations = ',i5)
end program main

subroutine QRbasic(a,e,eps,n,iter)
!==============================================================
! Compute all eigenvalues: real symmetric matrix a(n,n,)
! a*x = lambda*x 
! method: the basic QR method
! Alex G. (January 2010)
!--------------------------------------------------------------
! input ...
! a(n,n) - array of coefficients for matrix A
! n      - dimension
! eps    - convergence tolerance
! output ...
! e(n)   - eigenvalues
! iter   - number of iterations to achieve the tolerance
! comments ...
! kmax   - max number of allowed iterations
!==============================================================
implicit none
integer n, iter
double precision a(n,n), e(n), eps
double precision q(n,n), r(n,n), w(n), an, Ajnorm, sum, e0,e1 
integer k, i, j, m
integer, parameter::kmax=1000

! initialization
q = 0.0
r = 0.0
e0 = 0.0

do k=1,kmax              ! iterations

! step 1: compute Q(n,n) and R(n,n)
! column 1
  an = Ajnorm(a,n,1)
  r(1,1) = an
  do i=1,n
    q(i,1) = a(i,1)/an
  end do
! columns 2,...,n
  do j=2,n
    w = 0.0
    do m=1,j-1
! product q^T*a result = scalar
      sum = 0.0
      do i=1,n
        sum = sum + q(i,m)*a(i,j)
      end do
      r(m,j) = sum
! product (q^T*a)*q  result = vector w(n)
      do i=1,n
        w(i) = w(i) + sum*q(i,m)
      end do
    end do
! new a'(j)
    do i =1,n
      a(i,j) = a(i,j) - w(i)
    end do
! evaluate the norm for a'(j)
    an = Ajnorm(a,n,j)
    r(j,j) = an
! vector q(j)
    do i=1,n
      q(i,j) = a(i,j)/an
    end do
  end do

! step 2: compute A=R(n,n)*Q(n,n)
  a = matmul(r,q)
! egenvalues and the average eigenvale
  sum = 0.0
  do i=1,n
    e(i) = a(i,i)
    sum = sum+e(i)*e(i)
  end do  
  e1 = sqrt(sum)

! print here eigenvalues
!  write (*,201)  (e(i),i=1,n)
!201 format (6f12.6)

! check for convergence
  if (abs(e1-e0) < eps) exit
! prepare for the next iteration
  e0 = e1  
end do

iter = k
if(k == kmax) write (*,*)'The eigenvlue failed to converge'

end subroutine QRbasic

  function Ajnorm(a,n,j)
implicit none
integer n, j, i
double precision a(n,n), Ajnorm
double precision sum

sum = 0.0
do i=1,n
  sum = sum + a(i,j)*a(i,j)
end do
Ajnorm = sqrt(sum)
end function Ajnorm
