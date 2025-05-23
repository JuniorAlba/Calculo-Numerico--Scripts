function [r] = rcubica(a)
  a_m = abs(a)
  f = @(x) x^(3)-a_m;
  if a_m>1
    a1 = 1;
    b1 = a_m;
  else
    b1=1;
    a1 = 0;
  endif
  tol = 1e-12;
  [p, rh, it, E_rel,tiempo]=biseccion_p(f,a1,b1,500,tol);
  if a<0
    r = -1*p;
  else
    r = p;
  endif
endfunction
