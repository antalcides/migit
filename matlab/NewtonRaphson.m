function x = NewtonRaphson(f,fp,x0,varargin)

% Encuentra una raiz de la funcion f con derivada f' mediante 
% Newton-Raphson tomando como punto inicial x0.
%
%    x = NewtonRaphson(f,fp,x0,tol=0.001)

% 23 enero 2007
% Manuel Valenzuela

RASTREO = 1;

tol = 0.001;
if length(varargin)>=1
   tol = varargin{1};
end

xAnt = x0;
while 1
   x = xAnt - feval(f,xAnt)/feval(fp,xAnt);
   if RASTREO
      fprintf('%f - (%f)/(%f) = %x\n',xAnt,feval(f,xAnt),feval(fp,xAnt),x)
      %pause
   end
   if abs(x-xAnt)/abs(x)<tol || feval(f,x)==0
      break
   end
   xAnt = x;
end
