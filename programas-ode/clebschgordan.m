function cg=clebschgordan(j1,j2,m1,m2,J,M)

% cg=clebschgordan(j1,j2,m1,m2,J,M)
%
% Calculates CG coefficient <j1j2m1m2|JM> for the angular momentum state 
% providing the following are true:
%
% A: All m quantum numbers are projections of respective j value
%     |mi|<=ji
% B: Triangle relation satisfied:
%     |j1-j2|<=J<=j1+j2
% C: CG=0 unless m1+m2=M
%
% ClebschGordan coefficient evaluated using equation found in 'Angular 
% Momentum: An Illustrated guide to Rotational Symmetries for
% Physical Systems', W. J. Thompson
%
%Special cases are entered manually to reduce computation
%
%J. Pritchard Durham University 2009

%Check Projections
if((abs(m1)>j1)||(abs(m2)>j2))
    disp(sprintf('j1:%1.2f,mj1:%1.2f,j2:%1.2f,mj2:%1.2f',j1,m1,j2,m2));
    error(sprintf('Values of m must satisfy projections onto j such that |m|<=j'));
%Check Triangular relation
elseif(((J<abs(j1-j2))||(J>(j1+j2))))
    error(sprintf('Addition of angular momentum requires triangle relation\n\t|j1-j2|<=J<=j1+j2'));
%Evaluate CG
else
    if(m1+m2~=M)
        cg=0;
    elseif(j2==0)
        cg=1;
    elseif(J==0)
        cg=(-1)^(j1-m1)/sqrt(2*j1+1);
    else
        cg=sqrt(2*J+1)*...
            exp(0.5*(lgf(J+j1-j2)+lgf(J-j1+j2)+lgf(j1+j2-J)+lgf(J+M)+lgf(J-M)...
            -lgf(j1+j2+J+1)-lgf(j1-m1)-lgf(j1+m1)-lgf(j2-m2)-lgf(j2+m2)))...
            *ksum(j1,m1,j2,m2,J,M);
    end
end

%Summation performed for all values of k which give non-negative factorials
function Ck=ksum(j1,m1,j2,m2,J,M)
Ck=0;
kmin=max([m1-j1,0,-j1+j2+M]);
kmax=min([J-j1+j2,J+M,j2+m1+J]);
for(k=kmin:kmax)
    Ck =Ck+(-1)^(k+j2+m2)*exp(lgf(j2+J+m1-k)+lgf(j1-m1+k)...
        -lgf(k)-lgf(J-j1+j2-k)-lgf(J+M-k)-lgf(k+j1-j2-M));
end

%Stirlings approximation ln(n!) = nln(n)-n+0.5ln(2pin)
function y=lgf(x)
if(x<170)
    y=log(factorial(x));
else
    y=x*log(x)-x+0.5*log(2*pi*x)+1/(12*x)-1/(360*x^3)+1/(1260*x^5)...
        -1/(1680*x^7)+1/(1188*x^9);
end