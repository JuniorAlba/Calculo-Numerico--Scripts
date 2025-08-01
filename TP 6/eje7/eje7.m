x = [0 200 400 600 800 100 1200];
y = [4*100 3.95*103 3.89*106 3.80*110 3.60*120 3.41*133 3.30*149.6];
fprintf('utilizando la regla del trapecio compuesta')
I_trap = trapcomp(x,y);
fprintf('utilizando la regla de simpson compuesta')
I_simpson = simpsoncomp(x,y);

