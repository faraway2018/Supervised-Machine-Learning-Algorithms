%this file is used for RandomForest prediction
trainvalid_input = Final_input(1:5000,:);
trainvalid_output = Final_output(1:5000,:);
testset_input = Final_input(5001:32561,:);
testset_output = Final_output(5001:32561,:);
indices = crossvalind('Kfold',trainvalid_output,5);
% NumTrees = [2,4,8,16,32,64,128,256,512,1024,2048,4096,8192];
% feature  1,2,4,6,8,12,16 or 20
Treenum = 1024;
feature = [1,2,4,6,8,12,16,20];
precisionmax= 0;
featureoptimal= 0;

for m = 1:8
    split = feature(m);
    for i = 1:5
        test = (indices == i); train = ~test;
        test = find(test~=0); train = find(train~=0);
        Mdl = TreeBagger(Treenum,trainvalid_input(train,:),trainvalid_output(train,:),'Method','classification','MinLeafSize',split);
        label = predict(Mdl,trainvalid_input(test,:));
        newlabel = str2double(label);

        %label becomes cell after prediction?
        consistency(i) = 1/size(test,1)*sum(newlabel == trainvalid_output(test));
    end
    cos = mean(consistency);
    if cos>precisionmax
        precisionmax=cos;
        featureoptimal = split;
        bestmodel = Mdl;
    end
end

testlabel = predict(bestmodel,testset_input);
Newtestlabel = str2double(testlabel);
accuracy = 1/size(testset_output,1)*sum(Newtestlabel == testset_output);