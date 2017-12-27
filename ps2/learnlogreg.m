%Ruifeng Zhang 861212163
%CS 171 PS2
%29 October 2017
function w = learnlogreg(X,Y,lambda)
X = [ones(size(X,1),1) X];
n = 0.1;
m = length(Y);
w = zeros(size(X,2),1);
while true
    g = 0;
    for i = 1:m
        if Y(i)==0
            Y(i) = -1;
        end
        p = 1/(1+exp(-(Y(i)*w'*X(i,:)')));
        gi = -(1-p)*Y(i)*X(i,:)';
        g = g + (1/m)*gi;
    end
    w = w - n*(g+(2*lambda/m)*w);
    norm(g)
   if norm(g)<0.001
       break
   end
end