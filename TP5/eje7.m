x1_pe = [0 2 6];
t1_pe = [0 1 2];
x1_se = [6 3 0];
t1_se = [2 3 5];
[a b c d] = cubic_spline_clamped(t1_pe,x1_pe,0,0);

S1_pe = @(t) a(1).*(t==t1_pe(1));
for i = 1:length(t1_pe)-1
    S1_pe = @(t) S1_pe(t) + polyval([d(i) c(i) b(i) a(i)], (t-t1_pe(i))).*(t>t1_pe(i) & t<=t1_pe(i+1));
end

[a b c d] = cubic_spline_clamped(t1_se,x1_se,0,0);
S1_se = @(t) a(1).*(t==t1_se(1));
for i = 1:length(t1_se)-1
    S1_se = @(t) S1_se(t) + polyval([d(i) c(i) b(i) a(i)], (t-t1_se(i))).*(t>t1_se(i) & t<=t1_se(i+1));
end
figure(1);
hold on;
tt1_pe = linspace(0, 2, 100);
tt1_se = linspace(2, 4, 100);
plot(tt1_pe, S1_pe(tt1_pe), 'r-', 'LineWidth', 2);
plot(tt1_se, S1_se(tt1_se), 'b-', 'LineWidth', 2);
hold off;


%GRAFICO 2

y2_pe = [0 4 6];
t2_pe = [0 1 2];

y2_se = [6 2 0];
t2_se = [2 3 4];
[a b c d] = cubic_spline_clamped(t2_pe,y2_pe,0,0);

S2_pe = @(t) a(1).*(t==t2_pe(1));
for i = 1:length(t2_pe)-1
    S2_pe = @(t) S2_pe(t) + polyval([d(i) c(i) b(i) a(i)], (t-t2_pe(i))).*(t>t2_pe(i) & t<=t2_pe(i+1));
end

[a b c d] = cubic_spline_clamped(t2_se,y2_se,0,0);
S2_se = @(t) a(1).*(t==t2_se(1));
for i = 1:length(t2_se)-1
    S2_se = @(t) S2_se(t) + polyval([d(i) c(i) b(i) a(i)], (t-t2_se(i))).*(t>t2_se(i) & t<=t2_se(i+1));
end
figure(2);
hold on;
tt2_pe = linspace(0, 2, 100);
tt2_se = linspace(2, 4, 100);
plot(tt2_pe, S2_pe(tt2_pe), 'r-', 'LineWidth', 2);
plot(tt2_se, S2_se(tt2_se), 'b-', 'LineWidth', 2);
hold off;




%GRAFICO 3
%{ Por lo que vi en el video, si utilizo spline cubico sujeto (como creo que deberia ser) entonces mi grafica
no se asemeja para nada a la del profesor, en cambio, si utilizo spline cubico natural, la grafica se asemeja a la
del profesor. Por lo tanto decidi dejar el spline cubico natural hasta cerrar esa duda.
 %}
x3_pe = [0 2 6];
y3_pe = [0 4 6];
x3_se = [0 3 6];
y3_se = [0 2 6];
[a b c d] = cubic_spline_natural(x3_pe,y3_pe);

S3_pe = @(x) a(1).*(x==x3_pe(1));
for i = 1:length(x3_pe)-1
    S3_pe = @(x) S3_pe(x) + polyval([d(i) c(i) b(i) a(i)], (x-x3_pe(i))).*(x>x3_pe(i) & x<=x3_pe(i+1));
end

[a b c d] = cubic_spline_natural(x3_se,y3_se);
S3_se = @(x) a(1).*(x==x3_se(1));
for i = 1:length(x3_se)-1
    S3_se = @(x) S3_se(x) + polyval([d(i) c(i) b(i) a(i)], (x-x3_se(i))).*(x>x3_se(i) & x<=x3_se(i+1));
end
figure(3);
hold on;
xx3 = linspace(0, 6, 200);
plot(xx3, S3_pe(xx3), 'r-', 'LineWidth', 2);
plot(xx3, S3_se(xx3), 'b-', 'LineWidth', 2);
hold off;
