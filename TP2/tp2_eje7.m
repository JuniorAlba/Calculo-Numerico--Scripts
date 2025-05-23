A = diag(2*ones(1,N),0)+diag(-1*ones(1,N-1),-1)+diag(-1*ones(1,N-1),1);
A = A(2:end-1,:);
v1 = zeros(1,N);
v2 = v1;
v1(1,1)=1;
v2(1,N)=1;
A = [v1;A;v2]
b = (1/(N^2))*ones(N,1);
b(1,1)=0;
b(N,1)=0;


A_equi_aumentada = gauss1(A,b);
x = sust_atras(A_equi_aumentada(:,1:end-1) , A_equi_aumentada(:,end));
x



