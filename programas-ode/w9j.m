function w = w9j(j1,j2,j3,j4,j5,j6,j7,j8,j9)

% W = W9J(j1,j2,j3,j4,j5,j6,j7,j8,j9)
%
% Calculates Wigner 9-j Symbol using 6-j Symbol [Check phase factor]
%       { j1 j2 j3 }
%       { j4 j5 j6 } = SUM [t] {j1 j9 t }*{j2 j6 t }*{j1 j9 t }
%       { j7 j8 j9 }           {j8 j4 j7} {j4 j8 j5} {j6 j2 j3}
%
% Summation over t is for all integers which satisfy triangle relation.
% All columns and rows should satisfy the triangle rule
%
% Equation (8.22) in 'Angular Momentum:Techniques in Quantum Mechanics'
% by V. Devanathan, Kluwer Academic Publishers (1999).
%
%J. Pritchard Durham University 2009

%Test triangle relations
if((triangle(j1,j2,j3)||triangle(j4,j5,j6)||triangle(j7,j8,j9))==1)
    error('Rows must satisfy triangle relations');
elseif((triangle(j1,j4,j7)||triangle(j2,j5,j8)||triangle(j3,j6,j9))==1)
    error('Columns must satisfy triangle relations');
else
    w=0;
    tmin=max([abs(j1-j9),abs(j8-j4),abs(j2-j6)]);
    tmax=min([j1+j9,j8+j4,j2+j6]);
    for(t=tmin:tmax)
        w = w + (2*t+1)*w6j(j1,j9,t,j8,j4,j7)*w6j(j2,j6,t,j4,j8,j5)*w6j(j1,j9,t,j6,j2,j3);
    end
end

%Triangle relations test |a-b|<=c<=a+b
function test=triangle(a,b,c)
test=(a<abs(b-c))||(a>(b+c));