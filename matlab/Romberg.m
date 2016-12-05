function [int,R,n] = Romberg(f,x0,xf,varargin)

%   [int,R,n] = Romberg(f,x0,xf,Eps=eps)
%
% Se obtiene la integral numérica de la función f, desde el valor 
% inicial x0 al valor final xf mediante el método de Romberg y trapecios,

% 25 octubre 2007
% M. Valenzuela

if length(varargin)>=1
   Eps = varargin{1};
else
   Eps = eps;
end

n = 1;
i = 1;
R(i,1) = trapecios(f,x0,xf,n);
R
pause
while 1
   n = n*2;
   i = i+1;
   R(i,1) = trapecios(f,x0,xf,n);
   R
   pause
   j = 0;
   for k=i-1:-1:1
     j = j + 1;
     [k,j+1]
     fprintf('%f %f %f %f\n',4^j-1,R(k+1,j), R(k+1,j), R(k,j))
     R(k,j+1) = R(k+1,j)+1/(4^j-1)*(R(k+1,j)-R(k,j));
     R
     pause
   end
   if abs(R(1,j+1)-R(1,j)) < Eps
      int = R(1,j+1);
      break
   end
end


