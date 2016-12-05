! set the output device 
module service
implicit none
integer, parameter:: nout=6
end module service

program rwalk
!-----------------------------------------------------------------
! Random walk in 2 dimensions (2D random walk)
! The programs computes three cases
! 1. Simple random walk: calculates average distance as a function 
!    of number of steps (diffusion)
! 2. Random walk in 2D city (n*n blocks): computes average number
!    of steps to get out the city (the initial position is random)
!    (Random walk on a 2D crystal)
! 3. Random walk in 2D city with a trap: a sailor follows a random
!    walk, but a police patrol have 3 options (see rwalk03)
!    Objective: find probability for the police to make an arrest
!    (Random walk on a 2D lattice with a trap)
!-----------------------------------------------------------------
! Comment
! the code call function date_and_time to get current time for
! 1. seeding srand(). 
! 2. printint the current day and time, as well as elapsed time
!-----------------------------------------------------------------
! written by:    Alex Godunov
! last revision: November 2009
!-----------------------------------------------------------------
use service
implicit none
integer ti(8), snumber
integer ihour, imin, isec, imsec
integer tests, steps, city

! get current date and time to seed the RNG
   call date_and_time(values=ti)
   snumber = ti(8)*ti(7)*ti(6)+ti(5)
   call srand(snumber)

open (unit=nout,file='walk04.dat')

call marktime(0)

tests = 5000
steps = 250
call rwalk01(tests,steps)

tests = 5000
city  = 100         !max city size
call rwalk02(tests,city)

tests = 5000
city  = 100
call rwalk03(tests,city,1,1)
call rwalk03(tests,city,2,1)
call rwalk03(tests,city,1,2)
call rwalk03(tests,city,2,2)
call rwalk03(tests,city,3,3)

call marktime(1)

stop 
end program rwalk

  subroutine marktime(key)
!===============================================================
! print date of calculations and elapsed time
! IN:
! key = 0   first call: print current day and time
! key = 1   print elapsed time
! Comment:
! function date_and_time returns summer time (+1 hour) in winter
!===============================================================
use service
implicit none
integer key
integer ti(8), tf(8)
integer sdelta, hour, min, sec
character(9), dimension(12), parameter :: months=&
(/" January "," February","  March  ","  April  ","   May   ","   June  ",&
  "   July  ","  August ","September"," October "," November"," December"/)

if(key==0) then
  call date_and_time(values=ti)
  write(nout,100) ti(3),months(ti(2)),ti(1)
  !#for winter time have ti(5)-1
  write(nout,101) ti(5)-1,ti(6),ti(7)
  else
    call date_and_time(values=tf)
    sdelta = (tf(5)-ti(5))*3600 + (tf(6)-ti(6))*60 + tf(7)-ti(7)
    hour = sdelta/3600
    min = (sdelta-3600*hour)/60
    sec = (sdelta-3600*hour-60*min)
    write(nout,102) hour,min,sec
end if

100 format('***** ',I2,' ',A,' ',I4,' *****')
101 format('*****    time: ',i2,'.',i2,':',i2,' *****',/)
102 format(/,' elapsed time',/,'  ',i2,'.',i2,':',i2)

end subroutine marktime

subroutine rwalk01(tests,steps)
!========================================================
! simple random walk in two dimensions
! objective - calculate average distance as a function of 
! number of steps
! IN:
! tests - number of tests
! steps - max number of steps (from 10 + increment 10)
! OUT:
! rav   - average displacement from the origin (print)
!========================================================
use service
implicit none
integer steps, tests, x, y
integer is, it, k, way
real rand, rav

write (nout,*)' Simple Random Walk in 2D'
write (nout,100) tests
write (nout,*)'    N       R'

! loop over max number of steps
do is = 10, steps,10
  rav = 0.0
  ! loop over tests 
  do it = 1, tests
    x=0
    y=0
    ! loop over steps
    do k = 1,is
	  call sailor(x,y,0)
    end do
	rav = rav + sqrt((float(x))**2+(float(y))**2)
  end do
  rav = rav/float(tests)
  write(nout,103) is, rav
end do

100 format('  Number of tests =',i6)
103 format(i6,f10.2)

end subroutine rwalk01

subroutine rwalk02(tests,city)
!============================================================
! Random walk in 2 dimensions in a city with n*n blocks
! Objective: find average number of steps to get out the city
!            if the initial position is random
! IN:
! tests - number of tests
! city  - 1/2 of the city max size - conting from (0,0)
! OUT:
! fsteps- average number of steps to be out of city limits
!============================================================
use service
implicit none
integer tests, city, blocks
integer ic, steps, it, x, y, way, out
real rand, fsteps
integer nsteps

city = city/2

write (nout,*)' Random walk on a lattice N*N'
write (nout,*)' Evaluate number of steps to get out'
write (nout,100) tests
100 format('  Number of tests =',i6)
write (nout,*)'    N     Steps'

! loop over max number of city size
do ic=1,city,1
  ! loop over tests 
  steps=0
  do it=1,tests
    x=(2*ic+1)*rand()
    y=(2*ic+1)*rand()
    x = x-ic
    y = y-ic
    out = 0
    nsteps = 0
    ! loop over steps in the city
    do while(out == 0)
      nsteps = nsteps + 1
      ! get new position
      call sailor(x,y,0)
      ! check the condition - out of city
      if(abs(x)>ic.or.abs(y)>ic) out=1
    end do
  steps = steps + nsteps
  end do
  fsteps = float(steps)/float(tests)
  blocks = ic*2
  write(nout,103) blocks, fsteps
end do

103 format(i6,f10.2)

end subroutine rwalk02

subroutine rwalk03(tests,city,ki,kf)
!============================================================
! Random walk in 2D city with a trap:
! Objective: find probability for the police patrol to make 
!            arrest, and for the sailor to get out of city
! IN:
! tests - number of tests
! city  - max size of a crystall (city)
! ki - initial position (police)
!      1 - (n/2,n/2) the center
!      2 - random
!      3 - closed path
! kf - type of motion (police)
!      1 - stationary
!      2 - random walk
!      3 - following a close path
! OUT:
! steps and probabilities are printed at the end
! Comments: so far the side of the closed path is s=n/2
! Note: integer numbers in (ni,nf) from rand()
! n = (nf-ni+1)*rand()
! n = n+ni
!============================================================
use service
implicit none
integer ki, kf
integer tests, city
integer ic, it, x, y, way, out
real rand, patrol, freedom, go_free, go_capt
integer xp, yp, arrest, free, steps, steps_c, steps_f

!=== print headers
write (nout,*)' Random walk on a 2D lattice N*N'
write (nout,*)' The lattice contains a trap'
select case(ki)
  case(1) 
    write(nout,*)' police: initial position n/2,n/2'
  case(2) 
    write(nout,*)' police: initial position random'
  case(3) 
    write(nout,*)' police: initial position closed path'
end select
select case(kf)
  case(1) 
    write(nout,*)' police: stationary point'
  case(2) 
    write(nout,*)' police: random walk'
  case(3) 
    write(nout,*)' police: follow closed path'
end select

write (nout,100) tests
write (nout,*)'  city   capture     steps   freedom     steps'

100 format('  Number of tests =',i6)
!=== end print headers

! loop over max number of city size
do ic = 4,city,2
  ! loop over tests 
  arrest = 0
  free = 0
  steps_c = 0
  steps_f = 0
  do it = 1, tests
    ! initial positions - sailor
    x=(ic+1)*rand()
    y=(ic+1)*rand()
    ! initial position -  police 
    select case(ki)
      case(1)            ! center n/2
        xp = ic/2          
        yp = ic/2 
      case(2)            ! random         
        xp=(ic+1)*rand() 
        yp=(ic+1)*rand()
      case(3)            ! closed path  
        call police2(xp,yp,0,ic/2,ic)           
    end select
    out = 0
    steps = 0
    ! loop over steps in the city
    do while(out == 0)
      steps = steps+1
      ! sailor: new position
	  call sailor(x,y,ic)
      ! police: new position
      select case(kf)
        case(1)
          call police(xp,yp,0)             
        case(2)
          call police(xp,yp,ic)
        case(3)
          call police2(xp,yp,steps,ic/2,ic)
      end select
      ! check for the arrest
      if(x == xp .and. y == yp) then
	    arrest = arrest+1
        steps_c = steps_c+steps
        exit
	  end if
      ! check for being out of city
      if(x<0.or.x>ic.or.y<0.or.y>ic) then
        out=1
        free = free + out
        steps_f = steps_f+steps
      end if
    end do
  end do
  freedom= float(free)/float(tests)
  go_free= float(steps_f)/float(free)
  patrol = float(arrest)/float(tests)
  go_capt= float(steps_c)/float(arrest)
  write(nout,103) ic, patrol, go_capt, freedom, go_free
end do

103 format(i6,2(f10.3,f10.1))

end subroutine rwalk03

subroutine sailor(x,y,n)
!=========================================================
! random walk of a sailor in 2D
! generate a set of new coordinates from the old position
!=========================================================
implicit none
integer x, y, n, way 
real rand

! unrestricted random walk
way= int(0.0+4.0*rand())
select case(way)
  case(0)
    x = x+1
  case(1)
    y = y+1
  case(2)
    x = x-1
  case(3)
    y = y-1    
end select

!=== a possible upgrade for the function
!if(n==0) return

! if a step leads out - stay on the city limits
!  if(x > n) x = n
!  if(x < 0) x = 0
!  if(y > n) y = n
!  if(y < 0) y = 0

! if a step leads out - periodic boundary conditions
!  if(x > n) x = x-n
!  if(x < 0) x = x+n
!  if(y > n) y = y-n
!  if(y < 0) y = y+n

end subroutine sailor


subroutine police(xp,yp,n)
!==========================================================
! random walk of a police patrol in 2D
! generate a set of new coordinates from a current position
! IN:
! xp, yp - current position
! n      - lattice size
! OUT:
! xp, yp - new position
!==========================================================
implicit none
integer xp, yp, n, way 
real rand

! keep the old position
if (n==0) then
  xp = xp
  yp = yp
  return
end if

! calculate a new random step
  way= int(0.0+4.0*rand())
  if(way.eq.0) xp = xp+1
  if(way.eq.1) xp = xp-1
  if(way.eq.2) yp = yp+1
  if(way.eq.3) yp = yp-1

! if a step leads out - apply periodic boundary conditions
  if(xp > n) xp = xp-n
  if(xp < 0) xp = xp+n
  if(yp > n) yp = yp-n
  if(yp < 0) yp = yp+n

! the patrol can not leave the city
! if a step leads out - stay on the city limits
!  if(xp > n) xp = n
!  if(xp < 0) xp = 0
!  if(yp > n) yp = n
!  if(yp < 0) yp = 0

end subroutine police

subroutine police2(xi,yi,i,s,n)
!==========================================================
! random walk of a police patrol in 2D
! generate a set of new coordinates for a patrol walking
! along a closed pass with a side size s<n
! IN:
! i      - call number (when = 0 generate arrays)
! s      - side size of the patrol perimeter 
! n      - city size 
! OUT:
! xi, yi - positions for call i
! Comments:
! both the city and the patrol perimeter are squares
!==========================================================
implicit none
integer xi, yi, i, s, n, j, period
integer x(4*s+1), y(4*s+1)
real rand

! generate a trajectory on the first call
if(i==0) then
  x(1) = (n-s)/2
  y(1) = x(1)
  do j=2,s+1
    x(j) = x(j-1)+1
    y(j) = y(j-1)
  end do
  do j=s+2,2*s+1
    x(j) = x(j-1)
    y(j) = y(j-1)+1
  end do
  do j=2*s+2,3*s+1
    x(j) = x(j-1)-1
    y(j) = y(j-1) 
  end do
  do j=3*s+2,4*s
    x(j) = x(j-1)   
    y(j) = y(j-1)-1
  end do
!write(*,100) (x(j),y(j),j=1,4*s)
!100 format(2i4)
  return
end if

! normalize the call number i to period 4*s steps
period = i/(4*s)
if(i==4*s*period) period = period-1
j = i-(4*s)*period
xi=x(j)
yi=y(j)

end subroutine police2

