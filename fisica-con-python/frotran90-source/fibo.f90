   program fibonacci
! the program generate fibonacci numbers
! f(0) = 0
! f(1) = 1
! f(n) = f(n-1) + f(n-2) for n>1
! September 2008 (AG)
implicit none
integer :: f(0:100)
integer :: i, j
character :: prime*5

 f(0) = 0
 f(1) = 1

 do i=2,40
   f(i) = f(i-1) + f(i-2)
!  check for prime numbers
   prime = 'prime'
   do j=2,f(i)-1
     if (f(i) == (f(i)/j)*j) then
       prime = '     '
       exit
     end if
   end do
   write (*,102) i, f(i), prime
 end do

102 format(i3, i12, a6)

 stop
 end