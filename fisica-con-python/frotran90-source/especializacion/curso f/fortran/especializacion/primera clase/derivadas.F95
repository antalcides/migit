!     Last change:  JCO  19 Sep 2000    6:57 am

!programa para calcular la primera cuatro derivadas de una función usando
!diferencias finitas.

!Modulo para la función a evaluar.

FUNCTION fun(X)

REAL x,fun,PI

PI=dacos(-1.d0)
fun=SIN((PI/2)*x)
END

!programa...

REAL f1,f2,f3,f4,fun,dx,x,x1,x2,x3,x4,E1,E2,E3,E4
!x1,x2,x3,x4 son las soluciones analíticas
x1=-1.11
x2=-1.74
x3=2.74
x4=4.30

PRINT*, 'ENTRE EL DX'          ! dx es la longitud del paso.
READ*, dx
PRINT*, 'ENTRE EL PUNTO X A EVALUAR EN LA DERIVADA'
READ*, x

!Cálculo de las derivadas:

f1=(fun(x+dx)-fun(x-dx))/(2*dx)
f2=(fun(x+dx)-2*fun(x)+fun(x-dx))/dx**2
f3=(-2*fun(x+dx)+2*fun(x-dx)-fun(x-2*dx)+fun(x+2*dx))/(2*dx**3)
f4=(fun(x+2*dx)-4*fun(x+dx)+6*fun(x)-4*fun(x-dx)+fun(x-2*dx))/(dx**4)

!Cálculo de errores:

E1=ABS((f1-x1)/x1)*100
E2=ABS((f2-x2)/x2)*100
E3=ABS((f3-x3)/x3)*100
E4=ABS((f4-x4)/x4)*100


PRINT *, 'LA PRIMERA DERIVADA ES', f1, 'Y EL ERROR ES', E1
PRINT *, 'LA SEGUNDA DERIVADA ES', f2, 'Y EL ERROR ES', E2
PRINT *, 'LA TERCERA DERIVADA ES', f3, 'Y EL ERROR ES', E3
PRINT *, 'LA CUARTA DERIVADA ES',  f4, 'Y EL ERROR ES', E4
END

