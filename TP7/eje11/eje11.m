y_exacta = @(t) (7/4).*t + (1/2).*t.^3.*log(t) - (3/4).*t.^3;
x0 = [1 ; 0];
a=1;
b=2;
f = @(t,x) [x(2); (2/t)*x(2) - (2/t^2)*x(1) + t*log(t)];
sol=y_exacta(2)

for i=1:3
   
    N = (b-a)/(0.2^i);
     if i==2
        h=0.05;
        N=(b-a)/h;
    endif
    t_p =linspace(a,b,N+1);
   
    x=AdamsBashfortMoulton(f,t_p,x0);
    x1 = x(:,1); %este metodo te devuelve la solucion en forma de vector columna, no fila como los anteriores
    x2 = x(:,2);
    err_max = max(abs(x1 - y_exacta(t_p)'));
    x1(end)
    fprintf('el error mas grande para el paso %g es de %e \n',0.2^i,err_max);
endfor