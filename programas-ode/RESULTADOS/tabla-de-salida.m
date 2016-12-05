x=0:5 %vector fila
y=3*x.^2-5 %vector fila
res(:,1)=x'; %columna 1 de la matriz 
res(:,2)=y';  %columna 2 de la martiz
%esto es equivalente a poner res=[x' y']
disp('abscisa   ordenada')
disp(res)