
t1 = (1:12)';
y = (load('datos2.txt'));
f1 = @(t) t;
f2 = @(t) t*0 +1;
f3 = @(t) sin(pi.*t./6);
f4 = @(t) cos(pi.*t./6);
A = [f1(t1) f2(t1) f3(t1) f4(t1)];
size(A)
%la formula es At*A*a = At*y
% donde a es el vector de coeficientes
% yo expreso a At*A = R y At*y = b
% y luego resuelvo el sistema R*a = b
At = A';
b = At*y;
R = At*A;
a = R\b;
a

f=@(t) a(1)*f1(t) + a(2)*f2(t) + a(3)*f3(t) + a(4)*f4(t);
%error cuadratico absoluto:
n = length(t1);
norm(y-f(t1),2) %pensaba que deberia elevar al cuadrado, pero si elevo no llego al resultado de la imagen


f(13)

%error relativo:
(27.8-f(13))/27.8