% Ejercicio 6
x = [1 2 3];
y = [0 4 22/3];
[a,b,c,d] = cubic_spline_clamped(x,y,3,3);
p = x;
S = @(x) a(1)*(x==p(1));
for i=1:length(p)-1
    S = @(x) S(x) + polyval([d(i) c(i) b(i) a(i)], (x - p(i))).*(x>p(i)).*(x<=p(i+1));
endfor


%para graficar
xx = linspace(1,3,100);
figure(1);
hold on;
plot(xx,S(xx),'k-','linewidth',3)
grid on
grid minor

a1=a
b1=b
c1=c
d1=d

%recordar que spline_clamped(x,y,0,0) != spline_natural(x,y)
% ya que el spline clamped impone a las primeras derivadas de los extremos que sean 0
%mientras que spline natural impone que las segundas derivadas de los extremos sean 0