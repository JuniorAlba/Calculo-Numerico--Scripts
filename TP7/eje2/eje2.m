inter = [0 2];
f = @(t,y) -y + sin(t) + cos(t);
y0 = 0;
y_result = @(t) sin(t);
y_result_2 = y_result(2);
fprintf('resultado exacto: %g \n',y_result(2));
fprintf('%10s|%10s|%10s|%10s|%10s|%12s|%12s|%12s\n','h','L','Euler','rk2','rk4','errorEULER','errorRK2','errorRK4')
for i=0:1:5
    L = 10*2^(i);
    h = (inter(2)-inter(1))/L;
    [t1,r1]=euler(f,inter,y0,L);
    [t2,r2]=rk2(f,inter,y0,L);
    [t3,r3]=rk4(f,inter,y0,L);
    rr1 = r1(end,end);
    rr2 = r2(end,end);
    rr3 = r3(end,end);
    error_euler = abs(rr1-y_result_2);
    error_rk2 = abs(rr2-y_result_2);
    error_rk4 = abs(rr3-y_result_2);
    fprintf('%10g|%10g|%10g|%10g|%10g|%10e|%10e|%10e\n',h,L,rr1,rr2,rr3,error_euler,error_rk2,error_rk4);

endfor
%euler en cada paso realiza una evaluacion de la funcion f
%rk2 en cada paso realiza 2 evaluaciones de la funcion f
%rk4 en cada paso realiza 4 evaluaciones de la funcion f
%la cantidad de pasos que realizan es L+1, no contamos el primer paso por que toma como aproximacion 
%la condicion inicial (no realiza ninguna evaluacion de funcion)

%para tener 3 decimales correctos el error entre la aproximacion y la solucion exacta deberia ser menor a 5x10^(-4)
%para tener 6 decimales correctos el error entre la aproximacion y la solucion exacta deberia ser menor a 5x10^(-7)

%para n cifras significativas el error absoluto debe ser de 5x10^(-n) pero n cifras significativas nos dice que en la 
%n-esima cifra de la aproximacion difiere del valor de la solucion exacta, es decir, tiene n-1 cifras correctas

%para el metodo de euler
fprintf('Con los valores de h probados, Euler no alcanza 3 cifras correctas. Esto muestra su bajo orden de convergencia., llega a realiza 320 evaluacion de funcion\n');

%para el metodo RK2
fprintf('La aproximacion con el metodo de RK2 llega a las 3 cifras correctas con 160(80*2) evaluaciones de funcion\n');
fprintf('La aproximacion con el metodo de RK2 no llega a las 6 cifras correctas, llega a realizar 640(320*2) evaluaciones de funcion\n');

%para el metodo RK4
fprintf('La aproximacion con el metodo de RK4 llega a las 3 cifras correctas con 40(10*4) evaluaciones de funcion\n');
fprintf('La aproximacion con el metodo de RK4 llega a las 6 cifras correctas con 160(40*4) evaluaciones de funcion\n');
