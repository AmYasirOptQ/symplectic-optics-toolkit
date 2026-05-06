%% Eq. (35) of the paper https://doi.org/10.1364/JOSAA.404552
% Inverse partial Fourier transform

clear
clc
close all

% Prop(d) - free propagation matrix
% Lenx(f) - x-cylindrical lens
% Leny(f) - y-cylindrical lens

%% Verification

syms d;

LH = [1,0,0,0;
      0,1,0,0;
      0,0,0,-d;
      0,0,1/d,0]; % LHS

RH = sym(eye(4)); % symbolic identity matrix

RH = Mult(RH, Lenx(1/2));
RH = Mult(RH, Leny(d/(2*d-1)));
RH = Mult(RH, Prop(1));
RH = Mult(RH, Lenx(1/3));
RH = Mult(RH, Leny(1/3));
RH = Mult(RH, Prop(1));
RH = Mult(RH, Lenx(1/3));
RH = Mult(RH, Leny(1/(3-d))); 
RH = Mult(RH, Prop(1)); 
RH = Mult(RH, Lenx(1));
RH = Mult(RH, Leny(d/(d-1)));% RHS

ans1 = simplify(RH - LH); % LHS - RHS

disp(ans1); % correct if zero matrix is displayed
