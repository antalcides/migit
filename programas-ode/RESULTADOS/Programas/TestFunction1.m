function [dx_dt]= TestFunction1(~,x)

    %A function which returns a rate of change vector
    
    M=[1 1 1;-1 1 -1;1 -1 -1];
    
    dx_dt=M*x;
    
    return