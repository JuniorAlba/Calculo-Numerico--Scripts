clear; clc;
f = @(x) exp(x) - 2*x.^2 + 3*x -1;
df = @(x) exp(x) -4*x + 3;
ddf = @(x) exp(x) -4*x;
x0 = 0;
df_exacta = df(x0);
h = 10.^(-11:-1);

for i =1:length(h)
    df_two_points = (f(x0 +h(i)) - f(x0)) / h(i);
    error_two_points(i) = abs(df_exacta - df_two_points);
    df_three_points = (f(x0 + h(i)) - f(x0 - h(i)))/ (2*h(i));
    error_three_points(i) = abs(df_exacta - df_three_points);
end
figure;
loglog(h,error_two_points, 'r-', 'LineWidth', 2);
hold on;
loglog(h,error_three_points, 'b-', 'LineWidth', 2);
xlabel('h');
ylabel('Error absoluto');
grid on;
title('Error de derivación numérica en función de h');
%se puede ver que hay un punto minimo en cada grafica que no corresponde con
%el h minimo, esto se debe a que apartir de un punto el error de truncamiento 
%llega a un minimo y comienza a dominar el error de redondeo que crece a medida 
%que h decrece.

%Inciso b
%me piden la norma infinito los valores que toma la segunda derivada
%en un intervalo cercano al punto de derivacion, etnonces
x_vals = linspace(0, 0.1, 1000);
norma_f2 = max(abs(ddf(x_vals)));
h0 = 0.1;
cota_teorica = (1/2)* norma_f2 *h0
df_num = (f(x0 + h0) - f(x0)) / h0;
error_real = abs(df_exacta - df_num)
%cota_teorica = 0.050000
%error_real = 0.1483
%vemos que se cumple