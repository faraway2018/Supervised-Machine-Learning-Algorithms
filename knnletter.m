% Last_input = table2array(Last_input);
trainvalid_input = Last_input(1:5000,:);
trainvalid_output = Last_output(1:5000,:);
testset_input = Last_input(5001:20000,:);
testset_output = Last_output(5001:20000,:);
indices = crossvalind('Kfold',trainvalid_output,5);
kvalue = linspace(1,51,26);
precisionmax=0;
koptimal=0;

for m = 1:26
    knum = kvalue(m);
    for i = 1:5
        test = (indices == i); train = ~test;
        test = find(test~=0); train = find(train~=0);
        mdl = fitcknn(trainvalid_input(train,:),trainvalid_output(train,:),'NumNeighbors',knum);
        label = predict(mdl,trainvalid_input(test,:));
%         letterlabel = str2double(label);
        %Final_input(test) lead to 6464*1 vector rather than a matrix
        consistency(i) = 1/size(test,1)*sum(label == trainvalid_output(test));
    end
    cos = mean(consistency);
    if cos>precisionmax
        precisionmax=cos;
        koptimal=kvalue(m);
        bestmodel = mdl;
    end
end

testlabel = predict(bestmodel,testset_input);
accuracy = 1/size(testset_output,1)*sum(testlabel == testset_output);