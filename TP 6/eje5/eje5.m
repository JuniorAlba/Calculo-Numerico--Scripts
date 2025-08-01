f1 = @(x) sin(pi*x);
a1=0;
b1=5;
E_trap1 = [];
E_sim1 = [];
E_cociente_trap1 = [];
E_cociente_sim1 = [];
v_exact1 = integral(f1,a1,b1);

f2 = @(x) 1./(1+x.^2);
a2=-5;
b2=5;
v_exact2 = integral(f2,a2,b2);
E_trap2 = [];
E_sim2 = [];
E_cociente_trap2 = [];
E_cociente_sim2 = [];

f3 = @(x) abs(x).^(3/2);
a3= 0;
b3= 5;
E_trap3 = [];
E_sim3 = [];
E_cociente_trap3 = [];
E_cociente_sim3 = [];
v_exact3 = integral(f3,a3,b3);

for i = 1:12
    Q1_trap=intNCcompuesta(f1,a1,b1,2^i,2);
    E_trap1 = [E_trap1, abs(Q1_trap - v_exact1)];
    Q1_simp=intNCcompuesta(f1,a1,b1,2^i,3);
    E_sim1 = [E_sim1, abs(Q1_simp - v_exact1)];
    if (i>=2)
        E_cociente_trap1 = [E_cociente_trap1, E_trap1(i)./E_trap1(i-1)];
        E_cociente_sim1 = [E_cociente_sim1, E_sim1(i)./E_sim1(i-1)];
    endif
endfor
E_trap1
E_sim1
E_cociente_trap1
E_cociente_sim1


for i = 1:12
    Q2_trap=intNCcompuesta(f2,a2,b2,2^i,2);
    E_trap2 = [E_trap2, abs(Q2_trap - v_exact2)];
    Q2_simp=intNCcompuesta(f2,a2,b2,2^i,3);
    E_sim2 = [E_sim2, abs(Q2_simp - v_exact2)];
    if (i>=2)
        E_cociente_trap2 = [E_cociente_trap2, E_trap2(i)./E_trap2(i-1)];
        E_cociente_sim2 = [E_cociente_sim2, E_sim2(i)./E_sim2(i-1)];
    endif
endfor
E_trap2
E_sim2
E_cociente_trap2
E_cociente_sim2

for i = 1:12
    Q3_trap=intNCcompuesta(f3,a3,b3,2^i,2);
    E_trap3 = [E_trap3, abs(Q3_trap - v_exact3)];
    Q3_simp=intNCcompuesta(f3,a3,b3,2^i,3);
    E_sim3 = [E_sim3, abs(Q3_simp - v_exact3)];
    if (i>=2)
        E_cociente_trap3 = [E_cociente_trap3, E_trap3(i)./E_trap3(i-1)];
        E_cociente_sim3 = [E_cociente_sim3, E_sim3(i)./E_sim3(i-1)];
    endif
endfor
E_trap3
E_sim3
E_cociente_trap3
E_cociente_sim3