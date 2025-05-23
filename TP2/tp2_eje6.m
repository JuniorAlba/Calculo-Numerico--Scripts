A = [80 -50 -30 0; -50 100 -10 -25; -30 -10 65 -20; 0 -25 -20 100];
b = [-120;0;0;0];
A_equivalente_aumentada = gauss1(A,b);

%actualizamos A y b dado que gauss1 nos devuelve la matriz aumentada gauseada
b = A_equivalente_aumentada(:,end);
A = A_equivalente_aumentada(:,1:end-1);
x = sust_atras(A,b)

