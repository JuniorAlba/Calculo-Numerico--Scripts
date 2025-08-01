function I = trapcomp(x,y)
    n = length(x);
    L = n-1; % Número de subintervalos
    if n < 2
        error('Se necesitan al menos dos puntos para aplicar la regla del trapecio.');
    end
    w = pesosNC(2); % Pesos para la regla del trapecio
    I=0;
    for i = 1:L
        h = x(i+1) - x(i);
        I = I + h*(y(i:i+1)*w);
    end
end
