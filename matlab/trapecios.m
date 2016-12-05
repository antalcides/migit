function int = trapecios(f,x0,xf,n)

% int = trapecios(f,x0,xf,n)
%
% Se obtiene la integral numérica de la función f, desde el valor 
% inicial x0 al valor final xf mediante el método de trapecios, utilizando
% n+1 datos.

% 25 octubre 2007
% M. Valenzuela

h = (xf-x0)/n;
x = x0;
sum = 0;
for i=2:n
   x = x + h;
   sum = sum + feval(f,x);
end
int = (h/2)*(feval(f,x0) + feval(f,xf) + 2*sum);
