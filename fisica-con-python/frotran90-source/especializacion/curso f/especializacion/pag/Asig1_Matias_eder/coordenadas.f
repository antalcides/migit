c este programa transforma coordenadas polares a cartesianas
       program coordenadas
       real r,a
c este programa lee los numeros reales r,a y convierte las coordenadas
       write(*,*)'entra los valores r,a'
       read(*,*)r,a
       x=r*cos(a)
       y=r*sin(a)
       write(*,*)'la coordenada x es',x
       write(*,*)'la coordenada y es',y
       end
