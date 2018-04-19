%this file is used for RandomForest prediction
trainvalid_input = Final_input(1:5000,:);
trainvalid_output = Final_output(1:5000,:);
testset_input = Final_input(5001:32561,:);
testset_output = Final_output(5001:32561,:);
indices = crossvalind('Kfold',trainvalid_output,5);
NumTrees = [2,4,8,16,32,64,128,256,512,1024,2048];

precisionmax= 0;
featureoptimal= 0;
for m = 1:11
    routes = NumTrees(m);
    for i = 1:5
        test = (indices == i); train = ~test;
        test = find(test~=0); train = find(train~=0);
        Model = fitcensemble(trainvalid_input(train,:),trainvalid_output(train,:),'Method','AdaBoostM1','NumLearningCycles',routes);       
        label = predict(Model,trainvalid_input(test,:));
        consistency(i) = 1/size(test,1)*sum(label == trainvalid_output(test,:));
    end

    cos = mean(consistency);
    if cos>precisionmax
        precisionmax=cos;
        featureoptimal = routes;
        bestmodel = Model;
    end
end

testlabel = predict(bestmodel,testset_input);
accuracy = 1/size(testset_output,1)*sum(testlabel == testset_output);