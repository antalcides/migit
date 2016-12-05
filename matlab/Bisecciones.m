function x = Bisecciones(f,x1,x2,varargin)

% Encuentra una raiz de la funcion f en el intervalo (x1,x2)
% mediante bisecciones sucesivas
%
%    x = Bisecciones(f,x1,x2,tol=0.001)

% 23 enero 2007
% Manuel Valenzuela

RASTREO = 1;
tol = 0.001;
if length(varargin)>=1
   tol = varargin{1};
end

if RASTREO
   fprintf('    x1       x2      xnueva   f(x1)    f(x2)  f(xnueva)\n')
end
while 1
   x = (x1+x2)/2;
   if RASTREO
      %fprintf('(%f,%f) x=%f  f(x)=%f ',x1,x2,x,feval(f,x))
      fprintf('%8.4f %8.4f %8.4f %8.4f %8.4f %8.4f\n',...
         x1,x2,x,feval(f,x1),feval(f,x2),feval(f,x))
      %pause
   end
   if feval(f,x1)*feval(f,x) < 0
      x2 = x;
      %fprintf(' x2<=%f\n',x)
   else
      x1 = x;
      %fprintf(' x1<=%f\n',x)
   end
   if abs(x1-x2)<tol || feval(f,x)==0
      break
   end
end