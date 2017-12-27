%Ruifeng Zhang 861212163
%CS 171 PS1
%15 October 2015
function [priorp, condp] = learnnb(X,Y)
m=length(Y);
n=length(X(1,:));
priorp = zeros(1,2);
condp = zeros(3,2,n);

priorp(1) = sum(Y==0)/m;
priorp(2) = sum(Y==1)/m;

for(i = 1:n)
    temp = X(:,i);
    temp = temp(Y==0);
    condp(1,1,i) = sum(temp==0)/length(temp);
    condp(2,1,i) = sum(temp==1)/length(temp);
    condp(3,1,i) = sum(temp==2)/length(temp);
    temp = X(:,i);
    temp = temp(Y==1);
    condp(1,2,i) = sum(temp==0)/length(temp);
    condp(2,2,i) = sum(temp==1)/length(temp);
    condp(3,2,i) = sum(temp==2)/length(temp);
end



