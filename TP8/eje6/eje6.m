K0 = 0.9;
L=5;
r = @(x) -5/K0*x.*(5-x);
q = @(x) 1/K0*(1.05.*x+2);
p = @(x) 0*x;
f = @(x) [p(x) q(x) r(x)];
ycd = 6;
inter = [0 5];
rob = [-0.9 -15 -60];
tol = 5*10^(-5);
h=0.1;
N = (inter(2)-inter(1))/h;
[x,y] = dif_fin_rob(f,inter,ycd,rob,N);
err = [1];
i=1;
mid_y=1;
mid_yant=1;
y_ant=y;
while(err(i)>=tol)
    y_ant = y;
    i++;
    h = 0.1/i;
    N = (inter(2)-inter(1))/h
    [x,y] = dif_fin_rob(f,inter,ycd,rob,N);
    mid_yant = round(length(y_ant)/2);
    mid_y = round(length(y)/2);
    err = [err; abs(y(mid_y)-y_ant(mid_yant))];
endwhile
err(end)
y(mid_y)
y_ant(mid_yant)