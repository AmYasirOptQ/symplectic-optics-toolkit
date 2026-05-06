%% Eq. (31) of the paper https://doi.org/10.1364/JOSAA.404552
% Identity 2

clear
clc
close all

% Prop(d) - free propagation matrix
% Lenx(f) - x-cylindrical lens
% Leny(f) - y-cylindrical lens

%% Verification 

syms a1 b1 d1 a2 b2 d2;

c1 = (a1*d1 - 1)/b1;
c2 = (a2*d2 - 1)/b2;

LH = [a1,b1,0,0;
      c1,d1,0,0;
      0,0,a2,b2;
      0,0,c2,d2]; % LHS

RH = sym(eye(4)); % symbolic identity matrix

RH = Mult(RH, Lenx(a1/(1-c1+a1)));
RH = Mult(RH, Leny(a2/(1-c2+a2)));
RH = Mult(RH, Prop(1));
RH = Mult(RH, Lenx(1/(2+a1)));
RH = Mult(RH, Leny(1/(2+a2)));
RH = Mult(RH, Prop(1));
RH = Mult(RH, Lenx(a1/(1+b1+2*a1)));
RH = Mult(RH, Leny(a2/(1+b2+2*a2))); 
RH = Mult(RH, Prop(1));
RH = Mult(RH, Lenx(1));
RH = Mult(RH, Leny(1)); % RHS

ans1 = simplify(RH - LH); % LHS - RHS

disp(ans1); % correct if zero matrix is displayed

