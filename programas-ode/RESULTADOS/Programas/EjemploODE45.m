clear all
clc
%Example01
%A simple example to solve ODE´s
%Uses ode 45 to solve
%dx_dt(1)=1*x(1)+x(2)+x(3)
%dx_dt(2)=-x(1)+x(2)-x(3)
%dx_dt(3)=x(1)-x(2)-x(3)
%set an error
options=odeset('RelTol',10^(-6));
%initialconditions
Xo=[1;1;1];
%time span
tspan= [0,5];
%call the solver
tic
[t,X]=ode45(@TestFunction1,tspan,Xo,options);
toc
%plot the results
figure
hold on
grid
plot(t,X(:,1));plot(t,X(:,2),'r:');plot(t,X(:,3),'g:')
legend('X1','X2','X3');
ylabel('X');
xlabel('t');
