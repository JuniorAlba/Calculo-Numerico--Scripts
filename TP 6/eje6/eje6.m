% Script para probar trapcomp con datos equiespaciados y no equiespaciados

% --------------------------
% Función original
f = @(x) sin(x);
a = 0;
b = pi;

% --------------------------
% Conjunto 1: Equiespaciado
x1 = linspace(a, b, 5);
y1 = f(x1);
I1 = trapcomp(x1, y1);

% --------------------------
% Conjunto 2: No equiespaciado
x2 = [0, 0.3, 1.1, 2.0, pi];
y2 = f(x2);
I2 = trapcomp(x2, y2);

% --------------------------
% Valor exacto
I_exacta = integral(f, a, b);

% --------------------------
% Resultados
fprintf('--- Comparación de resultados ---\n');
fprintf('Integral exacta   : %.8f\n', I_exacta);
fprintf('Equiespaciado     : %.8f (error = %.2e)\n', I1, abs(I1 - I_exacta));
fprintf('No equiespaciado  : %.8f (error = %.2e)\n', I2, abs(I2 - I_exacta));

% --------------------------
% Gráfica
figure;
fplot(f, [a b], 'k', 'LineWidth', 1.5); hold on;
plot(x1, y1, 'bo-', 'MarkerFaceColor', 'b', 'DisplayName', 'Equiespaciado');
plot(x2, y2, 'rs--', 'MarkerFaceColor', 'r', 'DisplayName', 'No equiespaciado');
legend('f(x)', 'Equiespaciado', 'No equiespaciado');
title('Evaluación de la regla del trapecio compuesta');
xlabel('x'); ylabel('f(x)');
grid on;

f = @(x) sin(x);
a = 0;
b = pi;

% Generar 5 puntos equiespaciados (n impar)
x = linspace(a, b, 5);  % [0, π/4, π/2, 3π/4, π]
y = f(x);

% Aplicar regla de Simpson compuesta
I_aprox = simpsoncomp(x, y);

% Comparar con el valor exacto
I_exacta = integral(f, a, b);
error = abs(I_aprox - I_exacta);

% Mostrar resultados
fprintf('--- Prueba Simpson Comp ---\n');
fprintf('Integral exacta   : %.8f\n', I_exacta);
fprintf('Aproximación      : %.8f\n', I_aprox);
fprintf('Error absoluto    : %.2e\n', error);

% Graficar
figure;
fplot(f, [a b], 'k', 'LineWidth', 1.5); hold on;
plot(x, y, 'bo-', 'MarkerFaceColor', 'b');
title('Evaluación con regla de Simpson compuesta');
xlabel('x'); ylabel('f(x)');
legend('f(x)', 'Nodos Simpson');
grid on;