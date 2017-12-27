%Ruifeng Zhang 861212163
%CS 171 PS1
%15 October 2015

function prob3
X=[0;2;2;3;-1;1]
Y=[1;-3;-2;-3;-1;-1]
Xw=[1,0;1,2;1,2;1,3;1,-1;1,1]

A=Xw'*Xw
c=Xw'*Y
w=inv(A)*c

w2=inv(A+5*eye(2))*c

plot(X,Y,'o');

hold on;
syms x y;
f(y)=w(1)+w(2)*x^3
ezplot(f,[-1,4]);

f(y)=w2(1)+w2(2)*x^3
ezplot(f,[-1,4]);
hold off;
legend('data points','least square', 'ridge regression');

