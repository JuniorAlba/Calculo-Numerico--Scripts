addpath("G:/Mi unidad/$Cursado actual/Calculo numerico/Scripts octave/clase tp3");
A = zeros(1000,1000);
x = linspace(1,1000,1000);
d1 = diag(2*x);
%elementos de la estrictamente diagonal superior
d2 = diag(0.5*x(1:end-2),2);
d3 = diag(0.25*x(1:end-4),4);
%elementos de la estrictamente diagonal inferior
d4 = diag(0.5*x(3:end),-2);
d5 = diag(0.25*x(5:end),-4);
A = A + d1 + d2 + d3 + d4 + d5;

x = linspace(1,1,1000);
b = pi*(x');


disp("-------METODO DE JACOBBI-------")

x0 = linspace(1,1,1000);
id=tic;
[x,it,r_h]=jacobbi(A,b,x0',1000,1e-5);
toc(id)
figure(1);
hold on;
semilogy(1:1:it,r_h,'-r');

disp("norm(A*xk-b, inf)")
residuo = norm(A*x-b,inf)

disp("-------METODO DE GAUSS SEIDEL-------")
id=tic;
[x,it,r_h]=gauss_seidel(A,b,x0',1000,1e-5);
toc(id)

semilogy(1:1:it,r_h,'-b');


disp("norm(A*xk-b, inf)")
residuo = norm(A*x-b,inf)

disp("-------METODO DE SOR-------")
%[w] = wOptimo(A,b,x0',1e-5,1000)
w = 0.9545;
id=tic;
[x,it,r_h]=SOR(A,b,x0',1000,1e-5,w);
toc(id)

disp("norm(A*xk-b, inf)")
residuo = norm(A*x-b,inf)
semilogy(1:1:it,r_h,'-g');



