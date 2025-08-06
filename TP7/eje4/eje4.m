f = @(t,y) t*e.^(3*t)-2*y;
y_sol = @(t) t*e^(3*t)/5 - e^(3*t)/25 + e^(-2*t)/25;
y0=0;
a=0;
b=1;
dfdy= @(t,y) t*0 + y*0 - 2;
sol = y_sol(1);
fprintf('resultado exacto %g \n',y_sol(1));
fprintf('Vamos a ver los errores absolutos de las aproximaciones (en el punto y(1) donde se acumula el error) \n' );
fprintf('%10s|%10s|%10s|%10s|%10s|%10s \n','CN_newton','Back_euler','forward_eu','CN_error','B_eu_error','F_eu_error');
for i=0:2
    h=0.2/(2^(i));
    N = (b-a)/h;
    [t1,y1] = CN_newton(f,dfdy,a,b,y0,N);
    [t2,y2] = back_euler(f,dfdy,a,b,y0,N);
    [t3,y3] = euler(f,[a b],y0,N);
    error_abs_CN = abs(sol - y1(end));
    error_abs_Beuler = abs(sol-y2(end));
    error_abs_Feuler = abs(sol - y3(end));
    fprintf('%10g|%10g|%10g|%10g|%10g|%10g \n',y1(end),y2(end),y3(end),error_abs_CN,error_abs_Beuler,error_abs_Feuler);
endfor

fprintf('El metodo CN es de O(h^2) debido a que cuando se redujo el h a la mitad el error se redujo 4 veces el valor anterior')
fprintf('Para los metodos de back_euler y forward_euler son de O(h) debido a que cuando el h se redujo a la mitad el error se redujo a la mitad')
fprintf('Estos comportamientos coinciden con la teoria')