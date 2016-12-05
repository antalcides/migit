  Program numerov
!-----------------------------------------------------------------
! April 2009
! 1D Schrodinger ODE y"(x)+2[E-V(x)]y(x)=0
! Numerical method: the Numerov's method for 2-nr oder ODE
! Root finding (e): the bisectional method
!-----------------------------------------------------------------
implicit none
integer, parameter :: n=101
double precision, dimension(-n:n) :: x, wl, wr
double precision e, a, b, emin, emax, energy, eps, fe, dx
double precision xmin, xmax
integer iflag, i
common/wf/ x, wl, wr
common/eqn/e, a, b, dx
external fe

open (unit=7,file="wfunc.dat")

eps = 1.0e-6
! Potential: well with a - width, b - depth
a =    1.0
b =   20.0
! domain for the wavefunction
xmax = 4.0
xmin = (-1.0)*xmax
x(n)  =  xmax
x(-n) =  xmin

! assumptions for two intial eigenvalues
emin = 2.0
emax = 4.0

! generate x(i) from x(-n), x(n) and n
dx = (x(n)-x(-n))/(2*n)
do i=-n,n,1
  x(i) = x(-n) + (i+n)*dx
!  write(*,100) i, x(i)
end do
100 format(i5,3f12.5)

!do while (emin <= 20.0)
! the bisectional search for a root for energy
  call Root_bs(fe,emin,emax,eps,energy,iflag)
  if(iflag.eq.1) then
    write(*,101) energy
  end if
!  emin = emin+2.0
!  emax = emax+2.0
!end do

101   Format(' Root is =',f12.5)
102   Format(' no root for Bisectional method')

write(7,200)
do i=-n,n,1
  write (7,201) x(i), wl(i), wr(i)
end do
200 format(5x,'x',11x,'y',11x,'z')
201	format(3(1pe12.4))
!102 format(' eigenvalue = ',1pe12.4)
stop
end

  function fe(energy)
!=================================================
integer, parameter :: n=101
double precision, dimension(-n:n) :: x, wl, wr
double precision fe
double precision e, energy, c1, c2, c3
double precision a, b, h
common/wf/ x, wl, wr
common/eqn/e, a, b, h
integer i, j, match

e=energy

! find a matching point (V(x)=energy)
do i=-n,n
  if (i >0 .and. g(x(i)) > 0.0) then
    match=i
	exit
  end if
end do
! for a step potential this point is x(match) = a
!do i=-n,n
!  if(x(i) > a) then
!    match = i
!	exit
!  end if
!end do
match = match
!write(*,200) match, x(match)
200 format (' match point = ',i5,2f12.4)

!define asympototic conditions (boudary values)
wl(-n)  = exp(-1.0*sqrt(2*abs(e))*abs(x(-n)))
wl(-n+1)= exp(-1.0*sqrt(2*abs(e))*abs(x(-n+1)))
wr(n)   = exp(-1.0*sqrt(2*abs(e))*abs(x(n)))
wr(n-1) = exp(-1.0*sqrt(2*abs(e))*abs(x(n-1)))

! integrate from the left (to the match point)
do i=-n+1,n-1,1
  c3 = 1.0+g(x(i+1))*h*h/12.0
  c2 = 2.0-(5.0/6.0)*h*h*g(x(i))
  c1 = 1.0+g(x(i-1))*h*h/12.0
  wl(i+1) = (c2*wl(i) - c1*wl(i-1))/c3
!  write(*,300) i+1, x(i+1), wl(i+1)
end do

! integrate from the right to the point im
do i=n-1,1-n,-1
  c3 = 1.0+g(x(i+1))*h*h/12.0
  c2 = 2.0-(5.0/6.0)*h*h*g(x(i))
  c1 = 1.0+g(x(i-1))*h*h/12.0
  wr(i-1) = (c2*wr(i) - c3*wr(i+1))/c1
!  write(*,300) i-1, x(i-1), wr(i-1)
end do

! rescale the right solution
do i=n-1,-n+1,-1
  wr(i) = wr(i)*(wl(match)/wr(match))
end do

fe = (wl(match+1)-wl(match-1))/(2.0*h*wl(match))
fe = fe - (wr(match+1)-wr(match-1))/(2.0*h*wr(match))
!write(*,103) energy, fe

100 format(i5,3f12.5)
300 format(i5,3e12.3)
103 format(f14.4,e14.4)

return
end

  Function g(x)
!--------------------------------------
! g(x) = 2*(E-V(x))
!--------------------------------------
  implicit none
  double precision g, x, a, b, e
  common/eqn/e, a, b
!  if(abs(x).le.a) then
!    g = 2.0*(e-b)
!	else
!	g = 2.0*e
!  end if
! potential from TP
  a = 1.0
  b = 4.0
  g = 0.5*a*a*b*(b-1.0)*(0.5-1.0/(cosh(a*x))**2)
  g = 2.0*(e-g)
  return
  end


        Subroutine root_bs(f,a,b,eps,Root,iflag)
!====================================================================
! Program to find a single root of an equation f(x)=0
! using the Bisectional method
! written by: Alex Godunov (October 2006)
!--------------------------------------------------------------------
! input ...
! f	- function which evaluates f(x) for any x in the interval a,b
! a	- left endpoint of initial interval
! b	- right endpoint of initial interval
! eps	- desired uncertainity of the root
!
! output ...
! Root  - root of equation f(x)=0
! iflag - indicator of success
!         1 - a single root found
!         0 - no solutions for the Bisectional method
!
! Limitations: a function f(x) must change sign between a and b
!
! Max number of allowed iterations is 100 (accuracy (b-a)/2**100)
!====================================================================
	Real*8 f,a,b,eps,Root
	Real*8 xl,x0,xr
	Integer*4 i, iter, iflag
	Parameter (iter=100)
!* check the bisection condition
	if(f(a)*f(b).gt.0.0) then
           iflag = 0
           return
	end if
	i=0
	xl = a
	xr = b
	do while (abs(xr-xl).gt.eps)
           i=i+1
           x0=(xr+xl)/2
           if(f(xl)*f(x0).le.0.0) then
              xr = x0
              else
              xl=x0
           end if
           if(i.ge.iter) exit
	end do
	Root=x0
	iflag=1
	return
    end