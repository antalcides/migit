      Subroutine euler22m(d1x,d2x,d1y,d2y,ti,tf,xi,xf,yi,yf)
c=================================================
c euler22m.f: Solution of the second-order 2D ODE
c method:     modified Euler (predictor-corrector)
c written by: Alex Godunov
c last revision: 21 October 2006
c-------------------------------------------------
c input ...
c d1x(t,x,y)- function dx/dt   (supplied by a user)
c d2x(t,x,y)- function d2x/dt2 (supplied by a user)
c d1y(t,x,y)- function dy/dt   (supplied by a user)
c d2y(t,x,y)- function d2y/dt2 (supplied by a user)
c    where x(2) and y(2) (x(1)-position, x(2)-speed, etc.)
c ti 	- initial time
c tf  - time for a solution
c xi(2) - initial position and speed for x component
c yi(2) - initial position and speed for y component
c
c output ...
c xf(2) - solutions (x position and speed) at point tf
c yf(2) - solutions (y position and speed) at point tf
c=================================================
      implicit none
      Real*8 d1x, d2x, d1y, d2y, ti, tf
      Real*8 xi(2), xf(2), yi(2), yf(2)
      Real*8 h,t, x1, x2, y1, y2
      Real*8 k1x(2),k2x(2),k3x(2),k4x(2),k1y(2),k2y(2),k3y(2),k4y(2)
      h = tf-ti
      t = ti
c*** Euler
      xf(1) = xi(1) + h*d1x(t,xi,yi)
      xf(2) = xi(2) + h*d2x(t,xi,yi)
      yf(1) = yi(1) + h*d1y(t,xi,yi)
      yf(2) = yi(2) + h*d2y(t,xi,yi)
c*** modified Euler
      xf(1) = xi(1) + (d1x(t,xi,yi)+d1x(t,xf,yf))*0.5*h
      xf(2) = xi(2) + (d2x(t,xi,yi)+d2x(t,xf,yf))*0.5*h
      yf(1) = yi(1) + (d1y(t,xi,yi)+d1y(t,xf,yf))*0.5*h
      yf(2) = yi(2) + (d2y(t,xi,yi)+d2y(t,xf,yf))*0.5*h
      Return
      End