clear all; clc;
addpath("D:/$EVALUACION lo deje aca/Scripts octave/Tp4")
tol = 1e-6;
a0=19;

#Si graficamos z en funcion de a podemos obtener un intervalo en el cual podemos
#aplicar el metodo de biseccion o tambien podemos obtener un a0 del enunciado
#dado que nos dan una funcion w que se aproxima a la nuestra entonces a0=19
z= @(a) 0.04*sqrt(a+0.02).*(1-0.02)-0.02.*sqrt(3.*a)-0.02+a;
a = linspace(0,35,500);
figure(1);
hold on;
plot(a,z(a),'r-');
y1 = @(a) a;
plot(a,y1(a), 'b-');
hold off;
#en la grafica se ve una sola linea pero esto se debe a que las dos curvas son
#casi iguales
[x, rh, it,t]=puntofijo_p(z,a0,500,tol);
a=x


#w= @(t) 0.04*sqrt(19+t).*(1-t)-t.*sqrt(3.*19)-t;
x2= @(t) 0.04*sqrt(a+t).*(1-t)-t.*sqrt(3.*a)-t;
y2= @(t) 0*t;
t = linspace(-3,3,500);
figure(2)
hold on;
plot(t,x2(t),'r-');
plot(t,y2(t),'b-');
[p, rh, it, E_rel,tiempo] = biseccion_p(x2,-3,3,500,tol);
p


