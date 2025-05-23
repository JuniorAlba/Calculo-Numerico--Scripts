addpath("G:\Mi unidad\$Cursado actual\Calculo numerico\Scripts octave\Tp4");
f  = @(x) x.^4+2*x.^2-x-3 ;
x=linspace(1, 3/2 ,100);
x0=1;
tol=10^-7;
kmax=50;

figure(1)
plot(x,f(x),'k-')
grid on; grid minor
z =@(x) x==0;
hold on
plot(x,z(x),'r-')
title('Cero de la funcion')
hold off

g1 = @(x) (3+x-2*x.^2).^(0.25);
g2 = @(x) ((x+3-x.^4)/2).^(0.5);
g3 = @(x) ((x+3)./(x.^2+2)).^(0.5);
g4 = @(x) ((3*x.^4+2*x.^2+3)./(4*x.^3+4*x-1));

display("Iteraciones utilizando g1")
[x1, rh1, it1,t1] = puntofijo_p(g1, x0, kmax, tol);
it1
display("Iteraciones utilizando g2")
[x2, rh2, it2,t2] = puntofijo_p(g2, x0, kmax, tol);
it2
display("Iteraciones utilizando g3")
[x3, rh3, it3,t3] = puntofijo_p(g3, x0, kmax, tol);
it3
display("Iteraciones utilizando g4")
[x4, rh4, it4,t4] = puntofijo_p(g4, x0, kmax, tol);
it4

figure(2)
hold on
semilogy(rh4,'b-')
semilogy(rh3,'r-')
semilogy(rh2,'g-')
semilogy(rh1,'y-')
grid on, grid minor

title('Convergencia')

hold off
%se puede ver que la que converge mas rapido es g4, luego g3 y luego g1. g2 no converge

%no logre hacer que funcione:
x_vals = x;
pkg load symbolic
syms x
%g1 = (3+x-2*x^2)^(1/4);
%g2 = ((x+3-x.^4)/2)^(1/2);
%g3 = ((x+3)./(x.^2+2))^(1/2);
%g4 = (3*x^4+2*x^2+3)/(4*x.^3+4*x-1);
g1 = (3 + x - 2*x^2)^(sym('1/4'));
g2 = (x + 3 - x^4)^(sym('1/2'));
g3 = ((x^3) / (x^2 + 2))^(sym('1/2'));
g4 = (3*x^4 + 2*x^2 + 3) / (4*x^3 + 4*x - 1);

figure(3)
hold on

dg1 = diff(g1, x);
dg2 = diff(g2, x);
dg3 = diff(g3, x);
dg4 = diff(g4, x);

dg1_vals = double(subs(dg1, x, x_vals));
dg2_vals = double(subs(dg2, x, x_vals));
dg3_vals = double(subs(dg3, x, x_vals));
dg4_vals = double(subs(dg3, x, x_vals));
plot(x_vals,dg4_vals,'b-')
plot(x_vals,dg3_vals,'r-')
plot(x_vals,dg2_vals,'g-')
plot(x_vals,dg1_vals,'y-')



