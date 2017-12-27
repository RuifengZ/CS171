function runq2

%[trainX,trainY] = loadspdata('toytrain.txt',3);
[trainX,trainY] = loadspdata('spamtrain.txt',100);
weights = learnlogreg(trainX,trainY,0.01)

%[testX,testY] = loadspdata('toytest.txt',3);
[testX,testY] = loadspdata('spamtest.txt',100);
error = testlogreg(testX,testY,weights)

%fprintf('fraction correct = %g\n',sum(predY==testY)/size(testY,1));