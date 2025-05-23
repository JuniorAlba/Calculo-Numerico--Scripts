addpath("G:/Mi unidad/$Cursado actual/Calculo numerico/Scripts octave/Tp4")
f = @(x) x.^3 + x - 4;
tol = 1e-3;
a =1;
b=4;
[p, rh, it, E_rel,tiempo]=biseccion_p(f,a,b,40,tol);


