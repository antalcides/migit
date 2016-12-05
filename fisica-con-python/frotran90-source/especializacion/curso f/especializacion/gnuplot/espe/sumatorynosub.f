	program sumatory

c....... This program calculates the sumatory S=Sum(1/i)

c	**** NO use of subroutines ****

c....... variables declaration
	implicit real*4(a-h,o-z)

	parameter (mxpoints=10000)         !! npoints: points in x

	dimension sumasc(0:mxpoints+1),sumdesc(0:mxpoints+1)

	print*,'Sumatory of 1/i  from 1 to Npoints'
50	print*,' '
	print*,' give the number of points Npoints: (le.0 to exit)'
	read*,npoints
c......  test for quit
	if (npoints.le.0) go to 500
c......  test for dimensions
	if (npoints.gt.mxpoints) then
		print*,' the maximum number of points should be '//
     +                 ' smaller than ',mxpoints
     		go to 50
	endif

c....... initialization
	do 100 i=0,npoints+1
		sumasc(i)  = 0.0
		sumdesc(i) = 0.0
100	continue

c.......  sumatory in ascendent order
	  do 200 i=1,npoints
	       sumasc(i) = sumasc(i-1) + 1.0/i
200       continue

c.......  sumatory in descendent order
	  do 300 i=npoints,1,-1
	       sumdesc(i) = sumdesc(i+1) + 1.0/i
300       continue

c.......  print partial results
 	  open(unit=10,file='sumatoryns.dat',status='unknown')
	  do 400 i=1,npoints
	    write(10,425) i,sumasc(i),sumdesc(npoints-i+1)
400	  continue
	  close(unit=10)
425	  format(5x,i6,2(5x,f15.6))
c.......  print totals
	  totasc = sumasc(npoints)
	  totdesc = sumdesc(1)	
	  print*,'Sum(1/i) for ',npoints,':   ascendent=:',
     +            totasc,'  descendent=:',totdesc	  

	  go to 50
	  
500	stop
	end

