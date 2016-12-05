 program main
!====================================================================
! A single root of an equation f(x)=0 in [x1,x2] interval
! Method: Open Domain (Method of secants)
!====================================================================
implicit none
double precision f,x1,root,eps
integer flag
external f

x1 = -1.0
eps = 1.0e-7

write (*,*) ' A single root of f(x)'
write (*,*) ' Method - Secant'
write (*,100) x1

  call Secant(f,x1,eps,Root,flag)

! print solutions
if(flag == 0) then 
  write(*,*)' no root found'
  stop
end if

write(*,101) eps, flag
write(*,102) Root

! test solution
write(*,104) f(Root)

100 format(' First point = ',f6.2)
101 format(' tolerance   = ',1pe12.5,//,&
           ' iterations  = ',i3)
102 format(' root        = ',1pe12.5)
104 format(' f(root)     = ',1pe12.5)

end program main


   Subroutine Secant(f,x1,eps,Root,flag)
!============================================================
! Solutions of equation f(x)=0 around point x
! Methods: secant 
! Alex G. January 2010
!------------------------------------------------------------
! input ...
! f   - function - evaluates f(x)
! x1  - a guess point
! eps - desired uncertainity of the root as f(Root)<eps
! output ...
! Root  - root of the equation f(Root)=0
! flag  - indicator of success
!         >0 - a single root found, flag=number of iterations
!          0 - no solutions for the method of secants
!
! Comments: the method needs two points to start. We use x2=x1+h
!====================================================================
implicit none
double precision f, x1, eps, Root
double precision x2, x3, h, df
integer i, flag
integer, parameter:: iter=200

!* initialize calculations
h  = 0.1
x2 = x1 + h

!* Iterative refining the solution 
do i=1,iter
  df = (f(x2)-f(x1))/(x2-x1)
  x3 = x2 - f(x2)/df
! check the step. if it is improbably large - use bisection 
  if(abs(x3) > 100.0*abs(x2)) x3 = (x2+x1)/2.0
! condition(s) to stop iterations)
  if(abs(f(x3))<= eps) exit 
  x1 = x2;
  x2 = x3; 
end do
Root=x3

!* check the convergence
if (i /= iter) then
  flag=i
  else
  flag = 0
end if

end subroutine Secant

!-----------------------------------------------------
  Function f(x)
implicit none
double precision f, x
  f = x + cos(x)
end function f








