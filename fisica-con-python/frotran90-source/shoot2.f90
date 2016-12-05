  Program shooting
!---------------------------------------------------------------------
! Solver for 1D boundary-value problem second-order ODE 
! Method: unilizes the shooting method based on the method of secants
! (calls 4th-order Runge-Kutta to solve the initial value problem)
! Demo version for d2y/dx2 = f(x,y,dy/dx) equation
! AG: Last revision October 2009
!----------------------------------------------------------------------

implicit none

integer, parameter :: n=21                     ! number of base points
double precision, external :: f
double precision, dimension(1:n) :: x, y, dy   ! x, y, y'
integer i

!open (unit=7,file="shoot2.dat")

! boundary values
x(1) =  0.0
y(1) =  0.0
x(n) =  1.0
y(n) =  1.0

! assumptions for y'(1) - use dy(1) and dy(2) here only as a storage
dy(1) =  2.0
dy(2) =  8.0

call shoot2(f,x,y,dy,n)

write(*,100)
do i=1,n
  write (*,101) x(i), y(i), dy(i)
end do

100 format(5x,'x',11x,'y',11x,'dy')
101	format(3(1pe12.4))
stop
end program shooting

  subroutine shoot2(f,x,y,dy,n)
!======================================================================
! Solution of the boundary-value second-order 1D ODE
! d2y/dx2 = f(x,y,dy/dx) with Dirichlet boundary conditions
! y(xmin) = ..., and y(xmax) = ...
! Method: unilizes the shooting method based on the method of secants
! (calls 4th-order Runge-Kutta to solve the initial value problem)
! written by:  Alex Godunov (last revision - 9 October 2009)
!----------------------------------------------------------------------
! input ...
!  f(x,y,dy)  - function d2y/dx2 (supplied by a user)
!  x(1), x(n) - boundary points
!  y(1), y(n) - boundary values (Dirichlet boundary conditions)
! dy(1),dy(2) - two guesses for y'(x(1))
!
! output ...
!  y(i) and dy(i) solutions at points x(i) (i=1,...,n)
! note: dy corresponds to y' (the first derivative)
!======================================================================
implicit none
integer, parameter :: it=21                    ! max numer of iterations
double precision, parameter :: eps = 0.000001  ! target tolerance
integer n
double precision, external:: f
double precision, dimension(1:n) :: x, y, dy
integer i,j
double precision dx, yn
double precision, dimension(1:it):: g, c

! g(it) - array of dy(it) values [iterative improvement]
! c(it) - array of y(n) values [iterative solutions for g(it)]
! first guesses for g(it)
g(1) = dy(1)
g(2) = dy(2)

! remember the second boundary condition 
! since y(n) recalculated for each new g(i)
yn = y(n)

! generate base points x(i) from x(1), x(n) and n
dx = (x(n)-x(1))/float(n-1)
do i=2,n
  x(i) = x(i-1)+dx
end do

! shooting iterations (for the first two - we use assumed values of dy(1))
do j=1,it
  dy(1) = g(j)
  call rk4_2d(f,x,y,dy,n)      ! solves initial value ODE on n-base points
  c(j) = y(n)
  if(abs(yn-c(j)) <= eps) exit
  if(j.ge.2) g(j+1)=g(j)-(c(j)-yn)*(g(j)-g(j-1))/(c(j)-c(j-1)) ! secant method
end do
end subroutine shoot2

  function f(x,y,dy)
!------------------------------------------
! the second derivative - use original ODE
! d2y/dx2 = f(x,y,dy)
!------------------------------------------
  implicit none
  double precision f, x, y, dy
    f = 2.0*y*y
  end function f

  subroutine rk4_2d(f,x,y,dy,n)
!================================================================
! Solution of the second-order 1D ODE (Initial-value problem)
! method:  Runge-Kutta 4th-order
! written by: Alex Godunov (last revision October 2009)
!----------------------------------------------------------------
! input ...
!  f(x,y,dy)- function from d2y/dx2=f(x,y,dy) (supplied by a user)
!  x(i)  - array of x base point (n points)
!  y(1)  - initial value for y(1)
! dy(1) - initial value for y'(1)
!
! output ...
!  y(i)  - solutions for y  in n points
! dy(i)  - solutions for y' in n points 
!=================================================
implicit none
double precision f
integer n
double precision, dimension(1:n) :: x, y, dy
integer i
double precision h,k11,k12,k21,k22,k31,k32,k41,k42

do i=2,n
   h   = x(i)-x(i-1)
   k11 = h*dy(i-1)
   k12 = h*f(x(i-1),y(i-1),dy(i-1))
   k21 = h*(dy(i-1)+k12/2.0)
   k22 = h*f(x(i-1)+h/2.0, y(i-1)+k11/2.0, dy(i-1)+k12/2.0)
   k31 = h*(dy(i-1)+k22/2.0)
   k32 = h*f(x(i-1)+h/2.0, y(i-1)+k21/2.0, dy(i-1)+k22/2.0)
   k41 = h*(dy(i-1)+k32)
   k42 = h*f(x(i-1)+h,y(i-1)+k31,dy(i-1)+k32)

   y(i) = y(i-1) + (k11 + 2.0*(k21+k31) + k41)/6.0
  dy(i) = dy(i-1)+ (k12 + 2.0*(k22+k32) + k42)/6.0
end do 
end subroutine rk4_2d
