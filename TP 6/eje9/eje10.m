a=0;
b=2;
df = @(x) 20 - 3.*x.^2/5;
f = @(x) 20.*x - x.^3/5;
If = @(x) 2*pi.*f(x).*sqrt(1+(df(x).^2));
I_exacta=quad(If,a,b)

I_gauss_3 = cuad_gauss_c(If,a,b,1,3)
I_simp_3 = intNCcompuesta(If,a,b,1,3)

I_simp_5 = intNCcompuesta(If,a,b,5,3)
I_trap_5 = intNCcompuesta(If,a,b,5,2)
