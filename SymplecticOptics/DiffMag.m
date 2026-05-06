%% Eq. (32) of the paper https://doi.org/10.1364/JOSAA.404552
% Differential magnifier - - obtained using Eq. (31)

clear
clc
close all

% Prop(d) - free propagation matrix
% Lenx(f) - x-cylindrical lens
% Leny(f) - y-cylindrical lens

%% Verification 

syms a b;

LH = [a,0,0,0;
      0,1/a,0,0;
      0,0,b,0;
      0,0,0,1/b]; % LHS

RH = sym(eye(4)); % symbolic identity matrix

RH = Mult(RH, Lenx(a/(1+a)));
RH = Mult(RH, Leny(b/(1+b)));
RH = Mult(RH, Prop(1));
RH = Mult(RH, Lenx(1/(2+a)));
RH = Mult(RH, Leny(1/(2+b)));
RH = Mult(RH, Prop(1));
RH = Mult(RH, Lenx(a/(1+2*a)));
RH = Mult(RH, Leny(b/(1+2*b))); 
RH = Mult(RH, Prop(1));
RH = Mult(RH, Lenx(1));
RH = Mult(RH, Leny(1)); % RHS

ans1 = simplify(RH - LH); % LHS - RHS

disp(ans1); % correct if zero matrix is displayed

