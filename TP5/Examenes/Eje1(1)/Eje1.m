y = [4.24 4.44 4.91 5.44 5.65 5.33 3.91 1.86 0.07 -1.16 -1.94];
x1 = linspace(0,2,11);
f1 = @(x) x-x+1;
f2 = @(x) cos(pi.*x./2);
f3 = @(x) cos(pi.*x./2).^2;
A = [f1(x1)' f2(x1)' f3(x1)'];
At = A';
R = At*A;
b = At*y';
a = R\b;
f = @(x) a(1)*f1(x) + a(2)*f2(x) + a(3)*f3(x);
%error del ajuste para x=1
(5.33-f(1))