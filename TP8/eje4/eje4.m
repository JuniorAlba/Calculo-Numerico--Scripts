p = @(x) -2./x;
q = @(x) 2./(x.^2);
r = @(x) sin(log(x))./(x.^2);
f = @(x) [p(x), q(x), r(x)];
a=1;
b=2;
inter = [a b];
h1 = 0.1;
h2 = 0.01;
L1 = (b-a)/h1;
L2 = (b-a)/h2;


c2 = (1/70) * (8 - 12*sin(log(2)) - 4*cos(log(2)));
c1 = 11/10 - c2;
y_exacta = @(x) c1*x + c2./x.^2 - (3/10)*sin(log(x)) - (1/10)*cos(log(x));
dy_exacta = @(x) c1 - 2*c2./(x.^3) - (3/10)*cos(log(x)).*1./x + (1/10)*sin(log(x)).*1./x;
A=1;
B=1;
C = A*y_exacta(2) + B*dy_exacta(2);
ycd = 1; %y(a) = 1
rob = [A, B, C]; %A B C
[x1,y1]=dif_fin_rob(f,inter,ycd,rob,L1);
[x2,y2]=dif_fin_rob(f,inter,ycd,rob,L2);


error1 = max(abs(y_exacta(x1)-y1))
error2 = max(abs(y_exacta(x2)-y2))
error1/error2