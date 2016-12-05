 program main
!====================================================================
! Initial value problem for a single 2nd-order ODE
! Call Methods: Runge-Kutta 4th order
! comment: can be used for a system of two first order ODEs
!====================================================================
implicit none
double precision ti,xi,vi,tf,xf,vf
double precision d1x,d2x
double precision ei, dt
double precision tmax, k, m
integer i
external d1x, d2x

! open (unit=6,file="result12.dat")

!* initial conditions
ti = 0.0
xi = 0.0
vi = 1.0

!* time step and max time
dt   =  0.1
tmax = 2.00

ei = vi**2/2 + xi**2/2   ! energy for a harmonic oscillator

!* print the header and initial conditions
write (6,*) '      2-nd order single ODE '
write (6,*) '  Method: Runge-Kutta 4th order'
write (6,*) '    t         x(t)      v(t)     energy'
write (6,100) ti, xi, vi, ei 

do while(ti.le.tmax)
  tf = ti + dt
  call RK4D12(d1x,d2x,ti,xi,vi,tf,xf,vf)
  ei = vf**2/2 + xf**2/2
  write (6,100) tf, xf, vf, ei
  ti = tf
  xi = xf
  vi = vf
end do

100	format(4f10.5)
end program main

	Function d1x(t,x,v)
!--------------------------------------
! function dx/dt
!--------------------------------------
implicit none
double precision d1x, t, x, v
	d1x = v
end Function d1x

	Function d2x(t,x,v)
!--------------------------------------
! function d2x/dt2
!--------------------------------------
implicit none
double precision d2x, t, x, v
! simple harmonic oscillator
double precision, parameter:: k=1.0, m=1.0
  d2x = (-1.0*k/m)*x      
end Function d2x

  Subroutine RK4D12(d1x,d2x,ti,xi,vi,tf,xf,vf)
!===========================================================
! Solution of a single second-order ODE d2x/dt2=f(t,x,dx/dt)
! Method:  Runge-Kutta 4th-order
! Alex G. February 2010
!-----------------------------------------------------------
! input ...
! d1x(t,x,v)- function dx/dt   (supplied by a user)
! d2x(t,x,v)- function d2x/dt2 (supplied by a user)
! ti 	- initial time
! xi  - initial position
! vi  - initial velocity (first order derivative)
! tf  - final time (find solution at this time)
! output ...
! xf  - position at point tf
! vf  - velocity at point tf
!===========================================================
implicit none
double precision d1x,d2x,ti,xi,vi,tf,xf,vf
double precision h,t,k1x,k2x,k3x,k4x,k1v,k2v,k3v,k4v

h = tf-ti
t = ti

k1x = h*d1x(t,xi,vi)
k1v = h*d2x(t,xi,vi)

k2x = h*d1x(t+h/2.0,xi+k1x/2.0,vi+k1v/2.0)
k2v = h*d2x(t+h/2.0,xi+k1x/2.0,vi+k1v/2.0)

k3x = h*d1x(t+h/2.0,xi+k2x/2.0,vi+k2v/2.0)
k3v = h*d2x(t+h/2.0,xi+k2x/2.0,vi+k2v/2.0)

k4x = h*d1x(t+h,xi+k3x,vi+k3v)
k4v = h*d2x(t+h,xi+k3x,vi+k3v)

xf = xi + (k1x + 2.0*(k2x+k3x) + k4x)/6.0
vf = vi + (k1v + 2.0*(k2v+k3v) + k4v)/6.0

end subroutine RK4D12
