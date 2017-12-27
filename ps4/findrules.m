%Ruifeng Zhang
%861212163
%December 3 2017
%CS 171
%PS4
function findrules(D,smin,amin)
I = items(D); %will return a vector of all of the items (as integers) in the dataset D, in sorted order.

m = numexamples(D); %will return the number of transactions (or examples) in the data D

L={};
Li = {};
comb = [];
for i = 1:size(I,2)
    if((getcount(I(i),D) / m) >= smin)
        Li = [Li I(i)];
        comb = [comb I(i)];
    end
end
L = [L Li];

Li={};
comb = combnk(comb,2);
for z=1:size(comb,1)
    if((getcount(comb(z,:),D) / m) >= smin)
        Li = [Li comb(z,:)];
    end
end
L = [L Li];

while ~isempty(Li)
    Ci = apriori_gen(Li);
    Li = {};
    for c = 1:size(Ci,2)
        if((getcount(Ci{c},D) / m) >= smin)
            Li = [Li Ci{c}];
        end
    end
    L = [L Li];
end

R = {};
pos = 1;
for z=1:size(L,2)
    X = PowerSet(L{z});
    for p=2:size(X,2)-1
        conf = getcount(L{z},D) / getcount(X{p},D);
        if conf >= amin
           Ri = {};
           Ri = [Ri conf (getcount(L{z},D) / m) rule2str(L{z},setdiff(L{z},X{p}),D)];
           R{pos} = Ri;
           pos = pos + 1;
        end
    end
end

for m = 1:size(R,2)
    min = m;
    for n = m+1:size(R,2)
        if R{n}{1} < R{min}{1}
            min = n;
        end
    end
    if min ~= m
        temp = R{m};
        R{m} = R{min};
        R{min} = temp;
    end
end

format long
for i=1:size(R,2)
    disp(R{i});
end


end

function [C_i] = apriori_gen(L_p)
C_i = {};
for j = 1:size(L_p,2)
    for k = j + 1:size(L_p,2)
        if(L_p{j}(1:end-1) == L_p{k}(1:end-1))
            if(L_p{j}(end) ~= L_p{k}(end))
                C_i = [C_i [L_p{j} L_p{k}(end)]];
            else
                break;
            end
        else
            break;
        end
    end
end
end

function [P] = PowerSet(S)
    n = numel(S);
    x = 1:n;
    P = cell(1,2^n);
    p_ix = 2;
    for nn = 1:n
        a = combnk(x,nn);
        for j=1:size(a,1)
            P{p_ix} = S(a(j,:));
            p_ix = p_ix + 1;
        end
    end
end