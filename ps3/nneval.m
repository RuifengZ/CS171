%Ruifeng Zhang 861212163
%November 19 2017
%CS171 PS3
function predY = nneval(X,W1,W2)
X = [ones(size(X,1),1), X]; %adding offset to X
a1 = X*W1; %multiply input by weights
z = (1 + exp(-a1)).^(-1); %apply sigmoid function to a
z = [ones(size(z,1),1), z]; %add offset to z
a2 = z*W2; %multiply second weight
predY = (1 + exp(-a2)).^(-1); %apply sigmoid to find output