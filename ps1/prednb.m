%Ruifeng Zhang 861212163
%CS 171 PS1
%15 October 2015
function predY = prednb (X,priorp,condp)
n = length(X(1,:));
m = length(X(:,1));
predY = zeros(length(X(:,1)),1);

for r=1:m
    Py1 = priorp(1);
    Py2 = priorp(2);
    for c=1:n
        Py1=Py1*condp(X(r,c)+1,1,c);
        Py2=Py2*condp(X(r,c)+1,2,c);
    end
    if Py1>Py2
        predY(r)=0;
    else
        predY(r)=1;
    end
end

