% Script para generar tablas de integración numérica
% Ejercicio 5 - TP6
% Compara regla de los trapecios vs regla de Simpson

% Función 1: f(x) = sin(πx) en [0,5]
f1 = @(x) sin(pi*x);
a1 = 0;
b1 = 5;
v_exact1 = integral(f1, a1, b1);

% Función 2: f(x) = 1/(1+x²) en [-5,5]
f2 = @(x) 1./(1+x.^2);
a2 = -5;
b2 = 5;
v_exact2 = integral(f2, a2, b2);

% Función 3: f(x) = |x|^(3/2) en [0,5]
f3 = @(x) abs(x).^(3/2);
a3 = 0;
b3 = 5;
v_exact3 = integral(f3, a3, b3);

% ========== TABLA PARA FUNCIÓN 1 ==========
fprintf('\n=====================================================================================================\n');
fprintf('TABLA PARA f(x) = sin(πx) en [0,5]\n');
fprintf('Valor exacto: %.10f\n', v_exact1);
fprintf('=====================================================================================================\n');
fprintf('|   h   |  L  |     Regla de los trapecios     |     Regla de Simpson      |          Cocientes      |\n');
fprintf('|       |     |   Q_L^t(f,0,5)   |   E_L^trap  |   Q_L^s(f,0,5)  | E_L^simp | E_L^trap/E_L/2^trap | E_L^simp/E_L/2^simp |\n');
fprintf('|-------|-----|------------------|-------------|-----------------|----------|---------------------|-----------------|\n');

E_trap1 = [];
E_sim1 = [];
E_cociente_trap1 = [];
E_cociente_sim1 = [];

for i = 1:12
    L = 2^i;
    h = (b1-a1)/L;
    
    % Calcular aproximaciones
    Q1_trap = intNCcompuesta(f1, a1, b1, L, 2);
    Q1_simp = intNCcompuesta(f1, a1, b1, L, 3);
    
    % Calcular errores
    E_trap1 = [E_trap1, abs(Q1_trap - v_exact1)];
    E_sim1 = [E_sim1, abs(Q1_simp - v_exact1)];
    
    % Calcular cocientes de errores
    if (i >= 2)
        E_cociente_trap1 = [E_cociente_trap1, E_trap1(i)/E_trap1(i-1)];
        E_cociente_sim1 = [E_cociente_sim1, E_sim1(i)/E_sim1(i-1)];
    endif
    
    % Mostrar fila de la tabla
    if i == 1
        fprintf('| 1/%-3d | %-3d | %14.10f | %9.2e | %14.10f | %8.2e |        -        |        -        |\n', ...
                L, L, Q1_trap, E_trap1(i), Q1_simp, E_sim1(i));
    else
        fprintf('| 1/%-3d | %-3d | %14.10f | %9.2e | %14.10f | %8.2e |      %.4f       |      %.4f       |\n', ...
                L, L, Q1_trap, E_trap1(i), Q1_simp, E_sim1(i), E_cociente_trap1(i-1), E_cociente_sim1(i-1));
    endif
endfor

% ========== TABLA PARA FUNCIÓN 2 ==========
fprintf('\n=====================================================================================================\n');
fprintf('TABLA PARA f(x) = 1/(1+x²) en [-5,5]\n');
fprintf('Valor exacto: %.10f\n', v_exact2);
fprintf('=====================================================================================================\n');
fprintf('|   h   |  L  |     Regla de los trapecios     |     Regla de Simpson      |          Cocientes      |\n');
fprintf('|       |     |   Q_L^t(f,-5,5)  |   E_L^trap  |   Q_L^s(f,-5,5) | E_L^simp | E_L^trap/E_L/2^trap | E_L^simp/E_L/2^simp |\n');
fprintf('|-------|-----|------------------|-------------|-----------------|----------|---------------------|-----------------|\n');

E_trap2 = [];
E_sim2 = [];
E_cociente_trap2 = [];
E_cociente_sim2 = [];

for i = 1:12
    L = 2^i;
    h = (b2-a2)/L;
    
    % Calcular aproximaciones
    Q2_trap = intNCcompuesta(f2, a2, b2, L, 2);
    Q2_simp = intNCcompuesta(f2, a2, b2, L, 3);
    
    % Calcular errores
    E_trap2 = [E_trap2, abs(Q2_trap - v_exact2)];
    E_sim2 = [E_sim2, abs(Q2_simp - v_exact2)];
    
    % Calcular cocientes de errores
    if (i >= 2)
        E_cociente_trap2 = [E_cociente_trap2, E_trap2(i)/E_trap2(i-1)];
        E_cociente_sim2 = [E_cociente_sim2, E_sim2(i)/E_sim2(i-1)];
    endif
    
    % Mostrar fila de la tabla
    if i == 1
        fprintf('| 1/%-3d | %-3d | %14.10f | %9.2e | %14.10f | %8.2e |        -        |        -        |\n', ...
                L, L, Q2_trap, E_trap2(i), Q2_simp, E_sim2(i));
    else
        fprintf('| 1/%-3d | %-3d | %14.10f | %9.2e | %14.10f | %8.2e |      %.4f       |      %.4f       |\n', ...
                L, L, Q2_trap, E_trap2(i), Q2_simp, E_sim2(i), E_cociente_trap2(i-1), E_cociente_sim2(i-1));
    endif
endfor


% ========== TABLA PARA FUNCIÓN 3 ==========
fprintf('\n=====================================================================================================\n');
fprintf('TABLA PARA f(x) = |x|^(3/2) en [0,5]\n');
fprintf('Valor exacto: %.10f\n', v_exact3);
fprintf('=====================================================================================================\n');
fprintf('|   h   |  L  |     Regla de los trapecios     |     Regla de Simpson      |          Cocientes      |\n');
fprintf('|       |     |   Q_L^t(f,0,5)   |   E_L^trap  |   Q_L^s(f,0,5)  | E_L^simp | E_L^trap/E_L/2^trap | E_L^simp/E_L/2^simp |\n');
fprintf('|-------|-----|------------------|-------------|-----------------|----------|---------------------|-----------------|\n');

E_trap3 = [];
E_sim3 = [];
E_cociente_trap3 = [];
E_cociente_sim3 = [];

for i = 1:12
    L = 2^i;
    h = (b3-a3)/L;
    
    % Calcular aproximaciones
    Q3_trap = intNCcompuesta(f3, a3, b3, L, 2);
    Q3_simp = intNCcompuesta(f3, a3, b3, L, 3);
    
    % Calcular errores
    E_trap3 = [E_trap3, abs(Q3_trap - v_exact3)];
    E_sim3 = [E_sim3, abs(Q3_simp - v_exact3)];
    
    % Calcular cocientes de errores
    if (i >= 2)
        E_cociente_trap3 = [E_cociente_trap3, E_trap3(i)/E_trap3(i-1)];
        E_cociente_sim3 = [E_cociente_sim3, E_sim3(i)/E_sim3(i-1)];
    endif
    
    % Mostrar fila de la tabla
    if i == 1
        fprintf('| 1/%-3d | %-3d | %14.10f | %9.2e | %14.10f | %8.2e |        -        |        -        |\n', ...
                L, L, Q3_trap, E_trap3(i), Q3_simp, E_sim3(i));
    else
        fprintf('| 1/%-3d | %-3d | %14.10f | %9.2e | %14.10f | %8.2e |      %.4f       |      %.4f       |\n', ...
                L, L, Q3_trap, E_trap3(i), Q3_simp, E_sim3(i), E_cociente_trap3(i-1), E_cociente_sim3(i-1));
    endif
endfor


% ========== ANÁLISIS DE CONVERGENCIA ==========
fprintf('==================================================================\n');
fprintf('ANÁLISIS DE CONVERGENCIA\n');
fprintf('==================================================================\n');
fprintf('Los cocientes de errores consecutivos muestran:\n');
fprintf('- Regla de trapecios: convergencia de orden O(h²)\n');
fprintf('- Regla de Simpson: convergencia de orden O(h⁴)\n');
fprintf('\nCocientes esperados:\n');
fprintf('- Trapecios: aproximadamente 0.25 (= 1/4 = 1/2²)\n');
fprintf('- Simpson: aproximadamente 0.0625 (= 1/16 = 1/2⁴)\n');
fprintf('==================================================================\n');
fprintf('Observaciones:\n');
fprintf('---PRIMER FUNCION---\n');
fprintf('con la regla del trapecio se necesitarian mas de 4096 subintervalos para obtener 7 cifras significativas (y por lo tanto mas de 4097 evaluaciones de la funcion).\n');
fprintf('con la regla de simpson se necesitan 128 subintervalos para obtener 7 cifras significativas (y por lo tanto 129 evaluaciones de la funcion).\n');
fprintf('---SEGUNDO FUNCION---\n');
fprintf('con la regla del trapecio se necesitan 1024 subintervalos para obtener 7 cifras significativas (y por lo tanto 1025 evaluaciones de la funcion).\n');
fprintf('con la regla de simpson se necesitan 32 subintervalos para obtener 7 cifras significativas (y por lo tanto 33 evaluaciones de la funcion).\n');
fprintf('---TERCER FUNCION---\n');
fprintf('con la regla del trapecio se necesitan 4096 subintervalos para obtener 7 cifras significativas (y por lo tanto 4097 evaluaciones de la funcion).\n');
fprintf('con la regla de simpson se necesitan 256 subintervalos para obtener 7 cifras significativas (y por lo tanto 257 evaluaciones de la funcion).\n');