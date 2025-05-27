format long;
x = [-1 1 2 3 4];
y = [0.23 0.25 0.26 0.14 0.06];
x1 =x';
y_inv = [1/y(1) 1/y(2) 1/y(3) 1/y(4) 1/y(5)];
f1 = @(x) exp(x);
f2 = @(x) x;
f3 = @(x) x-x + 7.5;
A = [f1(x1) f2(x1) f3(x1)];
At = A';
R = At*A;
yt = y_inv';

b_matriz = At*yt;
a_coef = R\b_matriz;

a = 1/a_coef(3);
b = a_coef(1)*a;
c = a_coef(2)*a;
a
b
c
xx = linspace(-1,4,100);
figure(1)
hold on;
plot(xx,a./(b*f1(xx) + c*f2(xx) + f3(xx)),'r-','linewidth',2);

plot(x1',y,'ko','linewidth',2);
[S,dS,ddS]=funcion_spline(x1',y);
S(0)
%(S(0)-0.23023255)/S(0)<0.5e-7

%error por spline cubico
error_cubica = (0.23-S(0))/0.23
(error_cubica + 1.0111)/error_cubica < 0.5e-4


%error por ajuste de minimos cuadrados

error_min_cuad = (0.23 -  a./(b*f1(0) + c*f2(0) + f3(0)))/0.23