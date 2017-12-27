%Ruifeng Zhang 861212163
%November 19 2017
%CS171 PS3
function [W1,W2] = trainneuralnet(X,Y,nhid,lambda)
W1 = randn(size(X,2)+1,nhid)/10; %intialize weights by (elements, hidden units)
W2 = randn(nhid+1,1)/10;
X = [ones(size(X,1),1), X]; %adding offset to X
n = 0.1;

m = 0;
while 1
    m = m+1;
    %forward propagation
    a1 = X*W1; %multiply input by weights
    %a1's rows are each networks and its columns are hidden units
    z = (1 + exp(-a1)).^(-1); %apply sigmoid function to a1
    z = [ones(size(z,1),1), z]; %add offset to z by adding ones to first column
    a2 = z*W2; %multiply second weight
    f = (1 + exp(-a2)).^(-1); %apply sigmoid to find output
    df = f - Y; %find delta for final unit
    
    dW2 = z .* df; %multiply z by df to get delta W2 of each network represented in each row
    %d first computes (z .* (1 - z)) and multplies each column with its
    %corresponding weight then each row by its delta
    d = (z .* (1 - z)) .* W2' .* df; %backward prop to find delta of hidden units for each row
    d = d(:,2:end); %remove first column (offsets)
    SdW2 = zeros(size(W2)); %initialize sums of delta weights
    SdW1 = zeros(size(W1));
    for i = 1:size(X, 1)
        SdW2 = SdW2 + dW2(i,:)'; %proceed to add each row of dW2 together
        SdW1(:,1) = SdW1(:,1) + (X(i,:) .* d(i,1))'; %multiply row of X by each delta and add it to the corresponding weight.
        SdW1(:,2) = SdW1(:,2) + (X(i,:) .* d(i,2))';
        SdW1(:,3) = SdW1(:,3) + (X(i,:) .* d(i,3))';
        SdW1(:,4) = SdW1(:,4) + (X(i,:) .* d(i,4))';
        SdW1(:,5) = SdW1(:,5) + (X(i,:) .* d(i,5))';
    end
    %loss function
    ls = (sum(-(Y.*log(f) + (1 - Y).*log(1 - f))) + (lambda*(sum(sum(SdW1.^2))+sum(SdW2.^2))));
    if m == 1
        avgls1 = ls/length(f);
    end
    if mod(m,1000) == 0
        avgls2 = ls/length(f);
        if avgls1 > avgls2 
            n = n/10;
        end
        avgls1 = avgls2;
    end
    
    SdW1 = SdW1 + (2 .* lambda .* W1); %regularize weights
    SdW2 = SdW2 + (2 .* lambda .* W2);
    if max(max(abs(SdW1))) < .001 && max(max(abs(SdW2))) < .001 %check max gradient
        break;
    end
    max(max(abs(SdW2)))
    W1 = W1 + (-n .* SdW1); %change weights.
    W2 = W2 + (-n .* SdW2);
end