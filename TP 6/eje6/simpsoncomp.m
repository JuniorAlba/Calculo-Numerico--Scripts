function I = simpsoncomp(x,y)
    n = length(x);
    L = n-1;
    if n < 3 || mod(n,2) == 0
        error('Se necesitan al menos tres puntos y un número impar de puntos para aplicar la regla de Simpson.');
    end
    w = pesosNC(3);
    I = 0;
    for i=1:2:L-1
        h = x(i+2) - x(i);
        I = I + h*(y(i:i+2)*w);
    endfor
end