function [res1,res2] = SplineCubico(varargin)

%    [yt,coef] = SplineCubico(x,f,xt)
%           yt = SplineCubico(xt,x,coef)
%         coef = SplineCubico(x,f)
%
% Realiza interpolacion mediante splines cubicos

% Manuel Valenzuela
% 19 de febrero de 2007

xt = [];
coef = [];
if length(varargin)==3
   if length(varargin{1})==length(varargin{2})
      caso = 1;
      x = varargin{1};
      f = varargin{2};
      xt = varargin{3};
   else
      caso = 2;
      xt = varargin{1};
      x = varargin{2};
      coef = varargin{3};
      a = coef(:,1);
      b = coef(:,2);
      c = coef(:,3);
      d = coef(:,4);
   end
elseif length(varargin)==2
   caso = 3;
   x = varargin{1};
   f = varargin{2};
end
   

n = length(x)-1;

if caso==1 || caso==3
   f = shiftdim(f); % para asegurarse que f es vector columna

   % Formar matriz A y vector bb
   A = zeros(n,n);
   bb = zeros(n+1,1);
   A(1,1) = 1;
   h = x(2:n+1)-x(1:n);
   for i=2:n
      A(i,i-1:i+1) = [h(i-1) 2*(h(i-1)+h(i)) h(i)];
      bb(i) = (3/h(i))*(f(i+1)-f(i))-(3/h(i-1))*(f(i)-f(i-1));
   end
   A(n+1,n+1) = 1;

   % Resolver sistema A*b = bb
   b = Montante(A,bb);
   % b = A\bb;
   
   % obtener a, b, y d
   c = zeros(n,1);
   a = zeros(n,1);
   for i=1:n
      c(i) = (1/h(i))*(f(i+1)-f(i))-(h(i)/3)*(b(i+1)+2*b(i));
      a(i) = 1/(3*h(i))*(b(i+1)-b(i));
   end
   % OTRA FORMA MAS EFICIENTE: a = (1./(3*h(1:n)')).*(b(2:n+1)-b(1:n))
   
   b = b(1:n);
   d = f(1:n);
   coef = [a b c d];
end


if caso==1 || caso==2
   % Interpolar para los valores de prueba
   yt = zeros(size(xt));
   for t=1:length(xt)
      % Encontrar cual segmento usar
      i = find(x<=xt(t),1,'last');
      if isempty(i)
         i = 1;
      elseif i>n
         i = n;
      end
      yt(t) = a(i)*(xt(t)-x(i))^3+b(i)*(xt(t)-x(i))^2+c(i)*(xt(t)-x(i))+d(i);
   end
end

switch caso
   case 1
      res1 = yt;
      res2 = coef;
   case 2
      res1 = yt;
   case 3
      res1 = coef;
end

