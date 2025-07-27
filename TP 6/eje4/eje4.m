fa = @(x) sin(pi*x);
a1=0;
b1=5;
fb = @(x) 1./(1+x.^2);
a2=-5;
b2=5;
format long;
## Sol analíticas:
Ia = 2/pi;
Ib = atan(5)-atan(5);
err = [];
## Genero puntos para la graficación
xa=linspace(0,5,201);
xb=linspace(-5,5,201);
##Fa = @(x) -cos(pi*x)/pi;
##Fb = @(x) atan(x)
##cuando cant intervalos -> inf --> converge a la integral
L = 1;
int1 = quad(fa,0,5);
int2 = quad(fb,-5,5);
for n=2:13
  Q1 = intNCcompuesta(fa,a1,b1,L,n);
  Q2 = intNCcompuesta(fb,a2,b2,L,n);
  err=[err;abs(Ia-Q1) abs(Ib-Q2)];

  subplot(2,1,1)
  xia = linspace(0,5,n);
  plot(xa,fa(xa),xa,polyval(polyfit(xia,fa(xia),n-1),xa))
  grid on, grid minor
  title('Integración función sin(pi*x)')

  subplot(2,1,2)
  xib = linspace(-5,5,n);
  plot(xb,fb(xb),xb,polyval(polyfit(xib,fb(xib),n-1),xb))
  grid on, grid minor

  pause(1)
endfor

err
