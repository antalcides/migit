	program table_sin

c....... This program prints two columns in file "tablesin.dat"
c	X: "npoints" angles between 0 and 3*Pi
c	Y: sin(X)


c....... variables declaration
	implicit none		!! this is another way to comment
	integer i,npoints
	real*8 x,y,Pi,dang
	real*8  func_sin

	data npoints/50/

c....... output file
	open (unit=15,file='tablesin2.dat',status='unknown')

c....... calculation of Pi
	Pi = 2.0d0*dasin(1.0d0)

c....... calculation of angular step
	dang = 3.0d0*Pi/npoints	

c....... table generation
	x = -dang
	do 100 i=1,npoints
		x = x + dang
		y = func_sin(x)
		write(15,25) x,y
100	continue
25	format(5x,f10.3,3x,f14.4)	


c...... close file
	close (unit=15)

	stop
	end

c------------------------------------------------------------

	real*8 function func_sin(x)

	func_sin = sin(x)

	return
	end
