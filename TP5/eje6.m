% Ejercicio 6
x = [1 2 3];
y = [0 4 22/3];
[a,b,c,d] = cubic_spline_clamped(x,y,3,3);
p = x;
S = @(x) a(1)*(x==p(1));
for i=2:length(p)
    S = @(x) S(x) + ...
    polyval([d(i-1) c(i-1) b(i-1) a(i-1)], (x - p(i-1))).*(x>p(i-1)).*(x<=p(i));
endfor


%para graficar
xx = linspace(1,3,100);
figure(1);
hold on;
plot(xx,S(xx),'k-','linewidth',3)
grid on
grid minor

%recordar que spline_clamped(x,y,0,0) != spline_natural(x,y)
% ya que el spline clamped impone a las primeras derivadas de los extremos que sean 0
%mientras que spline natural impone que las segundas derivadas de los extremos sean 0