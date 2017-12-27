function runq2

%[trainX,trainY] = loadspdata('toytrain.txt',3);
[trainX,trainY] = loadspdata('spamtrain.txt',100);
[priorp,condp] = learnnb(trainX,trainY);

%[testX,testY] = loadspdata('toytest.txt',3);
[testX,testY] = loadspdata('spamtest.txt',100); 
predY = prednb(testX,priorp,condp);

fprintf('fraction correct = %g\n',sum(predY==testY)/size(testY,1));
