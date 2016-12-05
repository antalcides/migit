function [c,yt] = interDirecta(x,f,varargin)

%   c = interDirecta(x,f)
%   [c,yt] = interDirecta(x,f,xt)
%
% Realiza interpolacion directa de los datos (x,f). Evalua el polinomio
% de interpolación en el vector xt. Regresa los coeficientes c del
% polinomio de interpolacion.

% Manuel Valenzuela
% 19 de febrero de 2007

n = length(f)-1;
f = shiftdim(f); % para asegurarse que f es vector columna

% Se construye la matriz A
A = ones(n+1,n+1);
for i=1:n+1
	for j=1:n
		A(i,j) = x(i)^(n-j+1);
	end
end

% Se resuelve el sistema de ecuaciones para encontrar los coeficientes
c = Montante(A,f);
%c = A\f

% Se evalua el polinomio de interpolacion en los puntos de prueba
if length(varargin)>0
   xt = varargin{1};
   yt = zeros(size(xt));
   for t=1:length(xt)
      yt(t) = c(n+1);
      for i=1:n
         yt(t) = yt(t) + c(i)*xt(t)^(n-i+1);
      end
   end
end