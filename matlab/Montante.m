function [res,det] = Montante(A,varargin)

% Implementacion del metodo Montante para resolver sistemas de
% ecuaciones lineales y encontrar la inversa de una matriz.
%
%    [Inv,det] = Montante(A)
%
% Regresa Inv, la inversa de A, y el determinante de A.
%
%    [x,det] = Montante(A,b)
%
% Regresa x, la solucion del sistema Ax=b, y el determinante de A.

% 21 agosto 2007
% Manuel Valenzuela

MAXPIVOTE = 1;
det = 1;

% Se crea la matriz aumentada
[n,m] = size(A);
if length(varargin)>=1
   b = varargin{1};
   A = [A b];
elseif n==m 
   A = [A eye(n)];
end
[n,m] = size(A);

if n>m
   error('n>m en la matriz aumentada');
end

pivAnt = 1; % pivote inicial
for i=1:n
   if MAXPIVOTE
      % Encontrar renglon del maximo pivote
      k = find(abs(A(:,i))==max(abs(A(i:n,i))),1,'last');

      if k~=i 
         % Intercambiar renglones
         det = -det;
         rPivote = A(k,:);
         A(k,:) = A(i,:);
         A(i,:) = rPivote;
      end
   end
   
   piv = A(i,i);  % pivote actual
   
   % Salir si determinante es cero
   if piv==0
      error('Determinante es igual a cero')
   end
   
   % Hacer ceros en la columna i
   for j=1:n
      if j~=i
         A(j,:) = (A(j,:)*piv - A(i,:)*A(j,i))/pivAnt;
      end
   end
      
   % Guardar el pivote anterior
   pivAnt = piv;

end

% Dividir entre el ultimo pivote (determinante)
A = A/piv;

% Obtener resultado
res = A(:,n+1:m);
det = det*piv;
