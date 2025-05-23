addpath("G:/Mi unidad/$Cursado actual/Calculo numerico/Scripts octave/Tp4");
g1 = @(x) 0.5*(10-x.^3).^(0.5);
g2 = @(x) (10/(4+x))^(1/2);
p0=1.5;
tol=1e-3
a =1;
b =2;
[x, rh, it]=Puntofijo(g1,p0,500,tol);
x
it
rh(it)
[x, rh, it]=Puntofijo(g2,p0,500,tol);
x
it
rh(it)

pkg load symbolic
syms x
%g1 = (1/2)*(10-x^3)^(1/2);
%g2 = (10/(4+x))^(1/2);

g1 = (1/2)*sqrt(10 - x^3);       % Usar 1/2 en lugar de 0.5 y sqrt() en lugar de ^0.5
g2 = sqrt(10/(4 + x));           % Usar sqrt() en lugar de ^(1/2)

dg1=diff(g1,x);
dg2 = diff(g2,x);
disp('Derivada de g1(x):');
pretty(dg1)

disp('Derivada de g2(x):');
pretty(dg2)

% Evaluar en puntos del intervalo [1,2]
x_val = linspace(1, 2, 5);  % cinco puntos entre 1 y 2
dg1_vals = double(subs(dg1, x, x_val));
dg2_vals = double(subs(dg2, x, x_val));

display("------------")

pkg load symbolic
syms x

% Definir las funciones con notación simbólica (evitar decimales)
g1 = (1/2)*sqrt(10 - x^3);       % Usar 1/2 en lugar de 0.5 y sqrt() en lugar de ^0.5
g2 = sqrt(10/(4 + x));           % Usar sqrt() en lugar de ^(1/2)

% Derivadas (el resto del código se mantiene igual)
dg1 = diff(g1, x);
dg2 = diff(g2, x);


% Evaluar en puntos del intervalo [1,2]
x_val = linspace(1, 2, 5);
dg1_vals = double(subs(dg1, x, x_val));
dg2_vals = double(subs(dg2, x, x_val));

disp('Valores de g1''(x) en [1,2]:');
disp(dg1_vals)

disp('Valores de g2''(x) en [1,2]:');
disp(dg2_vals)

%se puede ver que ambas derivadas toman valores menores que 1 en cercanias de p
%c)
%las cotas dadas por el colorario 2.4 no son aplicables a g1 en el intervalo [1,2]
%pero si sin aplicables a g2 en el intervalo


%el error con respecto a la solucion exacta deberia ser menor o igual a:
%k es aproximadamente 0.2 debido a que el valor abs de la primera derivada de
%g2 en [1,2] es siempre menor a 0.2
k=0.2;
k^(it)*max(p0-a,b-p0)
