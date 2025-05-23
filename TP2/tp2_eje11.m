A = [1 1+0.5e-15 3; 2 2 20; 3 6 4];
[L1,U1] = doolitle_nop(A);
[L2,U2,A,r,P] = doolitle_p(A);
disp("A-L1*U1");disp(A-L1*U1);
disp("P*A-L2*U2");disp(P*A-L2*U2);
%Al termino P*A-LU y A-LU le voy a denominar error residual de la factorizacion doolitle

% Los resultados obtenidos se deben a que el problema podria estar mal condicionado:
% La primer columna es casi indistinguible de la segunda, por lo tanto, el
% determinante de la matriz A es muy cercano a 0
% Aun asi podemos observar que el error residual de usar factorizacion doolitle
% sin pivoteo es mayor que hacerlo con pivoteo, esto se debe a que, utilizando
% factorizacion con pivoteo evitamos realizar operaciones aritmeticas sobre las otras
% filas con la fila 1, por lo cual, el error no se propaga.
