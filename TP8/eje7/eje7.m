D=0.2;
W1=2;
L1=4;
L=6;
k=2.04;
H= 6*10^(-3);
Ue=40;
Uw=200;

coef_izq = @(x) H/k*(2*W1/L*(L-x)+2*D);
coef_der = @(x) D*W1/L*(L - x);
p = @(x) D*W1/L*1./coef_der(x);
q= @(x) coef_izq(x)./coef_der(x);
r = @(x) -1*Ue*coef_izq(x)./coef_der(x);
f = @(x) [p(x) q(x) r(x)];
ycd = Uw;
rob = [-k -H -Ue*H];
inter =[0 L1];

h=0.1;
tol=1e-4;
N=(inter(2)-inter(1))/h;
[x,y]=dif_fin_rob(f,inter,ycd,rob,N);
y_ant=y;
i=1;
err = [1];
while(err(i)>=tol)
    y_ant=y;
    i++;
    h=0.1/i;
    N=round((inter(2)-inter(1))/h);
    [x,y]=dif_fin_rob(f,inter,ycd,rob,N);
    err = [err; abs(y(end)-y_ant(end))];
endwhile
plot(x,y,'r-')
y(end)
err(end)


flujo = -1*k*coef_der(0)/(x(2)-x(1))*(y(2)-Uw)