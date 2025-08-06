format long;
a = 0;
b = 20;
f = @(t,x) [x(2) ;  -sin(x(1))];
x0 = [0 0.1];
[t,x] = rk4(f,[a b], x0, 200);
x1 = x(:,1);
x2 = x(:,2);
x1(end)
figure(1);
plot(t,x1,'r-');
length(x1)