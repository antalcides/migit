       program sin_calc

c.....  Calculation of sin(x) for a given x

        print*,' Calculation of sin(x)'

c....   reading input
100     print*,' give the value of x (rad):'
        read*,x

c.....  calculation of sin(x)
        y = sin(x)
        print*,' x (rad) =:',x,'    sin(x)=:',y

c.....  finish
        print*,' continue? ("no=0"  "yes=1") '
        read*,icont

        if (icont.ne.0) go to 100

        stop
        end

