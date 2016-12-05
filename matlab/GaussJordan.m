function res = GaussJordan(A,varargin)

% Implementacion del metodo Gauss-Jordan para resolver sistemas de
% ecuaciones lineales y encontrar la inversa de una matriz.
%
%    Inv = GaussJordan(A)
%
% Regresa Inv, la inversa de A.
%
%    x = GaussJordan(A,b)
%
% Regresa x, la solucion del sistema Ax=b.

% 21 agosto 2007
% Manuel Valenzuela

MAXPIVOTE = 0;

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
   
for i=1:n
   
   if MAXPIVOTE
      % Encontrar renglon de maximo pivote
      k = find(abs(A(:,i))==max(abs(A(i:n,i))),1,'last');
   
      if k~=i
          % Intercambiar renglones
          rPivote = A(k,:);
          A(k,:) = A(i,:);
          A(i,:) = rPivote;
      end
   end
   
   % Salir si determinante es cero
   if abs(A(i,i)) == 0
      error('Determinante es igual a cero')
   end
   
   % Dividir renglon entre el pivote
   A(i,:) = A(i,:)/A(i,i);
   
   % Hacer ceros en la columna i
   for j=1:n
      if i~=j
         A(j,:) = A(j,:) - A(i,:)*A(j,i);
      end
   end
end

res = A(:,n+1:m);
