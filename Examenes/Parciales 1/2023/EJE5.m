clear all; clc;
format long;
addpath("J:/Mi unidad/$Cursado actual/Calculo numerico/Scripts octave")

F = @(x) sin(x) + cos(1+x^2) - 1;
dF = @(x) cos(x) -2*x*sin(1+x^2);
%este numero tiene 10 digitos correctos respecto a la raiz que aproximamos y difiere
%en el onceavo digito
[x,h,it] = Newton(F,dF,8,10000,0.5e-11);
x

%este numero tiene 9 digitos correctos respecto a la raiz que aproximamos y difiere
%en el decimo digito
%tiene 10 ci
[x,h,it] = Newton(F,dF,8,10000,0.5e-10);
x
