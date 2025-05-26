clc;
clear all;
x = [0 1 2 3 4 5 6];
y = [432 599 1012 1909 2977 4190 5961];

Pa = polyfit(x,y,6);
Pb = polyfit(x,y,1);
Pc = polyfit(x,y,2);
n=length(x);
EabsA = norm(y - polyval(Pa,x),2)^2
EabsB = norm(y - polyval(Pb,x),2)^2
EabsC = norm(y - polyval(Pc,x),2)^2



xx = linspace(0,6,100);
figure(1);
hold on;

plot(xx,polyval(Pa,xx),'r-');
plot(xx,polyval(Pb,xx),'g-');
plot(xx,polyval(Pc,xx),'b-');
plot(x,y,'ko','linewidth',2);
%EabsA = 2.0376e-21
%EabsB = 1.8394e+06
%EabsC = 2.0142e+04

%segun la grafica y el error cuadratico, el polinomio de grado 6 es el que mejor se ajusta a los datos
polyval(Pa,10)
polyval(Pb,10)
polyval(Pc,10)

%ans = -6862.0
%ans = 8873.5
%ans = 1.5496e+04
%Vemos que el polinomio de lagrange, apesar de ajustarse bien a los datos dentro del intevalo de puntos,
%fuera de este intervalo nos da un resultado muy diferente al que se espera, por lo que no es recomendable
%usarlo para extrapolar valores fuera del intervalo de datos.
%Sin embargo, las otras aproximaciones dan resultados mas coherentes.

ErelA_sem10 = abs(14900-polyval(Pa,10))/14900
ErelB_sem10 = abs(14900-polyval(Pb,10))/14900
ErelC_sem10 = abs(14900-polyval(Pc,10))/14900
%vemos que el que menor error relativo tiene es el polinomio de grado 2, por lo que es el que mejor se ajusta a los datos fuera del intervalo