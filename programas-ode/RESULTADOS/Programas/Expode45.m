clear all
clc
%Example01
%A simple example to solve ODE´s
%Uses ode 45 to solve
%dx_dt(1)=0*x(1)+0*x(2)-2*sqrt(2)/(exp(z)+exp(-z))*x(3)
%dx_dt(2)=0*x(1)+0*x(2)+(exp(z)-exp(-z))/(exp(z)+exp(-z))*x(3)
%dx_dt(3)=2*sqrt(2)/(exp(z)+exp(-z))*x(1)+(exp(-z)-exp(z))/(exp(z)+exp(-z))*x(2)+0*x(3)
%set an error
options=odeset('RelTol',1e-6,'Stats','on');
%initialconditions z=0
Xo=[0;1/2;-1/2];
%time span
zspan= [0,10];
%call the solver
tic
[z,X]=ode45(@TestFunction4,zspan,Xo,options);
toc
%plot the results
figure
hold on
grid
plot(z,X(:,1));plot(z,X(:,2),'r:');plot(z,X(:,3),'g:')
legend('X1','X2','X3');
ylabel('X');
xlabel('z');