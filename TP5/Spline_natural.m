function [a,b,c,d] = c_spline_natural(x,y)
  %HECHO POR MI
  hf = @(xi2,xi1) = xi2-xi1;
  n = length(x);
  A = zeros(n,n);
  a = y(1:n); %Sabemos que los polinomios deben tomar el valor de la funcion en el punto inicial
  %por lo tanto el coeficientes valen lo mismo que la funcion en el punto
  h = [h(x(2:n),x(1:n-1))]';
  diag_inf = h(1:n-2)*ones(n-1);
  diag_sup = h(2:n-1)*ones(n-1);
  diag_ = 2*(h(1:n-2)+h(2:n-1))*ones(n-1);
  A = A + diag(diag_inf,-1) + diag(diag_sup,1) + diag(diag_,0);
  A(1,1)=1;
  A(n,n)=1;

  b_matriz(2:n-1) = 3*[((a(3:n)-a(2:n-1))'./h(2:n-1) - (a(2:n-1) - a(1:n-2))'./h(1:n-2))];
  b_matriz(1)=0;
  b_matriz(n)=0;

  c = A\b_matriz;
  d = [c(2:n)-c(1:n-1)]'./(3*h(1:n-1)));
  b = [a(2:n)-a(1:n-1)]./h(1:n-1) - [2*c(1:n-1) - c(2:n)].*(h(1:n-1)/3);
  a = a(1:n-1);
  c = c(1:n-1);







