%this file is used for RandomForest prediction
trainvalid_input = Last_input(1:5000,:);
trainvalid_output = Last_output(1:5000,:);
testset_input = Last_input(5001:20000,:);
testset_output = Last_output(5001:20000,:);
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
%         mdl = fitcknn(Final_input(train,:),Final_output(train,:),'NumNeighbors',knum);
        label = predict(Mdl,trainvalid_input(test,:));
        newlabel = str2double(label);

        %Final_input(test) lead to 6464*1 vector rather than a matrix
        %label becomes cell after prediction?
        consistency(i) = 1/size(test,1)*sum(newlabel == trainvalid_output(test,:));
    end
    cos = mean(consistency);
    if cos>precisionmax
        precisionmax=cos;
%         treeoptimal= NumTrees(m);
        featureoptimal = split;
        bestmodel = Mdl;
    end
end

testlabel = predict(bestmodel,testset_input);
Newtestlabel = str2double(testlabel);
accuracy = 1/size(testset_output,1)*sum(Newtestlabel == testset_output);