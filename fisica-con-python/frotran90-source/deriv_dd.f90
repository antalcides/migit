!====================================================================
!  Driver program: Calculates first- or second-order derivatives
!  for a function defined in ni base points
!  Method: divided differences for equally spaced points
!  AG: October 2009
!====================================================================
implicit none
integer, parameter :: ni=101 ! initial arrays size for base points
integer, parameter :: nc=21  ! number of points where derivatives to be calc.
double precision xmin, xmax  ! interval
double precision xi(ni), yi(ni)
double precision x, yx, yxx, step, f, deriv4
double precision fx, fxx
integer i, j


! open files (if needed)
!open (unit=1, file='table01.dat')
!open (unit=2, file='table02.dat')

xmin =  0.0
xmax =  3.1415926

!    
!   step 1: generate xi and yi from f(x) xmin, xmax, nint
!
step = (xmax-xmin)/float(ni-1)
do i=1,ni
  xi(i) = xmin + step*float(i-1) 
  yi(i) = f(xi(i)) 
!  write (*,200) xi(i), yi(i)
end do

!
!  step 2: calculate derivatives
!
step = (xmax-xmin)/float(nc-1) 
write (*,202)
do i=1, nc
  x = xmin + step*float(i-1) 
  yx = cos(x)                         !  f'
  fx = deriv4(x, xi, yi, ni, 4, 1)
  yxx = -sin(x)                       !  f"
  fxx= deriv4(x, xi, yi, ni, 4, 2)
  write (*,201) x, yx, fx, yxx, fxx
end do

200 format (2f12.5)
201 format (7f12.5)
202 format ('       x           fx         fx_num', &
            '      fxx        fxx_num')
stop
end

!
!  Function f(x)
!
  function f(x)
  implicit none
  double precision f, x
  f = sin(x)
  return 
  end

  function deriv4(xx, xi, yi, ni, n, m)
!====================================================================
! Evaluate first- or second-order derivatives 
! on three or four data points 
! using interpolation based on divided differences 
! written by: Alex Godunov (October 2009)
!--------------------------------------------------------------------
! input ...
! xx    - the abscissa at which the derivative is to be evaluated
! xi()  - the arrays of data abscissas
! yi()  - the arrays of data ordinates
! ni - size of the arrays xi() and yi()
! n  - number of points to evaluate derivatives
! m  - order of a derivative (1 or 2)
! output ...
! deriv4  - the first- or second-order derivative
!============================================================================*/
implicit none
double precision deriv4, xx 
integer ni, n, m
double precision xi(ni), yi(ni)
double precision x(n), f(n)
double precision d1, d2, d3, h, s
integer i, j, k, ix


! exit if too high-order derivative was needed, 
! or too many base points were needed for derivatives 
if (m > 2 .or. m>= n .or. n>5) then
  deriv4 = 0.0
  return
end if

! if x is ouside the xi(1)-xi(ni) interval set deriv4=0.0
if (xx < xi(1) .or. xx > xi(ni)) then  
  deriv4 = 0.0 
  return 
end if

! a binary (bisectional) search to find i so that xi(i-1) < x < xi(i)
i = 1 
j = ni 
do while (j > i+1)
  k = (i+j)/2 
  if (xx < xi(k)) then
      j = k 
    else 
      i = k 
  end if
end do

! shift i that will correspond to n-th order of interpolation
! the search point will be in the middle in x_i, x_i+1, x_i+2 ...
i = i + 1 - n/2 

! check boundaries: if i is ouside of the range [1, ... n] -> shift i
if (i < 1) i=1
if (i + n > ni) i=ni-n+1  
  
!  old output to test i
!  write(*,100) xx, i
!  100 format (f10.5, I5) 

! just want to use index i 
ix = i

! initialization of f(n) and x(n)
do i=1,n
  f(i) = yi(ix+i-1)
  x(i) = xi(ix+i-1)
end do

! calculate divided difference coefficients
d1 = f(2) - f(1)
if (n > 2) d2 = f(3) - 2.0*f(2) + f(1)
if (n > 3) d3 = f(4) - 3.0*f(3) + 3.0*f(2) - f(1)
h = x(2) - x(1)
s = (xx - x(1))/h

! calculate the first order derivative 
if (m == 1) then
  deriv4 = (1.0/h)*d1
    if (n > 2) deriv4 = deriv4 + (1.0/h)*((2.0*s-1.0)/2.0)*d2
    if (n > 3) deriv4 = deriv4 + (1.0/h)*((3.0*s*s-6.0*s+2.0)/6.0)*d3
end if 
! calculate the second order derivative
if (m == 2 .and. n > 2) then
  deriv4 = (1.0/h**2)*d2
  if (n > 3) deriv4 = deriv4 + (1.0/h**2)*(s-1.0)*d3
end if
end function deriv4



