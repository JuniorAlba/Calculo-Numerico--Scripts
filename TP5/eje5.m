f = @(x) sin(2*pi.*x);
x = linspace(-1,1,21);
xx = linspace(-1,1,201);
y = f(x(1:21));
%tambien es posible encontrar el poly de lagrange utilizando polyfit con grad=20
%Es posible gracias al teorema de existencia y unicidad
[P] = PolyLagrange(x,y);
[a,b,c,d] = cubic_spline_natural(x,y);

y_LAG = polyval(P,xx);

figure(1);
hold on;
plot(xx,f(xx),'r-','linewidth',6);
plot(xx,y_LAG,'g-','linewidth',5)


n = length(a);
xd = x;
M = [d c b a];
S = @(x) a(1)*(x == xd (1));
for i=1:n
 S = @(x) S(x) + ...
 polyval(M(i,:), (x - xd(i))).*(x>xd(i)).*(x<=xd(i+1));
end

% Grafica de la función Spline Cúbica Natural
% Grafica de la función Spline Cúbica Natural
plot(xx,S(xx),'k-','linewidth',3)
plot([-1,1],[0,0],'m-')
grid on
grid minor
xlabel('Datos X')
ylabel('Funcion (f(x))')
title('Métodos de Interpolación')

le1=sprintf('Valores dados a interpolar:');
le2=sprintf('Polinomio de Lagrange grado: ',20);
le3=sprintf('Spline Cubica de los datos:');
le4=sprintf('Linea del cero:');


legend(le1,le2,le3,le4)



display("Ahora con datos perturbados")




