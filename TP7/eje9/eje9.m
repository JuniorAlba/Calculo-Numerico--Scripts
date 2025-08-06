clear all; clc;
f = @(t,x) [x(2) ; x(3) ; -4*sin(t)-2*cos(t)-4*x(3)-5*x(2)-2*x(1)]
x0 = [1 0 -1];
y_exacta = @(t) cos(t);
y_exacta_25 = y_exacta(2.5);
err = [1];
i=1;
x1=[];
x2=[];
x3=[];
max_it =1000;
N=10*i;
while(err(i)>5*10^(-7) && i<max_it)
    N=10*i;
    [t,x]=rk4(f,[0 2.5],x0,N);
    x3 = x(:,3);
    x2 = x(:,2);
    x1 = x(:,1);
    err = [err; abs(y_exacta_25-x1(end))];
    i++;
end
y_exacta_25
x1(end)
err(end)


[t,x]=rk4(f,[0 15],x0,N);
x3 = x(:,3);
x2 = x(:,2);
x1 = x(:,1);
cont = 0;
for j = 2:length(x2)
    if (x2(j-1) == 0 && x2(j) ~= 0)
        cont++;
    elseif (x2(j) == 0 && x2(j-1) ~= 0)
        cont++;
    elseif (x2(j-1) * x2(j) < 0)
        cont++;
    end
end
disp(['Cantidad de ceros de y''(t) en [0,15]: ', num2str(cont)]);

figure(1)
plot(t,x2,'r-');