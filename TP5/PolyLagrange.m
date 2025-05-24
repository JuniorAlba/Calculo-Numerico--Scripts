%P: vector de coeficientes del polinomio de Lagrange que interpola los puntos (x,y)
%x: valores que toman los puntos interpolantes
%y: valores de la funcion interpolada en los puntos x[i]
function [P] = PolyLagrange(x, y)
  n = length(x);
  P = zeros(1, n);

  for i = 1:n
    num = [1];
    denom = 1;
    for j = 1:n
      if j != i
        num = conv(num, [1 -x(j)]);  % Multiplicar polinomios: L *= (x - x_j)
        denom = denom * (x(i) - x(j));
      endif
    endfor

    % Asegurar que L tenga longitud n (rellenar con ceros a la derecha)
    num = [num, zeros(1, n - length(num))];

    % Sumar el término y_i * L_i(x) / denom al polinomio final
    P = P + (y(i) / denom) * num;
  endfor
end
