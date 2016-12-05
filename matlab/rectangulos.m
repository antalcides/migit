function int = rectangulos(f,x0,xf,n)

% int = rectangulos(f,x0,xf,n)
%
% Se obtiene la integral numérica de la función f, desde el valor 
% inicial x0 al valor final xf mediante el método de rectángulos, 
% utilizando n+1 datos.

% 25 octubre 2007
% M. Valenzuela

h = (xf-x0)/n;
x = x0;
sum = 0;
for i=1:n
   sum = sum + feval(f,x);
   x = x + h;
end
int = h*sum;
