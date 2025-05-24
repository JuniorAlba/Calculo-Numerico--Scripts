%P: vector de coeficientes del polinomio de Lagrange que interpola los puntos (x,y)
%x: valores que toman los puntos interpolantes
%y: valores de la funcion interpolada en los puntos x[i]
function [P] = PolyLagrange(x,y)
  n = length(x);
  P = zeros(1,1);
  for i=1:n
    for j=1:n
      num = 1;
      denom = 1;
      if i!=j
        num = conv(num, [1 (-1)*x(j)]);
        denom = denom * (x(i)-x(j));
      endif
    endfor
    P = P + y(i)*(num./denom);
  endfor
