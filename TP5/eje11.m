%V(t) = c1*sin(2*t) + c2*t^2  + c3*2^t + c4
% se mide la velocidad cada 12 minutos durante 5 horas
y = (load('datos de velocidades.txt'));
for i=0:25
    t(i+1) = i*12/60;
end
t = t';
f1 = @(t) sin(2.*t);
f2 = @(t) t.^2;
f3 = @(t) 2.^t;
A = [f1(t) f2(t) f3(t) ones(26,1)];
At = A';
%Tengo que resolver el sistema At*A*a = At*y donde a es el vector de coeficientes
R = At*A;
b = At*y;
a = R\b;
f = @(t) a(1)*f1(t) + a(2)*f2(t) + a(3)*f3(t) + a(4);
%Ahora tengo que graficar la función
figure(1);
hold on;
plot(t,y,'ko','linewidth',2);
xx=linspace(0,6,300);
plot(xx,f(xx),'r-');
f(6);

[P] = polyfit(t,y,6);
polyval(P,6)
plot(xx,polyval(P,xx),'b-');


Ecuad_f = norm(y-f(t),2)^2
Ecuad_P = norm(y-polyval(P,t),2)^2

%El error cuadratico del polinomio de grado 6 es mucho mayor que el de la funcion, por lo que la funcion es la que mejor se ajusta a los datos dentro del intervalo
%pero fuera el polinomio se comporta distinto, por lo que la funcion se ajusta mejor para extrapolar
%los datos.
f(6)