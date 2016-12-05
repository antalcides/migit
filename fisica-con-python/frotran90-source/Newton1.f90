 program main
!====================================================================
! A single root of an equation f(x)=0 in around x1
! Method: Open Domain (Newton)
!====================================================================
implicit none
double precision f,x1,root,eps
integer flag
external f

x1 = -1.0
eps = 1.0e-7

write (*,*) ' A single root of f(x)'
write (*,*) ' Method - Newton'
write (*,100) x1

  call Newton1(f,x1,eps,Root,flag)

! print solutions
if(flag == 0) then 
  write(*,*)' no root found'
  stop
end if

write(*,101) eps, flag
write(*,102) Root

! test solution
write(*,104) f(Root,0)

100 format(' First point = ',f6.2)
101 format(' tolerance   = ',1pe12.5,//,&
           ' iterations  = ',i3)
102 format(' root        = ',1pe12.5)
104 format(' f(root)     = ',1pe12.5)

end program main


   Subroutine Newton1(f,x1,eps,Root,flag)
!============================================================
! Solutions of equation f(x)=0 around point x
! Methods: Newton 
! Alex G. January 2010
!------------------------------------------------------------
! input ...
! f   - function - evaluates f(x)
! fp  - finction - evaluates f'(x)
! x1  - a guess point
! eps - desired uncertainity of the root as f(Root)<eps
! output ...
! Root  - root of the equation f(Root)=0
! flag  - indicator of success
!         >0 - a single root found, flag=number of iterations
!          0 - no solutions for the method of secants
!
! Comments: a user should suply both f(x) and f'(x)
!====================================================================
implicit none
double precision f, x1, eps, Root
double precision x2
integer i, flag
integer, parameter:: iter=200

!* Iterative refining the solution 
do i=1,iter
  x2 = x1 - f(x1,0)/f(x1,1)
! check the step. if it is improbably large - use bisection 
  if(abs(x2) > 100.0*abs(x1)) x2 = 1.2*x1
! condition(s) to stop iterations)
  if(abs(f(x2,0))<= eps) exit 
  x1 = x2;
end do
Root=x2

!* check the convergence
if (i /= iter) then
  flag=i
  else
  flag = 0
end if

end subroutine Newton1


  Function f(x,k)
!-----------------------------------------------------
! evaluates f(x)  for k=0
! evaluates f'(x) for k=1
!-----------------------------------------------------
implicit none
double precision f, x
integer k
  if(k==0) f = x + cos(x)
  if(k==1) f = 1 - sin(x)
end function f


