b = [1 2 3]';
A1 = [8 4 1; 2 6 2; 2 4 8];
%A2 = [5.00e−02 5.57e+02 −4.00e−02 ; 1.98e+00 1.94e+02 −3.00e−03 ; 2.74e+02 3.11e+00 7.50e−02]
A2 = [5e-2 5.57e2 -4e-2; 1.98e0 1.94e2 -3e-3; 2.74e2 3.11e0 7.5e-2];
A3 = [1 2 -1;2 4 0;0 1 -1];


[L,U]=doolitle_nop(A1);
y = sust_adelante_vec(L,b);
x = sust_atras_vec(U,y);
disp("La matriz A1 tiene solucion (con factorizacion doolittle sin pivoteo): ");
x

[L,U]=doolitle_nop(A2);
y = sust_adelante_vec(L,b);
x = sust_atras_vec(U,y);
disp("La matriz A2 tiene solucion (con factorizacion doolittle sin pivoteo): ");
x

[L,U]=doolitle_nop(A3);
y = sust_adelante_vec(L,b);
x = sust_atras_vec(U,y);
disp("La matriz A3 tiene solucion (con factorizacion doolittle sin pivoteo): ");
x

%----------------------------doolittle con pivoteo------------------------------

[L,U,A,r,P]=doolitle_p(A1);
y = sust_adelante_vec(L,b);
x = sust_atras_vec(U,y);
disp("La matriz A1 tiene solucion (con factorizacion doolittle con pivoteo): ");
x

[L,U,A,r,P]=doolitle_p(A2);
y = sust_adelante_vec(L,b);
x = sust_atras_vec(U,y);
disp("La matriz A2 tiene solucion (con factorizacion doolittle con pivoteo): ");
x

[L,U,A,r,P]=doolitle_p(A3);
y = sust_adelante_vec(L,b);
x = sust_atras_vec(U,y);
disp("La matriz A3 tiene solucion (con factorizacion doolittle con pivoteo): ");
x
