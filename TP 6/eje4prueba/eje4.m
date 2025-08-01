f1 = @(x) sin(pi*x);
a1 = 0;
b1= 5;
f2 = @(x) 1./(1 + x.^2);
a2 = -5;
b2 = 5;
err=[];
## Sol analíticas:
Ia = 2/pi;
Ib = atan(5)-atan(5);

## Genero puntos para la graficación
xa=linspace(0,5,201);
xb=linspace(-5,5,201);
L=1;
for n = 2:13
    Q1 = intNCcompuesta(f1, a1, b1, L, n);
    Q2 = intNCcompuesta(f2, a2, b2, L, n);
    err = [err; abs(Ia - Q1) abs(Ib - Q2)];

    subplot(2,1,1)
    xia = linspace(0, 5, n);
    plot(xa, f1(xa), 'b', xa, polyval(polyfit(xia,f1(xia),n-1), xa), 'r');
    grid on; grid minor;
    title('Integración función sin(pi*x)')

    subplot(2,1,2)
    xib = linspace(-5, 5, n);
    plot(xb, f2(xb), 'b', xb, polyval(polyfit(xib,f2(xib),n-1), xb), 'r');
    grid on; grid minor;
    title('Integración función 1/(1+x^2)');
    pause(1);
endfor
err