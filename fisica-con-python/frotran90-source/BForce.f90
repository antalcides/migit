 program main
!====================================================================
! Multiple roots of an equation f(x)=0 in [x1,x2] interval
! Method: Brute force + Closed Domain (Bisectional or False position)
!====================================================================
implicit none
integer, parameter:: n=1000
double precision f,x1,x2,eps
double precision Roots(n)
integer key, nroots, i
external f

key = 2
x1 = -10.0
x2 =  10.0
eps = 1.0e-7

write (*,*) ' Roots of f(x) by brute force method'
if(key == 1) write (*,*) ' Subintervals - Bisectional method'
if(key == 2) write (*,*) ' Subintervals - False position method'
write (*,100) x1, x2
write (*,101) n
write (*,102) eps

  call BForce(f,x1,x2,eps,Roots,key,n,nroots)

! print solutions
if(nroots == 0) then 
  write(*,*)' no roots found'
  stop
end if
write(*,*) ' number     root       f(root)'
do i=1,nroots
  write(*,103) i, Roots(i), f(Roots(i))
end do

100 format(' interval [',f7.3,',',f7.3,']')
101 format(' subintervals= 'i12)
102 format(' tolerance   = ',1pe12.3,/)
103 format(i5,3x,f11.6,2(1pe12.3))
end program main

   Subroutine BForce(f,x1,x2,eps,Roots,key,n,nroots)
!============================================================
! Multiple roots of equation f(x)=0 on [x1,x2] interval
! Method: Brute force with one of closed domain methods
! Close domain methods: bisectional or false position 
! Alex G. January 2010
!------------------------------------------------------------
! input ...
! f   - function - evaluates f(x) for any x in [x1,x2]
! x1  - left endpoint of initial interval
! x2  - right endpoint of initial interval
! eps - desired uncertainity of the root as |b-a|<eps
! key - select a method
!       1 - bisectional method
!       2 - false position method
! n   - number of subintervals for [x1,x2]
! output ...
! Root(n) - roots of the equation f(x)=0 on [x1,x2]
! nroots  - number of roots (nroots<=n)
!
! Comments: 
! The program divide [x1,x2] into n subintervals
! Max number of iterations for every subinterval - 200
!====================================================================
implicit none
integer n, nroots
double precision f, x1, x2, eps, Roots(n)
double precision a, b, c, dx, root
integer i, j, key
integer, parameter:: iter=200

! initializayion
dx = (x2-x1)/real(n)
nroots = 0

! loop over subintervals
do j=1,n
  a = x1  + real(j-1)*dx
  b = a + dx
! check the closed domain condition f(a)*f(b)<0
  if(f(a)*f(b)>0) cycle

! Iterative refining the solution 
  do i=1,iter
    if(key == 1) then 
      c=(b+a)/2.0
      else
      c = b - f(b)*(b-a)/(f(b)-f(a))
    end if
    if(f(a)*f(c).le.0.0) then
      b = c
    else
      a=c
    end if
!   condition(s) to stop iterations)
    if(abs(b-a)<= eps) exit  
  end do
! check if it is a root or singularity
  root = (b+a)/2.0
  if (abs(f(root)) < 1.0) then
    nroots = nroots+1
    Roots(nroots)=root
  end if
end do
end subroutine BForce

!-----------------------------------------------------
  Function f(x)
implicit none
double precision f, x
double precision, parameter::pi=3.141592654
  f = exp(x)-x*sin(pi*x/2.0)
end function f








