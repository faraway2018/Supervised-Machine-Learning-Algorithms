%this file is used for RandomForest prediction
trainvalid_input = Last_input(1:5000,:);
trainvalid_output = Last_output(1:5000,:);
testset_input = Last_input(5001:20000,:);
testset_output = Last_output(5001:20000,:);
indices = crossvalind('Kfold',trainvalid_output,5);
% NumBoosting = [2,4,8,16,32,64,128,256,512,1024,2048];
% learnrate = [1/2,1/4,1/8,1/16,1/32,1/64,1/128,1/256,1/512,1/1024,1/2048];
learnrate = 1;
% Treenum = 1024;
% feature = [1,2,4,6,8,12,16,20];
precisionmax= 0;
featureoptimal= 0;

% ClassTreeEns = fitensemble(X,Y,'AdaBoostM1',100,'Tree');


% for m = 1:11
%     boost = learnrate(m);
    for i = 1:5
        test = (indices == i); train = ~test;
        test = find(test~=0); train = find(train~=0);
%         Model = TreeBagger(Treenum,trainvalid_input(train,:),trainvalid_output(train,:),'Method','classification','MinLeafSize',boost);
%          Model = fitensemble(trainvalid_input(train,:),trainvalid_output(train,:),'AdaBoostM2',100,'Tree','LearnRate',boost); 
        Model = fitcensemble(trainvalid_input(train,:),trainvalid_output(train,:),'Method','AdaBoostM1','NumLearningCycles',100,'LearnRate',learnrate);       
%         Model = fitcensemble(trainvalid_input(train,:),trainvalid_output(train,:),'Method','AdaBoostM2','NumLearningCycles',100);
        label = predict(Model,trainvalid_input(test,:));
        %label becomes cell after prediction?
        consistency(i) = 1/size(test,1)*sum(label == trainvalid_output(test,:));
    end
    cos = mean(consistency);
    if cos>precisionmax
        precisionmax=cos;
        featureoptimal = learnrate;
        bestmodel = Model;
    end
% end

testlabel = predict(bestmodel,testset_input);
accuracy = 1/size(testset_output,1)*sum(testlabel == testset_output);