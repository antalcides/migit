function [dx_dz]= TestFunction4(z,X)

    %A function which returns a rate of change vector
    %z=ones(1);
    M=[0 0 -2*sqrt(2)/(exp(z)+exp(-z));0 0 (exp(z)-exp(-z))/(exp(z)+exp(-z));2*sqrt(2)/(exp(z)+exp(-z)) (exp(-z)-exp(z))/(exp(z)+exp(-z)) 0];
    dx_dz=M*X;
    return