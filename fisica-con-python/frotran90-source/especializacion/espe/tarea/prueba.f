       PROGRAM PRUEBA
       IMPLICIT DOUBLE PRECISION (A-H,O-Z)
       open (1,file='fichero1.dat',status='unknown')
       open (2,file='fichero2.dat',status='unknown')
       xmin=-1.2D0
       xmax=1.2D0
       n=241
       delta=(xmax-xmin)/(n-1)
       do i=1,n
       x=xmin+(i-1)*delta
       write(1,*)x,exp(X)
       write(2,*)x,x*x+1
       enddo
       close(1)
       close(2)
       end
