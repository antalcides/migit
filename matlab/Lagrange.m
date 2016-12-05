function yt = Lagrange(x,f,xt)

%  yt = Lagrange(x,f,xt)
%
% Realiza interpolacion de los datos (x,f) mediante un polinomio 
% de Lagrange. Evalua el polinomio de interpolacion en el vector xt

% Manuel Valenzuela
% 15 febrero 2007

RASTREO = 0;

n = length(f)-1;

for t=1:length(xt)
   yt(t) = 0;
   for i=1:n+1
      prod = 1;
      if RASTREO
         pD = 1; % numerador
         pd = 1; % denominador
      end
      for j=1:n+1
         if j~=i
            prod = prod*(xt(t)-x(j))/(x(i)-x(j));
            if RASTREO
               pD = pD*(xt(t)-x(j));
               pd = pd*(x(i)-x(j));
            end
         end
      end
      yt(t) = yt(t) + f(i)*prod;
      if RASTREO
         fprintf('término %d: %f*(%f/%f)\n',i,f(i),pD,pd);
      end
   end
end