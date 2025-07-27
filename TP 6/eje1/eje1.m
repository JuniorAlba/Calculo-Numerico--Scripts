clear; clc;

% -----------------------------------
% Datos del problema
% -----------------------------------
f = @(x) exp(x) - 2*x.^2 + 3*x - 1;
df = @(x) exp(x) - 4*x + 3;  % derivada exacta
f2 = @(x) exp(x) - 4;        % segunda derivada
x0 = 0;
df_exacta = df(x0);  % f'(0) = 1 + 3 = 4

% Vector de h (logarítmicamente espaciado)
h = logspace(-11, -1, 100);

% Inicializar errores
error_prog = zeros(size(h));
error_cent = zeros(size(h));

% -----------------------------------
% Incisos (a) y (c): derivación numérica
% -----------------------------------
for i = 1:length(h)
    % Derivada progresiva (2 puntos)
    df_prog = (f(x0 + h(i)) - f(x0)) / h(i);
    error_prog(i) = abs(df_exacta - df_prog);
    
    % Derivada centrada (3 puntos)
    df_cent = (f(x0 + h(i)) - f(x0 - h(i))) / (2*h(i));
    error_cent(i) = abs(df_exacta - df_cent);
end

% -----------------------------------
% Inciso (b): Verificación de cota teórica
% -----------------------------------
h0 = 0.1;
df_num = (f(x0 + h0) - f(x0)) / h0;
error_real = abs(df_exacta - df_num);

% Estimar ||f''|| en [0, 0.1]
x_vals = linspace(0, h0, 1000);
norma_f2 = max(abs(f2(x_vals)));
cota_teorica = (1/2) * norma_f2 * h0;

fprintf('--- Inciso (b) ---\n');
fprintf('h = %.2f\n', h0);
fprintf('Error real = %.6e\n', error_real);
fprintf('Cota teórica = %.6e\n', cota_teorica);


% Función auxiliar tipo ternario
function out = ternary(cond, a, b)
    if cond
        out = a;
    else
        out = b;
    end
end
fprintf('¿Cumple la cota? %s\n\n', ternary(error_real <= cota_teorica, 'Sí', 'No'));

% -----------------------------------
% Gráfico comparativo (incisos a y c)
% -----------------------------------
figure;
loglog(h, error_prog, 'r-', 'LineWidth', 2); hold on;
loglog(h, error_cent, 'b-', 'LineWidth', 2);
xlabel('h');
ylabel('Error absoluto');
title('Error de derivación numérica en función de h');
legend('Progresiva (orden 1)', 'Centrada (orden 2)', 'Location', 'best');
grid on;
