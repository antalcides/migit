function int = Simpson38(f,x0,xf,n)

% int = Simpson38(f,x0,xf,n)
%
% Integracion mediante Simpson 3/8

% 14 mayo 2007
% M. Valenzuela

n = n - mod(n,3);
h = (xf-x0)/n;
sum = 0;
for j=1:n/3
   xa = x0 + (3*j-3)*h;
   xb = x0 + (3*j-2)*h;
   xc = x0 + (3*j-1)*h;
   xd = x0 + 3*j*h;
   sum = sum + feval(f,xa) + 3*feval(f,xb) + 3*feval(f,xc) + feval(f,xd);
end
int = (3*h/8)*sum;

