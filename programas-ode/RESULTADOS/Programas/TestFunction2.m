function [dx_dz]= TestFunction2(z,X)

    %A function which returns a rate of change vector
    %z=ones(1);
    M=[0 0 -2*sqrt(2)/(z^2+1);0 0 (z^2-1)/(z^3+z);2*sqrt(2)/(z^2+1) (1-z^2)/(z^3+z) 0];
    dx_dz=M*X;
    return