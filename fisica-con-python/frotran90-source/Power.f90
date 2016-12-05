  Program Main
!====================================================================
! Power method to find the largest eigenvalue
! and corresponding eigenvector
!====================================================================
implicit none
integer, parameter :: n=3
double precision, parameter:: eps=1.0e-07
double precision :: a(n,n), y(n)
double precision lambda
integer i, j, iter

! matrix A
  data (a(1,i), i=1,3) /   1.0,  2.0,  3.0 /
  data (a(2,i), i=1,3) /   2.0,  2.0, -2.0 /
  data (a(3,i), i=1,3) /   3.0, -2.0,  4.0 /
! guess vector 
  data (y(i),i=1,3)    /  1.0,  1.0,  1.0 /

! print a header and the original matrix
  write (*,200)
  do i=1,n
     write (*,201) (a(i,j),j=1,n)
  end do
! print: guess vector x(i)
  write (*,204) 
  write (*,201) (y(i),i=1,3)

  call Power(a,y,lambda,eps,n,iter)

! print solutions
  write (*,202)
  write (*,201) lambda
  write (*,203)
  write (*,201)  (y(i),i=1,n)
  write (*,205) iter

200 format (' The largest eigenvalues (Power method) ',/, &
            ' Matrix A')
201 format (6f12.6)
202 format (/,' The largest eigenvalue')
203 format (/,' Eigenvector')
204 format (/,' Initial vector')
205 format (/,' iterations = ',i5)
end program main

subroutine Power(a,y,lambda,eps,n,iter)
!==============================================================
! Evaluate the largest eigenvalue and corresponding eigenvector
! of a real matrix a(n,n): a*x = lambda*x 
! method: the power method
! comment: the program works for real values only  
! Alex G. (December 2009)
!--------------------------------------------------------------
! input ...
! a(n,n) - array of coefficients for matrix A
! x(n)   - initial vector
! n      - number of equations
! eps    - convergence tolerance
! output ...
! lambda - eigenvalue (the largest modulus)
! x(n)   - eigenvector corresponding to lambda
! iter   - number of iterations to achieve the tolerance
! comments ...
! kmax   - max number of allowed iterations
!==============================================================
implicit none
integer n, iter
double precision a(n,n),y(n),lambda, eps 
double precision yp(n),lambda0, norm
integer k, i, j
integer, parameter::kmax=1000

lambda0=0.0

do k=1,kmax
! compute y'=A*y
  do i=1,n
    yp(i)=0.0
    do j=1,n
      yp(i) = yp(i)+a(i,j)*y(j)
    end do
  end do
! normalization coefficient
  norm = 0.0
  do i=1,n
    norm = norm + yp(i)*yp(i)
  end do
  norm = sqrt(norm)
! normalize vector y(n) to unity for the next iteration
  do i=1,n
    y(i)=yp(i)/norm
  end do
  lambda = norm
! check for convergence
  if (abs(lambda-lambda0) < eps) exit
! prepare for the next iteration
  lambda0 = lambda
end do

iter = k
if(k == kmax) write (*,*)'The eigenvlue failed to converge'

end subroutine Power
