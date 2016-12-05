      Subroutine rk4_d22(d1x,d2x,d1y,d2y,ti,tf,xi,xf,yi,yf)
c==========================================================
c rk4_d22.f:  Solution of the second-order 2D ODE
c method:     Runge-Kutta 4th-order
c written by: Alex Godunov
c last revision: 21 October 2006
c----------------------------------------------------------
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
c
c the program written as an educational program
c therefore, the text is clear but far from concise
c the program can be easily rewritten in a compact form
c==========================================================
      implicit none
      Real*8 d1x, d2x, d1y, d2y, ti, tf
      Real*8 xi(2), xf(2), yi(2), yf(2)
      Real*8 h,t, x(2), y(2)
      Real*8 k1x(2),k2x(2),k3x(2),k4x(2),k1y(2),k2y(2),k3y(2),k4y(2)
      h = tf-ti
      t = ti
c  k1
      k1x(1) = h*d1x(t,xi,yi)
      k1x(2) = h*d2x(t,xi,yi)
      k1y(1) = h*d1y(t,xi,yi)
      k1y(2) = h*d2y(t,xi,yi)
c  k2
        x(1) = xi(1)+k1x(1)/2.0
        x(2) = xi(2)+k1x(2)/2.0
        y(1) = yi(1)+k1y(1)/2.0
        y(2) = yi(2)+k1y(2)/2.0

      k2x(1) = h*d1x(t+h/2.0,x,y)
      k2x(2) = h*d2x(t+h/2.0,x,y)
      k2y(1) = h*d1y(t+h/2.0,x,y)
      k2y(2) = h*d2y(t+h/2.0,x,y)
c  k3
        x(1) = xi(1)+k2x(1)/2.0
        x(2) = xi(2)+k2x(2)/2.0
        y(1) = yi(1)+k2y(1)/2.0
        y(2) = yi(2)+k2y(2)/2.0

      k3x(1) = h*d1x(t+h/2.0,x,y)
      k3x(2) = h*d2x(t+h/2.0,x,y)
      k3y(1) = h*d1y(t+h/2.0,x,y)
      k3y(2) = h*d2y(t+h/2.0,x,y)
c  k4
        x(1) = xi(1)+k3x(1)
        x(2) = xi(2)+k3x(2)
        y(1) = yi(1)+k3y(1)
        y(2) = yi(2)+k3y(2)

      k4x(1) = h*d1x(t+h,x,y)
      k4x(2) = h*d2x(t+h,x,y)
      k4y(1) = h*d1y(t+h,x,y)
      k4y(2) = h*d2y(t+h,x,y)

c result

	xf(1) = xi(1)+k1x(1)/6.0+k2x(1)/3.0+k3x(1)/3.0+k4x(1)/6.0
	xf(2) = xi(2)+k1x(2)/6.0+k2x(2)/3.0+k3x(2)/3.0+k4x(2)/6.0
	yf(1) = yi(1)+k1y(1)/6.0+k2y(1)/3.0+k3y(1)/3.0+k4y(1)/6.0
	yf(2) = yi(2)+k1y(2)/6.0+k2y(2)/3.0+k3y(2)/3.0+k4y(2)/6.0

      Return
      End