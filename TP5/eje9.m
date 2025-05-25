x = [-1 0 1 2];
y1 = [-1.1 -0.4 -0.9 -2.7];
y2 = [log(-y1)];
[P]=polyfit(x,y2,2);
xx=linspace(-1.5,2.5,100);
figure(1);
hold on;
plot(xx,-1*exp(polyval(P,xx)),'r-');
plot(x,y1,'ko','linewidth',2);
