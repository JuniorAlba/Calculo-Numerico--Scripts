addpath("G:/Mi unidad/$Cursado actual/Calculo numerico/Scripts octave");
%% Sistemas de ecuaciones lineales - Análisis completo

% Primer sistema de ecuaciones:
% 3x + y + z = 5
% x + 3y - z = 3
% 3x + y - 5z = -1

A1 = [3  1  1;
      1  3 -1;
      3  1 -5];

b1 = [5; 3; -1];

% Segundo sistema (reordenado):
% 3x + y + z = 5
% 3x + y - 5z = -1
% x + 3y - z = 3

A2 = [3  1  1;
      3  1 -5;
      1  3 -1];

b2 = [5; -1; 3];
disp("_________MATRIZ 1_________")
disp("Solucion con gauss sin pivoteo")
x1_gauss = gauss1(A1,b1)

disp("Solucion con gauss con pivoteo")
x1_gauss_p = gauss_p(A1,b1)

disp("Solucion con gauss seidel")
[x1_gauss_seidel,it,r_h] = gauss_seidel(A1,b1,[0 0 0]',100,1e-9);
x1_gauss_seidel


disp("_________MATRIZ 2_________")
disp("Solucion con gauss sin pivoteo")
x1_gauss = gauss1(A2,b2)

disp("Solucion con gauss con pivoteo")
x1_gauss_p = gauss_p(A2,b2)

disp("Solucion con gaussseidel")
[x1_gauss_seidel,it,r_h] = gauss_seidel(A2,b2,[0 0 0]',100,1e-9);
x1_gauss_seidel

disp("radio espectral de la matriz")
T = -inv(diag(diag(A2))+tril(A2,-1))*triu(A2,1);
radio = max(abs(eig(T)))


