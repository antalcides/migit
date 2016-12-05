# -*- coding: utf-8 -*-
"""
Created on Fri Oct 16 22:58:28 2015

@author: antalcides
"""
from pylab import*
g = 9.8 # m/s^2
y0 = 1.6 # 
t0 = 0.0
t1 = 1.0
dt = 0.005
n =int(ceil((t1-t0)/dt) + 1)
t = zeros((n,1),float)
y = zeros((n,1),float);

t[0] = t0
y[0] =y0-4.9*t[0]**2

for i in range(n):
       t[i] = t0 + i*dt
       y[i] = y0 - 4.9*t[i]**2
v = zeros(n-1,float);
for i in range(n-1):
    v[i] = (y[i+1] - y[i])/dt;
vt = -g*t
yt = y0 - 0.5*g*t**2
imax = max(find(t<=0.57))
subplot(2,1,1)
plot(t[0:imax],y[0:imax],'-r');
hold('on')
plot(t[0:imax],yt[0:imax],'--b');
hold('off')
xlabel('t [s]')
ylabel('y [m]')
subplot(2,1,2)
plot(t[0:imax],v[0:imax],'-r');
hold('on')
plot(t[0:imax],vt[0:imax],'--b');
hold('off')
xlabel('t [s]')
ylabel('v [m/s]')
show()
