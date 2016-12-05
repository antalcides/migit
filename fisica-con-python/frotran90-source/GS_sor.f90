 program main
!====================================================================
!  A system of linear equations A*x=b
!  Method: iterative SOR
!  AG: November 2009
!====================================================================
implicit none
integer, parameter :: n=3
double precision a(n,n), b(n), x(n), eps, omega
integer i,j, iter
! matrix A
  data (a(1,i), i=1,3) /  8.0,  2.0,  4.0 /
  data (a(2,i), i=1,3) /  2.0,  6.0,  1.0 /
  data (a(3,i), i=1,3) /  1.0,  1.0,  8.0 /
! vector b
  data (b(i),   i=1,3) /  2.0,  6.0,  4.0 /
! vector x (initial guess)
  data (x(i),   i=1,3) /  0.0,  0.0,  0.0 /

  eps = 0.00001
  omega =1.2
! print a header and the original equations
  write (*,200)
  do i=1,n
     write (*,201) (a(i,j),j=1,n), b(i)
  end do
! print the trial solution
  write (*,205)
  write (*,201) (x(i),i=1,n)

  call gs_sor(a,b,x,omega,eps,n,iter)

! print solutions
  write (*,203)
  write (*,201) (x(i),i=1,n)
  write (*,204) iter

200 format (' The successive-over-relaxation (SOR) ' &
            ,/,/,' Matrix A and vector b')
201 format (6f12.5)
203 format (/,' Solutions x(n)')
204 format (/,' iterations = ',I5)
205 format (/,' Trial solutions x(n)')
end

  subroutine gs_sor(a,b,x,omega,eps,n,iter)
!==========================================================
! Solutions to a system of linear equations A*x=b
! Method: The successive-over-relaxation (SOR)
! Alex G. (November 2009)
!----------------------------------------------------------
! input ...
! a(n,n) - array of coefficients for matrix A
! b(n)   - array of the right hand coefficients b
! x(n)   - solutions (initial guess)
! n      - number of equations (size of matrix A)
! omega  - the over-ralaxation factor
! eps    - convergence tolerance 
! output ...
! x(n)   - solutions
! iter   - number of iterations to achieve the tolerance
! coments ...
! kmax   - max number of allowed iterations
!==========================================================
implicit none 
integer, parameter::kmax=100
integer n
double precision a(n,n), b(n), x(n)
double precision c, omega, eps, delta, conv, sum
integer i, j, k, iter, flag

! check if the system is diagonally dominant
flag = 0
do i=1,n
  sum = 0.0
  do j=1,n
    if(i == j) cycle
    sum = sum+abs(a(i,j))
  end do
  if(abs(a(i,i)) < sum) flag = flag+1
end do
if(flag >0) write(*,*) 'The system is NOT diagonally dominant'    

do k=1,kmax
  conv = 0.0
  do i=1,n
    delta = b(i)
    do j=1,n
      delta = delta - a(i,j)*x(j)
    end do
    x(i) = x(i)+omega*delta/a(i,i)
    if(abs(delta) > conv) conv=abs(delta)
  end do
  if(conv < eps) exit
end do
iter = k
if(k == kmax) write (*,*)'The system failed to converge'

end subroutine gs_sor