	program sumatory

c....... This program calculates the sumatory S=Sum(1/i)

c	**** WITH subroutines ****

c....... variables declaration
	implicit real*4(a-h,o-z)

	parameter (mxpoints=100000)         !! npoints: points in x
	common/blocksum/sumasc(0:mxpoints+1),sumdesc(0:mxpoints+1),
     +                  npoints

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


c.......  initialization
	call loopsum

	  go to 50
	  
500	stop
	end
c
c---------------------------------------------------------------------
c
	subroutine loopsum
	implicit real*4(a-h,o-z)

c....... loop for sumatory and print

	parameter (mxpoints=100000)         
	common/blocksum/sumasc(0:mxpoints+1),sumdesc(0:mxpoints+1),
     +                  npoints

	open(unit=10,file='sumatory.dat',status='unknown')

	call initialization(0)

c....... main loop
	do 100 i=1,npoints
	
c.......  initialization
	call initialization(i)
	
c.......  sumatory in ascendent order
	call calcsumatory(i,1)

c.......  sumatory in descendent order
	call calcsumatory(i,2)
	
c.......  print results
	call printresults(i)

100	continue
	print*,'Sum(1/i) for ',npoints,':   ascendent=:',
     +          sumasc(npoints),'  descendent=:',sumdesc(1)	  
	close(unit=10)

	return
	end
	
c
c---------------------------------------------------------------------
c	
	subroutine initialization(i)
	implicit real*4(a-h,o-z)

c.......  initialization of variables

	parameter (mxpoints=100000)         
	common/blocksum/sumasc(0:mxpoints+1),sumdesc(0:mxpoints+1),
     +                  npoints
     
c.......  ascendent order
	       sumasc(i) = 0.0
	       
c.......  descendent order
	       j = npoints-i+1
	       sumdesc(j) = 0.0
		
	return
	end
c
c---------------------------------------------------------------------
c	
	subroutine calcsumatory(i,idirection)
	implicit real*4(a-h,o-z)

c.......  sumatory in ascendent order

	parameter (mxpoints=100000)         
	common/blocksum/sumasc(0:mxpoints+1),sumdesc(0:mxpoints+1),
     +                  npoints
     
c.......  sumatory in ascendent order
	if (idirection.eq.1) then
	       sumasc(i) = sumasc(i-1) + 1.0/i
	else
c.......  sumatory in descendent order
	       j = npoints-i+1
	       sumdesc(j) = sumdesc(j+1) + 1.0/j
	endif
		
	return
	end
c
c---------------------------------------------------------------------
c
	subroutine printresults(i)
	implicit real*4(a-h,o-z)

c.......  print results on 'sumatory.dat'

	parameter (mxpoints=100000)         
	common/blocksum/sumasc(0:mxpoints+1),sumdesc(0:mxpoints+1),
     +                  npoints	
	  
	j = npoints-i+1
	write(10,425) i,sumasc(i),sumdesc(j)
425	format(5x,i6,2(5x,f15.6))	
	
	return
	end
c
c---------------------------------------------------------------------
c
