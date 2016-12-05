c     regla del trapecio
      dimension y(100)
      read(5,1)m d, W
      format(f5.0)
      do 3 i=,m
      read(5,2)Y(1)
      sumY=0
      n=m-1
      do 4 i=2,n
      
      sumY=sumY+Y(i)
      area=d/2.*(Y(1)+2.*sumY+Y(m))
      xdsq=2.*.07069*386./W*area
      xd=sqrt(xdsq)
      write(6,5)xd
      format(22h Velocidad de salida=,f7.0,21h, pulgadas por segundo)
      stop
      end
