function [p,h,it] = Secante(f,xmin,xmax,kmax,tol)
  #HECHO POR MI
  fmin = f(xmin);
  fmax = f(xmax);
  #No es una condicion necesaria pero mejora las chances de convergencia del metodo
  #if sign(fmax)*sign(fmin) > 0
  #  error(' Los limites del intervalo medidos en f son del mismo signo');
  #endif
  for it=1:kmax
    p = xmax - ((xmax-xmin)*fmax)/(fmax-fmin);
    h(it) = abs(p-xmax)/abs(p);
    if h(it)<tol
      break;
    endif
    xmin = xmax;
    xmax = p;
    fmin = f(xmin);
    fmax = f(xmax);
  endfor
endfunction
