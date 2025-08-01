format long;
f = @(x) x.^2.*e.^(-x);
I_exacta = 2-5*e^(-1);
cuad_gauss_c(f,0,1,1,2)
cuad_gauss_c(f,0,1,1,3)
intNCcompuesta(f,0,1,1,2)
intNCcompuesta(f,0,1,1,3)
