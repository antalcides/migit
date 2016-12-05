!==============================================================
!    Solution for a quadratic equation ax^2 + bx + c = 0
!    Fortran 90 Demo program for students
!    method: analytic solutions
!    written by: Alex Godunov (February 2007)
!----------------------------------------------------------------
!input:
!    a, b, c - coefficiants of equation (supplied by the user)
!output:
!    x1, x2 - roots (can be complex)
!================================================================*/
program quad
implicit none

real a, b, c, x1, x2, xr, xi, D, D2
complex x1c, x2c

write (*,100)
read  (*,*) a, b, c


if(a == 0.0) then
   if(b == 0.0) then  ! case c = 0 (no solutions)
      write (*,101)
   else               ! case bx + c = 0
      x1 = -c/b
      write(*,102) x1
   end if

   else ! general case ax^2 + bx + c = 0
   D2 = b*b - 4.0*a*c
   if (D2 >= 0.0) then  ! real roots
      D = sqrt(D2)
      x1 = ((-1.0)*b + D)/(2.0*a)
      x2 = ((-1.0)*b - D)/(2.0*a)
      write(*,103) x1, x2
   else
      D = sqrt(-1.0*D2)
      xr = b/(2.0*a)
      xi = D/(2.0*a)
	  x1c = cmplx(xr, xi)
	  x2c = cmplx(xr,-xi)
	  write(*,104) x1c, x2c
   end if
end if

100 format (' solution of the quadratic equation ax^2 + bx + c = 0',/,&
            ' enter a  b  c (as floats separated by space)')
101 format (' no solution if a = 0 and b = 0')
102 format (' single root   x = ',f10.5)
103 format (' real roots',/,' x1 = ',f10.5,/,' x2 = ',f10.5)
104 format (' complex roots',/,'            real   imagin.',/,&
            ' x1 = ',2f10.5,/,' x2 = ',2f10.5)
stop
end




