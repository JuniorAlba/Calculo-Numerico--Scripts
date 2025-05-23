function [x, Ar, L, U, P] = doolittle_p (A, b)
  n = length(A(:,1));
  Ar=[A b];
  r = [1:n)';
  epsilon= 1e-9;

  for k=1:n
    [pmax,p]= max(abs(Ar(r(k:n),k)));
    if pmax< epsilon
      disp("Los pivotes son nulos");
    endif
  endfor
endfunction
