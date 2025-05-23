A = [10 5 0 0; 5 10 -4 0; 0 -4 8 -1; 0 0 -1 5];
b = [6 25 -11 11]';
L = tril(A,-1);
U = triu(A,1);
D = diag(diag(A));
%la diagonal principal principal no tiene ceros por lo tanto P(Tw)>=abs(w-1)
% es decir que si P(Tw)<1 (para que el metodo converja) entonces 0<w<2

w = linspace(0,2,100);
min_radio=9;
for j = 1:length(w)
  Tw = inv(D + w(j).*L)*((1-w(j)).*D-w(j).*U);
  x = max(abs(eig(Tw)));
  if x<min_radio
    min_radio = x;
    min = w(j);
  endif
endfor
min



