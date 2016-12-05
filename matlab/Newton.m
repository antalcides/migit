function yt = Newton(x,f,xt)

%   yt = Newton(x,f,xt)
%
% Metodo de interpolacion de Newton

% M. Valenzuela
% 1 de marzo de 2007

% Se obtiene la matriz de diferencias divididas D
n = length(f)-1;
D = zeros(n+1,n+1);
D(:,1) = f;
for j=2:n+1
   for i=1:n-j+2
      D(i,j) = (D(i+1,j-1)-D(i,j-1))/(x(i+j-1)-x(i));
   end
end
%D

% Se realiza la interpolacion para los valores de prueba xt
for t=1:length(xt)
	sum = 0;
   for i=1:n+1
      prod = 1;
      for j=1:i-1
         %fprintf('%f %f\n',xt(t),x(j))
         prod = prod*(xt(t)-x(j));
      end
      sum = sum + D(1,i)*prod;
   end
   yt(t) = sum;
end


