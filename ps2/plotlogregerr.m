function plotlogregerr(trainX,trainY,testX,testY,lambdaset)
size = length(trainY)/5;
TrainX1 = trainX(1:size,:);
TrainX2 = trainX(size:size*2,:);
TrainX3 = trainX(size:size*3,:);
TrainX4 = trainX(size:size*4,:);
TrainX5 = trainX(size:length(trainY),:);
