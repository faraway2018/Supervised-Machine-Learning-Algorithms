%this file is used for RandomForest prediction
indices = crossvalind('Kfold',Final_output,5);
boosting = [2,4,8,16,32,64,128,256,512,1024,2048,4096,8192];
% feature  1,2,4,6,8,12,16 or 20
Treenum = 100;
% feature = [1,2,4,6,8,12,16,20];
precisionmax= 0;
treeoptimal= 0;

for m = 1:12
    boostnum = boosting(m);
    for i = 1:5
        test = (indices == i); train = ~test;
        test = find(test~=0); train = find(train~=0);
        %doesnt do with the treenum
        Mdl = fitensemble(Final_input(train,:),Final_output(train,:),'AdaboostM1',boostnum,'Tree');
%         mdl = fitcknn(Final_input(train,:),Final_output(train,:),'NumNeighbors',knum);
        label = predict(Mdl,Final_input(test,:));
        newlabel = str2double(label);

        %Final_input(test) lead to 6464*1 vector rather than a matrix
        %label becomes cell after prediction?
        consistency(i) = 1/size(test,1)*sum(newlabel == Final_output(test));
    end
    cos = mean(consistency);
    if cos>precisionmax
        precisionmax=cos;
        treeoptimal= boosting(m);
        bestmodel = Mdl;
    end
end

testlabel = predict(bestmodel,Test_input);
Newtestlabel = str2double(testlabel);
accuracy = 1/size(Test_output,1)*sum(Newtestlabel == Test_output);