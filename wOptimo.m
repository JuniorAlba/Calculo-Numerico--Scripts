function [w_min] = wOptimo (A,b,x0,tolerancia,maxit)
  aux=100000;
  w = linspace(0.1,1.9,100);
  for i=1:length(w)
    [x,it,r]=SOR(A,b,x0,maxit,tolerancia,w(i));
    if(it<aux)
      w_min=w(i);
      aux=it;
    endif
  endfor

  %tambien se puede usar la formula, si la matriz es definida positiva
  %y tridiagonal
  %w = 2/( 1+sqrt( 1 - (RadJacobi(A)^2) ) )

endfunction
