r = @(x) -20*sin(5*(x-1));
q = @(x) 0*x;
p = @(x) 0*x;
f = @(x) [p(x) q(x) r(x)];
L = 3;
inter = [0 3];
yc = 21;
rob = [1 0 0];
i = 1;
h = 0.1/i;
N = (inter(2) - inter(1))/(h);
[x,y] = dif_fin_rob(f,inter,yc,rob,N);
err = [1];
while(err(i)>5*10^(-3))
    i++;
    y_ant = y;
    h = 0.1/i;
    N = (inter(2) - inter(1))/(h);
    [x,y] = dif_fin_rob(f,inter,yc,rob,N);
    err=[err; abs(y(end)-y_ant(end))];
endwhile
err(end)
y(end)

[valor, indice_vector] = max(y);

valor %esta es la temperatura maxima
x(indice_vector) %este es el punto de la barra en el que se da la temperatura maxima
