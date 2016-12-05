function yt = NewtonGregory(x1,deltaX,f,xt)

%   yt = NewtonGregory(x1,deltaX,f,xt)
%
% Metodo de interpolacion Newton-Gregory para datos uniformemente
% espaciados
%     x1: primer dato
% deltaX: espaciamiento de los datos (x(i+1)-x(i))
%      f: vector de valores de y
%     xt: valores para interpolar

% M. Valenzuela
% 25 sept 2007

% Se obtiene la matriz de diferencias deltaF
n = length(f)-1;
deltaF = zeros(n+1,n+1);
deltaF(:,1) = f;
for j=2:n+1
   for i=1:n-j+2
      deltaF(i,j) = deltaF(i+1,j-1)-deltaF(i,j-1);
   end
end
deltaF
[nd,md] = size(deltaF);
deltaF = deltaF(1:nd-1,2:md);
deltaF
pause

% Se encuentra el vector de indices no enteros s
s = (xt-x1)/deltaX;

% Se realiza la interpolacion para los valores de prueba xt
for t=1:length(xt)
   sum = f(1);
   for i=1:n
      sum = sum + combinaciones(s(t),i)*deltaF(1,i);
   end
   yt(t) = sum;
end

function res = combinaciones(s,k)
% Regresa las combinaciones de s tomando k, donde s puede ser no entera
res = 1;
if k==0
   return
end
for i=1:k
   res = res*(s-i+1)/i;
end
