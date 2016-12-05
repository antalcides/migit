% Aproximacion por sumas parciales de Fourier al pulso cuadrado.

% Funcion a aproximar
% f(x) = -1 en [-pi 0], 1 en [0 pi]

% Serie de Fourier
% f(x) = (4/\pi)*\sum_{l=0}^\infty \frac{1}{2l+1} \sin[(2l+1)x]


% Sumas parciales

x = linspace(-pi,pi,100);
sum0 = (4/pi)*sin(x);
sum1 = sum0+(4/pi)*sin(3*x)/3;
sum2 = sum1+(4/pi)*sin(5*x)/5;
sum3 = sum2+(4/pi)*sin(7*x)/7;
sum4 = sum3+(4/pi)*sin(9*x)/9;
sum5 = sum4+(4/pi)*sin(11*x)/11;

% Graficos

% Funcion a aproximar

plot([-pi 0 0 pi],[-1 -1 1 1]);

gset nokey;
hold on;

% Sumas parciales

plot(x,sum0);
plot(x,sum1);
plot(x,sum2);
plot(x,sum3);
plot(x,sum4);
plot(x,sum5);
hold off;

% Sumando hasta l=50

x = linspace(-pi,pi,1000);
sum=0;

for l=0:50,
  sum = sum+(4/pi)*sin((2*l+1)*x)/(2*l+1);
end

figure;
plot([-pi 0 0 pi],[-1 -1 1 1],'r');
hold on;
plot(x,sum,'b');
hold off;