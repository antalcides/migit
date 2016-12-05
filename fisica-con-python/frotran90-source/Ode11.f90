 program main
!====================================================================
! Initial value problem for a single 1st-order ODE
! Call Methods: Euler, Predictor-Corrector, Runge-Kutta 4th order
!====================================================================
implicit none
double precision dx, dt, xi, ti, xf, tf, tmax
integer i, key
external dx

! open files (if needed)
!open (unit=6, file='result1.dat')

! initial conditions
xi = 1.00
ti = 0.00
! "time" step and max time
dt =   0.1
tmax = 2.0
! select a method: 
! key=1 Euler, key=2 predictor-corrector, key=3 RK 4th order
key = 3

!* print the header and initial conditions
write (*,*) ' 1st order single ODE '
if (key==1) write (*,*) ' Simple Euler method  ' 
if (key==2) write (*,*) ' Predictor-Corrector  '
if (key==3) write (*,*) ' Runge-Kutta 4th order'
write (*,*) '     t         x(t)   '
write (6,100) ti, xi


do while(ti <= tmax)
  tf = ti + dt

if (key==1)  call euler1(dx,ti,xi,tf,xf)
if (key==2)  call euler1m(dx,ti,xi,tf,xf)
if (key==3)  call RK4d11(dx,ti,xi,tf,xf)

  write (6,100) tf, xf
  ti = tf
  xi = xf
end do

100 format(2f10.5)
end program main

  function dx(t,x)
!----------------------------------------------
! dx(t,x)- function dx/dt in the 1st order ODE
!----------------------------------------------
implicit none
double precision dx, x, t
  dx = (-1.0)*x     ! solution x=exp(-t)
! the carrying capacity problem
!  dx = 0.1*x-0.0002*x**2 
end function dx

  subroutine RK4d11(dx,ti,xi,tf,xf)
!==================================================
! Solution of a single 1st order ODE dx/dt=f(x,t)
! Method: 4th-order Runge-Kutta method
! Alex G. February 2010
!--------------------------------------------------
! input ...
! dx(t,x)- function dx/dt (supplied by a user)
! ti - initial time
! xi  - initial position
! tf  - time for a solution
! output ...
! xf  - solution at point tf
!==================================================
implicit none
double precision dx,ti,xi,tf,xf
double precision h,k1,k2,k3,k4

h  = tf-ti

k1 = h*dx(ti,xi)
k2 = h*dx(ti+h/2.0,xi+k1/2.0)
k3 = h*dx(ti+h/2.0,xi+k2/2.0)
k4 = h*dx(ti+h,xi+k3)

xf = xi + (k1 + 2.0*(k2+k3) + k4)/6.0

end subroutine RK4d11

  subroutine euler1m(dx,ti,xi,tf,xf)
!==================================================
! Solution of a single 1st order ODE dx/dt=f(x,t)
! Method:  Modified Euler (predictor-corrector)
! Alex G. February 2010
!--------------------------------------------------
! input ...
! dx(t,x)- function dx/dt (supplied by a user)
! ti - initial time
! xi  - initial position
! tf  - time for a solution
! output ...
! xf  - solution at point tf
!==================================================
implicit none
double precision dx,xi,ti,xf,tf

xf = xi + dx(ti,xi)*(tf-ti)
xf = xi + (dx(ti,xi)+dx(tf,xf))*0.5*(tf-ti)

end subroutine euler1m

  subroutine euler1(dx,ti,xi,tf,xf)
!==================================================
! Solution of a single 1st order ODE dx/dt=f(x,t)
! Method:  Simple Euler (predictor-corrector)
! Alex G. February 2010
!--------------------------------------------------
! input ...
! dx(t,x)- function dx/dt (supplied by a user)
! ti - initial time
! xi  - initial position
! tf  - time for a solution
! output ...
! xf  - solution at point tf
!==================================================
implicit none
double precision dx,xi,ti,xf,tf

xf = xi + dx(ti,xi)*(tf-ti)

end subroutine euler1


