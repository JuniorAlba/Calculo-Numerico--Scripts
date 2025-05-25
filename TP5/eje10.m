%Inciso A
t = [4 8 12 16 20 24];
c = [1590 1320 1000 900 650 560];
c2 = [log(c)];
[P]=polyfit(t,c2,1);
xx=linspace(4,24,300);
b = exp(P(2))
k = -1*P(1)

figure(1);
hold on;
plot(xx,exp(polyval(P,xx)),'r-');
plot(t,c,'ko','linewidth',2);

%Inciso B
final_tormenta = exp(polyval(P,0))

%inciso C
tc = (log(200)-log(b))/(-k)