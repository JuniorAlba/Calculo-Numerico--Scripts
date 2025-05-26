f = @(x) 5./x;
df = @(x) -5./(x.^2);
x_val = (1:3);
y_val = f(x_val);

[a b c d] = cubic_spline_natural(x_val, y_val)

S = @(x) a(1)*(x==1);
for i=1:length(x_val)-1
    S = @(x) S(x) + polyval([d(i) c(i) b(i) a(i)], x-x_val(i))*(x>x_val(i) & x<=x_val(i+1));
end
for i=1:length(a)
    polyout([d(i) c(i) b(i) a(i)], strcat('(x-',num2str(x_val(i)),')'));
end