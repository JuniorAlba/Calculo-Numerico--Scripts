clear all; clc;
format long;
addpath("G:/Mi unidad/$Cursado actual/Calculo numerico/Scripts octave")
A = diag(-1*ones(1,38),-1) + diag(2*ones(1,39),0) + diag(-1*ones(1,38),1);
tol = 1e-6;
h = 1/40;
U0 = zeros(39,1);
maxit = 10000;
b = h^2 * 20 * exp(-10 .* ((1:39).*h - 0.7) .^ 2);
b(1) = b(1) + 5;
b(39) = b(39) +6;
b = b';
[U,it,r_h] = gauss_seidel(A,b,U0,maxit,tol);
it
U(20)

