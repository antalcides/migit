function [X, Y, G, EA, ER] = euler(x,y,x1,n)
h = (x1-x)/n;                   %Tamaño del paso
X = x;                          %x inicial
Y = y;                          %y inicial
G = g(x,y);                     %G inicial
EA = abs(g(x,y)-y);             %Error absoluto
ER = abs(g(x,y)-y)/abs(g(x,y)); %Error relativo
for i = 1:n          %Inicio del ciclo
    y = y+h*f(x,y);  %Iteracion de Euler
    x = x+h;         %x  nueva
    X = [X;x];       %Actualiza la columna x
    Y = [Y;y];       %Actualiza la columna y
    G = [G;g(x,y)];  %Actualiza la columna g
    EA = [EA;abs(g(x,y)-y)];
    ER = [ER;abs(g(x,y)-y)/abs(g(x,y))];
end                  %Fin del ciclo

plot(X,Y(:,1),'-*',X,G(:,1),'-'); %Grafica de la aproximacion y de la solucion exacta

function yp = f(~,y)
yp = y-4*y*y;              %yp = y'
%yp=2*y;

function gp = g(x,~)
gp = 2*exp(x)/(8*exp(x)-7);        %Solucion exacta
%gp=exp(2*x);
