f = @(t,x) [-t*x(2) ; t*x(1) - t*x(2)];
x0 = [1 ; -1];
a = 0;
b = 20;
h=0.05;
N = (b-a)/h;
[t,x]= euler(f,[a b],x0, N);
x1 = x(:,1);
x2 = x(:,2);

figure(1);
hold on;
grid on;
grid minor;
plot(t,x1,'r-');

figure(2);
hold on;
grid on;
grid minor;
plot(t,x2,'b-');

figure(3)
hold on;
grid on;
grid minor;
plot(x1,x2,'g-');

