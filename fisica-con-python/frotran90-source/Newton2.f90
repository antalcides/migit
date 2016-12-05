 program main
!====================================================================
! Roots of a system of two nonlinear equations
! f(x,y) = 0
! g(x,y) = 0
! Method: Open Domain (Newton)
!====================================================================
implicit none
double precision x, y, eps
double precision f, fx, fy, g, gx, gy
integer flag

x = 1.0
y = 1.0
eps = 1.0e-6

write (*,*) ' Two roots of a system f(x,y)=0, g(x,y)=0 '
write (*,*) ' Method - Newton'
write (*,100) x,y

  call Newton2(x,y,eps,flag)

! print solutions
if(flag == 0) then 
  write(*,*)' no roots found'
  stop
end if

write(*,101) eps, flag
! test and print solutions
call fg(x,y,f,fx,fy,g,gx,gy)
write(*,*)'    x         y         f(x,y)      g(x,y)'
write(*,102) x, y, f, g

100 format(' Guess points = ',2f6.2)
101 format(' tolerance    = ',1pe12.4,/,&
           ' iterations   = ',i3)
102 format(2f10.5,2(1pe12.3))

end program main


   Subroutine Newton2(x,y,eps,flag)
!============================================================
! Solutions of two nonlinear equations
!   f(x,y) = 0
!   g(x,y) = 0
! Methods: Newton 
! Alex G. January 2010
!------------------------------------------------------------
! input ...
! x,y - guess points
! eps - desired uncertainity of the root as f(Root)<eps
! output ...
! x,y   - roots of the equations
! flag  - indicator of success
!         >0 - roots are found, flag=number of iterations
!          0 - no solutions found
! Comments: f(x,y), g(x,y) and their derivatives are evaluated in
! subroutine fg(x,y,f,fx,fy,g,gx,gy)
!====================================================================
implicit none
double precision x, y, eps
double precision f, fx, fy, g, gx, gy
double precision del, dx, dy
integer i, flag
integer, parameter:: iter=200

!* Iterative refining the solution 
do i=1,iter
  call fg(x,y,f,fx,fy,g,gx,gy)
  del = fx*gy - fy*gx
  dx=(fy*g-f*gy)/del
  dy=(f*gx-fx*g)/del
  x = x + dx
  y = y + dy
! condition(s) to stop iterations)
  if(abs(dx)<= eps.and.abs(dy)<=eps) exit 
end do

!* check the convergence
if (i /= iter) then
  flag=i
  else
  flag = 0
end if

end subroutine Newton2


  Subroutine fg(x,y,f,fx,fy,g,gx,gy)
!-----------------------------------------------------
! evaluates f(x,y), g(x,y)
! and their partial derivatives
!-----------------------------------------------------
implicit none
double precision x, y, f, fx, fy, g, gx, gy
  f = y*y*(1.0-x)-x**3
  g = x*x + y*y -1.0
  fx = (-1.0)*(y*y + 3.0*x*x)
  fy = 2.0*y*(1.0-x)
  gx = 2.0*x
  gy = 2.0*y
end subroutine fg


