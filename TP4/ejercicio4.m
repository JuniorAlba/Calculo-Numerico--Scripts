clear all; clc;
addpath('G:/Mi unidad/$Cursado actual/Calculo numerico/Scripts octave')
tol = 1e-10;
kmax = 1000;
f = @(x) cos(1+x.^2) + sin(x) -1;
df = @(x) -1*sin(1+x.^2)*2 .* x+cos(x);
y = @(x) 0*x;
x = linspace(0,5,100);
figure(1);
hold on;
plot(x,y(x),'b-');
plot(x,f(x),'r-');
plot(x,df(x),'g-');
#viendo las graficas podemos observar que la funcion tiene raices positivas en
#los intervalos entre [1,2] y [2,2.75]


#display("------------")
#x_val = x;
#pkg load symbolic
#syms x1
#f = cos(1+x1^2) + sin(x1) -1;
#df = diff(f,x1);
#x_syms_vals = arrayfun(@(v) sym(num2str(v)), x_val);
#df_vals = double(subs(df,x1,x_syms_vals));
#plot(x_val,df_vals,'g-');

#vemos que la derivada en cercanias de las raices no se anula, por lo tanto
#son raices simples y conviene utilizar el metodo de newton, pero requiere calcular
#la derivada de una funcion

display("-----------Metodo de biseccion-----------");
f = @(x) cos(1+x.^2) + sin(x) -1;

[p, h, it] = Biseccion(f,1, 2, kmax, tol );
display("Raiz contenida en [1,2]:");
p
it

display("Raiz contenida en [2,2.75]:");
[p, h, it] = Biseccion(f,2, 2.75, kmax, tol );
p
it


display("-----------Metodo de Newton-Raphson-----------");
display("Raiz contenida en [1,2]:");
x0= 2;
[p,h,it]=Newton(f,df,x0,kmax,tol);
p
it

display("Raiz contenida en [2,2.75]:");
x0=2.75;
[p,h,it]=Newton(f,df,x0,kmax,tol);
p
it


display("-----------Metodo de Secante-----------");
display("Raiz contenida en [1,2]:");
[x, h, it] = Secante(f,1,2,kmax,tol);
x
it

display("Raiz contenida en [2.15,2.75]:");
#si utilizo 2 se aproxima a la otra raiz
[x, h, it] = Secante(f,2.15,2.75,kmax,tol);
x
it

#leer archivo .one

