        Subroutine int_trap(f,a,b,r,n)
c===========================================================
c int_trap.f: integration by trapezoid rule of f(x) on [a,b]
c method:     trapezoid rule
c written by: Alex Godunov (March 2007)
c-------------------------------------------------
c f     - Function to integrate (supplied by a user)
c a	- Lower limit of integration
c b	- Upper limit of integration
c R	- Result of integration (out)
c n	- number of intervals
c=================================================
        Real*8 a, b, f, r ,dx, x
	Integer*4 n, i
        r = 0.0
	dx = (b-a)/float(n)
	Do i=1,n-1
            x = a+float(i)*dx
            r = r + f(x)
	End do
        r = (r + (f(a)+f(b))/2.0)*dx
	Return
        End