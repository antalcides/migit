 program main
!====================================================================
! A single root of an equation f(x)=0 in [x1,x2] interval
! Method: Closed Domain (Bisectional or False position)
!====================================================================
implicit none
double precision f,x1,x2,root,eps
integer key, flag
external f

key = 2
x1 = -10.0
x2 =  10.0
eps = 1.0e-6

write (*,*) ' A single root of f(x)'
if(key == 1) write (*,*) ' Method - Bisectional'
if(key == 2) write (*,*) ' Method - False position'
write (*,100) x1, x2

  call CDomain(f,x1,x2,eps,root,key,flag)

! print solutions
if(flag == 0) then 
  write(*,*)' no roots for closed domain methods'
  stop
end if

write(*,101) eps, flag
if(flag > 0) then
    write(*,102) Root
    else
    write(*,103) Root
end if

! test solution
write(*,104) f(Root)

100 format(' interval [',f7.3,',',f7.3,']')
101 format(' tolerance   = ',1pe12.5,//,&
           ' iterations  = ',i3)
102 format(' root        = ',1pe12.5)
103 format(' Singularity = ',1pe12.5)
104 format(' f(root)     = ',1pe12.5)

end program main


   Subroutine CDomain(f,x1,x2,eps,Root,key,flag)
!============================================================
! Solutions of equation f(x)=0 on [x1,x2] interval
! Close Domain Methods: bisectional or false position 
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
! output ...
! Root  - root of the equation f(x)=0
! flag  - indicator of success
!         >0 - a single root found, flag=number of iterations
!          0 - no solutions for the bisectional method
!         <0 - not a root but singularity, flag=number of iterations
!
! Comments: Function f(x) has to change sign between x1 and x2
!           Max number of iterations - 200 (accuracy (b-a)/2**200)
!====================================================================
implicit none
double precision f, x1, x2, eps, Root
double precision a, b, c
integer i, key, flag
integer, parameter:: iter=200

!* check the bisection condition
if(f(x1)*f(x2)>0.0) then
  flag = 0
  return
end if

!* initialize calculations
a=x1
b=x2

!* Iterative refining the solution 
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
! condition(s) to stop iterations)
  if(abs(b-a)<= eps) exit  
end do
Root=(b+a)/2.0

!* check if it is a root or singularity
if (abs(f(Root)) < 1.0) then
  flag=i
  else
  flag = -i
end if
end subroutine CDomain

!-----------------------------------------------------
  Function f(x)
implicit none
double precision f, x
  f = x + cos(x)
end function f








