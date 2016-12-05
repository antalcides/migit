       program sin_calc

c.....  Calculation of sin(x) for a given x
c.....  x is given in degrees

c.....  calculation of Pi
        Pi = 2.0*asin(1.0)

        print*,' Calculation of sin(x)'

c....   reading input
100     print*,' give the value of x (deg):'
        read*,xdeg

c....   conversion deg --> rad
        x = xdeg *  Pi / 180

c.....  calculation of sin(x)
        y = sin(x)
        print*,' x (deg) =:',xdeg,'    sin(x)=:',y

c.....  finish
        print*,' continue? ("no=0"  "yes=1") '
        read*,icont

        if (icont.ne.0) go to 100

        stop
        end

