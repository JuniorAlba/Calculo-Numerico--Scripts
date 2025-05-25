clc;
clear all;
x = [0 1 2 3 4 5 6];
y = [432 599 1012 1909 2977 4190 5961];

Pa = polyfit(x,y,6);
Pb = polyfit(x,y,1);
Pc = polyfit(x,y,2);
acumuladorA = 0;
acumuladorB = 0;
acumuladorC = 0;
for i = 1:length(x)
    acumuladorA = acumulador + (y(i) - polyval(Pa,x(i)))^2;
    acumuladorB = acumulador + (y(i) - polyval(Pb,x(i)))^2;
    acumuladorC = acumulador + (y(i) - polyval(Pc,x(i)))^2;
end
acumuladorA
acumuladorB
acumuladorC




