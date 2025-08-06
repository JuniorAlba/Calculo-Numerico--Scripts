%la especie que puede sobrevivir sin la existencia de la otra es la presa
%la especie que se extinge si la otra no existe es el depresador

%de la ecuacion para x2' podemos ver que si x1=0 (sin la existencia de la presa)
%entonces x2 va a tener un decrecimiento constante y por lo tanto se va a extingir
%x2 es el depredador

%de la ecuacion de x1' podemos ver que si x2=0 entonces x1'>0 es decrecimiento
%la poblacion de x1 va a crecer, x1 es la presa

x0 = [1600 ; 800];
t0 = 0;
Tf = 24;
f = @(t,x) [x(1)*(3-0.002*x(2)) ; -x(2)*(0.5 - 0.0006*x(1))];

[t,x]=rk4(f,[t0 Tf], x0, 1000);
x1 = x(:,1);
x2 = x(:,2);

figure(1)
% Presas
plot(t,x1,'r-')
hold on
% Predadores
plot(t,x2,'b-')
grid on
grid minor

title('Evolución de las especies')
xlabel('Tiempo (Meses desde el momento inicial)')
ylabel('Cantidad de individuos')
legend('Presa=x1', 'Predador=x2')
hold off

% Curva parametrica de predador-presa
figure(2)
% diagramas de plano de fase
plot(x1,x2,'k-')
grid on
grid minor;
title('Orbita de la solución del sistema predador-presa')
xlabel('Presas (en miles)')
ylabel('Predadores (en miles)')

