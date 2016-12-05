        Program Planet01
c-----------------------------------------------------------------
c Motion of a planet around a star
c method: Solving a second order ODE with initial conditions
c written by: Alex Godunov
c last revision: November 2006
c-----------------------------------------------------------------
c input from a file (self explanatory)
c    see file planet1.dat
c output ...
c    to a file named by a user
c-----------------------------------------------------------------
      implicit none
      real*8 x0, y0, vx0, vy0, dt
      real*8 t0, tf, r0, v0, E0, Lz0, E, Lz, Torb0
      real*8 GM, pi, diff, r, rmax
      real*8 y(4), relerr, abserr, work(27)
      real*8 xmin, xmax, ymin, ymax, a, b, ecc
      integer iflag, iwork(5), ne
      integer*4 j, jmax
      character output*12
      parameter (pi=3.1415926)
      parameter (relerr=1.0e-9, abserr=0.0)
      parameter (jmax=10000)
      common/const/ GM
      external planet1
c*** read initial data from a file
      read 201,  output
      open (unit=7,file=output)
      read 203, x0
      read 203, y0
      read 203, vx0
      read 203, vy0
      read 203, dt
      read 203, rmax
c*** end reading and set initial time to 0.0
      t0 = 0.0
c*** calculations in AU units (GM=4*pi**2)
      GM = 4.0*pi**2
      r0 = sqrt(x0**2 + y0**2)
      v0 = sqrt(GM/r0)
      Torb0 = 2.0*pi*r0/v0
      vx0= vx0*v0
      vy0= vy0*v0
c initial energy and angular momentum in E/m units
c they must be conserved
      E0 = 0.5*(vx0**2+vy0**2) - GM/r0
      Lz0= x0*vy0 - y0*vx0
      write(7,210)
      write(7,211) t0, x0, y0, vx0, vy0, E0, Lz0
c initial steps to calculate eccentricity
c assuptions for calculations are based on initial conditions
c initial position (x0,0 )
c initial velocity (0 ,v0)
c sun is at        (0 ,0 )
	xmin = x0
	ymax = y0
c rkf45 initial data and conditions for rkf45 and first call
c it is very important to call rkf45 for the first time with
c iflag = 1 (otherwise the code does not run)
      ne = 4
      iflag = 1
      y(1) = x0
      y(2) = y0
      y(3) = vx0
      y(4) = vy0
c*** loop over time till the planet is back in initial point
c*** or time is more than 10*T0 (T0 is a period for a circular orbit)
      j=0
      do j=1,jmax
        tf = t0 + dt
        call rkf45(planet1,ne,y,t0,tf,relerr,abserr,iflag,work,iwork)
        if(iflag.eq.7) iflag = 2
        E = 0.5*(y(3)**2+y(4)**2) - GM/sqrt(y(1)**2+y(2)**2)
        Lz= y(1)*y(4) - y(2)*y(3)
        write(7,211) tf, y(1),y(2),y(3),y(4), E, Lz
        t0 = tf
          xmin = min(xmin,y(1))
          ymax = max(ymax,y(2))
          r = sqrt(y(1)**2+y(2)**2)
          diff = abs(x0-y(1))
          if(diff.le.0.001.or.r.ge.rmax) exit
      end do

      a = (x0-xmin)/2.0
      b = ymax - y0
      ecc = 0.0
      if(b.lt.a) ecc = sqrt(1.0-b**2/a**2)
      write(7,212) ecc

201   format (a12)
202   format (i5)
203   format (f10.4)
210   format(4x,'time',6x,'x',10x,'y',10x,'Vx',9x,'Vy',7x,'E',11x,'Lz')
211   format (f8.2,4f11.3,1pe12.2,1e12.2)
212   format (/,' eccentricity = ',f10.4)
      pause
      end
      subroutine planet1(t, y, yp)
c---------------------------------------------
c first and second derivatives for rkf45
c definition of the differential equations
c y(1) = x    yp(1)=vx=y(3)
c y(2) = y    yp(2)=vy=y(4)
c y(3) = vx   yp(3)=d2x/dt2 = - GM*x/r**3
c y(4) = vy   yp(4)=d2y/dt2 = - GM*y/r**3
c---------------------------------------------
      implicit none
      Real*8 t, y(4), yp(4), GM, r
      common/const/ GM
      yp(1)  =  y(3)
      yp(2)  =  y(4)
c equations of motion
      r = sqrt(y(1)**2+y(2)**2)
      yp(3) = (-1.0)*GM*y(1)/r**3
      yp(4) = (-1.0)*GM*y(2)/r**3
      return
      end