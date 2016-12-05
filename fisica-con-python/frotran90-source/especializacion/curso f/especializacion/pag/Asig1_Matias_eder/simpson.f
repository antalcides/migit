c programa para aplicar la regla de simpson al calculo de integrales
c       f=x**2+2*x+1
c       evaluar la integral de la funcion fun(x)
c       definimos la funcion f=x**2+2*x+1
       real x,fun
       fun=(x**2)+(2*x)+(1)
       end
c      iniciamos el programa
       program sinpson
       real a,b,h,i
c      definimos las condiciones
       a=0.0
       b=2.0
       h=(b-a)/2
       i=(h/3)*(f(a)+4*F((a+b)/2)+f(b))
       print*,'el valor de la integral es',i
       end
