addpath("G:/Mi unidad/$Cursado actual/Calculo numerico/Scripts octave/clase tp3");
addpath("G:/Mi unidad/$Cursado actual/Calculo numerico/Scripts octave");
Nh = 99;
x = ones(Nh+1,1);
col=[1*x -4*x 6*x -4*x 1*x];
A = spdiags(col,[-2 -1 0 1 2],Nh+1,Nh+1);
A(1,1)=1;
A(1,2)=0;
A(1,3)=0;
A(2,1)=0;
A(2,2)=1;
A(2,3)=0;
A(2,4)=0;
A(Nh,Nh+1)=0;
A(Nh,Nh)=1;
A(Nh,Nh-1)=0;
A(Nh,Nh-2)=0;
A(Nh+1,Nh+1)=1;
A(Nh+1,Nh)=0;
A(Nh+1,Nh-1)=0;
A= full(A);

L=5;
h = L/Nh;
w = 0.07;
s = 0.14;
P = 1.0326e+4;
E =  210e+3;
J = (w*s^3)/12;
b = ((h^4*P)/(E*J))*ones(96,1,1);
%b(1)=0;
%b(2)=0;
%b(Nh)=0;
%b(Nh+1)=0;

A = A(3:end-2,3:end-2);
tol = 1e-8;
disp("-------METODO DE GAUSS-------")
id=tic;
[A1,x] = gauss1(A,b);
toc(id)
disp("norm(A*xk-b, inf)")
residuo = norm(A*x-b,inf)


disp("-------METODO DE GAUSS PIVOTEO-------")
id=tic;
[A1,x] = gauss_p(A,b);
toc(id)
disp("norm(A*xk-b, inf)")
residuo = norm(A*x-b,inf)

disp("-------METODO DE JACOBBI-------")

x0 = linspace(1,1,96);
id=tic;
[x,it,r_h]=jacobbi(A,b,x0',1000,tol);
toc(id)
disp("norm(A*xk-b, inf)")
residuo = norm(A*x-b,inf)

disp("-------METODO DE GAUSS SEIDEL-------")
id=tic;
[x,it,r_h]=gauss_seidel(A,b,x0',1000,tol);
toc(id)
disp("norm(A*xk-b, inf)")
residuo = norm(A*x-b,inf)

disp("-------METODO DE SOR-------")
[w] = wOptimo(A,b,x0',1e-8,1000)
%w = 0.1;
%id=tic;
%[x,it,r_h]=SOR(A,b,x0',1000,tol,w);
%toc(id)
%disp("norm(A*xk-b, inf)")
%residuo = norm(A*x-b,inf)




