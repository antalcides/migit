t=linspace(0,0.7,100);
x=5*exp(-7*t).*sin(100*t+1.5); 
A=5*exp(-7*t);
hold on
plot(t,x,'r')
plot(t,A,'b') 
plot(t,-A,'b')
hold off
legend('desplazamiento','amplitud')
title('Oscilaciones amortiguadas')
xlabel('t')
ylabel('x') 
fprintf(x,t,A)