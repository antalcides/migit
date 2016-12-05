function [X,Y] = EulerMejorado3(x,y,x1,n)
h = (x1-x)/n;                   %Tamaño del paso
X = x;                          %x inicial
Y = y;                          %y inicial
for i = 1:n             %Inicio del ciclo
    k1 = f(x,y);        %Primer pendiente
    k2 = f(x+h,y+h*k1); %Segunda pendiente
    k = (k1+k2)/2;      %Pendiente promedio
    y = y+h*k;          %y nueva
    x = x+h;            %x  nueva
    X = [X;x];          %Actualiza la columna x
    Y = [Y;y];          %Actualiza la columna y
end                     %Fin del ciclo

figure(1)
hold on
plot(X,Y(:,1),'-*');%Grafica de la aproximacion 
xlabel('X')
ylabel('W')
title('Grafica de la aproximacion')
grid
hold off

function yp = f(x,y)
yp = (x+y+0.0001*x*y)/(x-y);                 %yp = y', x=1, y=2, h=0.1

