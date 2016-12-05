function int = Simpson13(f,x0,xf,n)

% int = Simpson13(f,x0,xf,n)
%
% Se obtiene la integral numérica de la función f, desde el valor 
% inicial x0 al valor final xf mediante el método Simpson 1/3, utilizando
% n+1 datos, donde n debe ser par.

% 25 octubre 2007
% M. Valenzuela

n = n - mod(n,2);
if n == 0
   n = 1;
end
h = (xf-x0)/n;
sum = 0;
for j=1:ceil(n/2)
   xa = x0 + (2*j-2)*h;
   xb = x0 + (2*j-1)*h;
   xc = x0 + 2*j*h;
   sum = sum + feval(f,xa) + 4*feval(f,xb) + feval(f,xc)
end
int = (h/3)*sum;

