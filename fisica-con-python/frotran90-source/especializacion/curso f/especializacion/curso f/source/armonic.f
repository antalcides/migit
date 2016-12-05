	program armonic

c....... by Dario Mitnik

c....... This program prints two columns in files "wavet###.dat"
c	 where ### means different times.
c	X: "npoints" angles between 0 and 6*Pi
c	Y: sin(kX-wT)


c....... variables declaration
	implicit real*8(a-h,o-z)

        common/blockwave/rk,w
	data npoints,ntpoints/2000,10/	!! npoints: points in x
c					!! ntpoints: number of graphs in t

c....... calculation of Pi
	Pi = 2.0d0*dasin(1.0d0)

c....... calculation of angular step
	dang = 6.0d0*Pi/npoints	

c...... initialization
	rk = 1
	w = 1

	print*,' for the function y=sin(kX-wT) '
	print*,' give the value of k :'
	read*,rk
	print*,' give the value of w :'
	read*,w
	print*,' '

c...... calculation of T=Period
	period = 2.0d0*Pi/w
	deltat = Period/ntpoints
	t = -deltat

c...... loop in time ( 1 cycle)
	do 500 it=1,ntpoints

	  t = t + deltat

c.......  table generation for this particular time
	  x = -dang
	  do 100 i=1,npoints		!! loop in x
		x = x + dang
		y = wave(x,t)
		write(10+it,25) x,y
100	  continue			!! end loop in x
25	  format(5x,f10.3,3x,f14.4)	


500	continue		!! end loop in time

	stop
	end

c------------------------------------------------------------

	function wave(x,t)
	
	implicit real*8(a-h,o-z)
	common/blockwave/rk,w

	wave = sin(rk*x - w*t)

	return
	end
