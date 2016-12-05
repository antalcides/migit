  program main
!====================================================================
! Largange interpolation (lagint.f90)
! Comments: values of function f(x) are calculated in n base points
! then: Lagrange interpolation is computed in 2n-1 points, as well as
! a difference sum|f(u)-lagint(u)| 
!====================================================================
implicit none
integer, parameter :: n=11      ! base points for interpolation
integer, parameter :: nint=21   ! compute interpolation in nint points
double precision xmin, xmax     ! given interval of x()
double precision, dimension (n) :: xi(n), yi(n)
double precision x, y, step, ys, error, errav
integer i, order
double precision f, lagint

! open files
!open (unit=1, file='tablex1.dat')
!open (unit=2, file='tablex2.dat')

xmin = 0.0
xmax = 2.0

! step 1: generate xi and yi from f(x), xmin, xmax, n
step = (xmax-xmin)/(n-1)
do i=1,n
  xi(i) = xmin + step*float(i-1) 
  yi(i) = f(xi(i)) 
!  write (*,200) xi(i), yi(i)
end do

!  step 2: interpolation at nint points
!  where order - is the order if interpolation
order = 3
write(*,*) '    Lagrange Interpolation'
write(*,203) order
errav = 0.0
step = (xmax-xmin)/(nint-1)
write(*,201) 
do i=1, nint
  x = xmin + step*float(i-1) 
  y = f(x) 

  ys = lagint(x, xi, yi, n, order+1)

  error = ys-y
  write (*,200) x, ys, error
! step 4: calculate quality of interpolation               
  errav = errav + abs(y-ys)/nint 
end do
write (*,202) errav
200 format (3f12.5)
201 format ('        x        Lagrange     error')    
202 format ('           Average error',f12.5)
203 format ('     order of interpolation = ',i2)

end program main

!
!  Function f(x)
!
  function f(x)
  double precision f, x
  f = sin(x) 
  end function f

  function lagint(xx, xi, yi, ni, n)
!====================================================================
! Lagrange interpolation (straightforward implementation)
! Alex G: January 2010
!--------------------------------------------------------------------
! input ...
! xx    - the abscissa at which the interpolation is to be evaluated
! xi()  - the arrays of data abscissas
! yi()  - the arrays of data ordinates
! ni    - size of the arrays xi() and yi()
! n     - number of points for interpolation (order of interp. = n-1)
! output ...
! lagint- interpolated value
! comments ...
! if (n > ni) n = ni
! program works for both equally and unequally spaced xi()
!=====================================================================
implicit none
double precision lagint, xx
integer ni, n
double precision xi(ni), yi(ni)
double precision lambda(ni)
integer i, j, k, js, jl
double precision y

! check order of interpolation
if (n > ni) n = ni

! if x is ouside the xi(1)-xi(ni) interval take a boundary value
if (xx <= xi(1)) then
  lagint = yi(1)
  return
end if
if (xx >= xi(ni)) then
  lagint = yi(ni)
  return
end if

! a binary (bisectional) search to find i so that xi(i) < x < xi(i+1)
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

! Lagrange interpolation
y = 0.0
do js=i,i+n-1
  lambda(js)=1.0
  do jl=i,i+n-1
    if(jl /= js) lambda(js)=lambda(js)*(xx-xi(jl))/(xi(js)-xi(jl))
  end do
  y = y + yi(js)*lambda(js)
end do
lagint = y
end function lagint


