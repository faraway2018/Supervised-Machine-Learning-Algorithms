%this file is used for RandomForest prediction
trainvalid_input = bank_input(1:5000,:);
trainvalid_output = bank_output(1:5000,:);
testset_input = bank_input(5001:45211,:);
testset_output = bank_output(5001:45211,:);
indices = crossvalind('Kfold',trainvalid_output,5);
NumBoosting = [2,4,8,16,32,64,128,256,512,1024,2048];
% learnrate = [1/2,1/4,1/8,1/16,1/32,1/64,1/128,1/256,1/512,1/1024,1/2048];
% learnrate = 1;
% Treenum = 1024;
% feature = [1,2,4,6,8,12,16,20];
precisionmax= 0;
featureoptimal= 0;

% ClassTreeEns = fitensemble(X,Y,'AdaBoostM1',100,'Tree');


for m = 1:11
    boost = NumBoosting(m);
    for i = 1:5
        test = (indices == i); train = ~test;
        test = find(test~=0); train = find(train~=0);
%         Model = TreeBagger(Treenum,trainvalid_input(train,:),trainvalid_output(train,:),'Method','classification','MinLeafSize',boost);
%          Model = fitensemble(trainvalid_input(train,:),trainvalid_output(train,:),'AdaBoostM2',100,'Tree','LearnRate',boost); 
        Model = fitcensemble(trainvalid_input(train,:),trainvalid_output(train,:),'Method','AdaBoostM1','NumLearningCycles',boost);       
%         Model = fitcensemble(trainvalid_input(train,:),trainvalid_output(train,:),'Method','AdaBoostM2','NumLearningCycles',100);
        label = predict(Model,trainvalid_input(test,:));
        %label becomes cell after prediction?
        consistency(i) = 1/size(test,1)*sum(label == trainvalid_output(test,:));
    end
    cos = mean(consistency);
    if cos>precisionmax
        precisionmax=cos;
        featureoptimal = boost;
        bestmodel = Model;
    end
end

testlabel = predict(bestmodel,testset_input);
accuracy = 1/size(testset_output,1)*sum(testlabel == testset_output);