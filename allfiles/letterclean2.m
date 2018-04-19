template = table2array(letter(:,1));
[row,~] = size(template);
sample = zeros(row,1);
for i = 1:row
	if (template(i) == 'A')
		sample(i) = 1;
	elseif (template(i) =='B')
		sample(i) = 1;
	elseif (template(i) =='C')
		sample(i) = 1;
	elseif (template(i) =='D')
		sample(i) = 1;
	elseif (template(i) =='E')
		sample(i) = 1;
	elseif (template(i) =='F')
		sample(i) = 1;
	elseif (template(i) =='G')
		sample(i) = 1;
	elseif (template(i) =='H')
		sample(i) = 1;
	elseif (template(i) =='I')
		sample(i) = 1;
	elseif (template(i) =='J')
		sample(i) = 1;
	elseif (template(i) =='K')
		sample(i) = 1;
	elseif (template(i) =='L')
		sample(i) = 1;
    elseif (template(i) =='M')
		sample(i) = 1;
	elseif (template(i) =='N')
		sample(i) = -1;	
	elseif (template(i) =='O')
		sample(i) = -1;
	elseif (template(i) =='P')
		sample(i) = -1;
    elseif (template(i) =='Q')
		sample(i) = -1;
	elseif (template(i) =='R')
		sample(i) = -1;
    elseif (template(i) =='S')
		sample(i) = -1;
	elseif (template(i) =='T')
		sample(i) = -1;
    elseif (template(i) =='U')
		sample(i) = -1;
	elseif (template(i) =='V')
		sample(i) = -1;	
	elseif (template(i) =='W')
		sample(i) = -1;
	elseif (template(i) =='X')
		sample(i) = -1;
    elseif (template(i) =='Y')
		sample(i) = -1;
	elseif (template(i) =='Z')
		sample(i) = -1;
	end
end
%below lines normalization are for KNN
Last_input = zeros(row,16);
Last_output = zeros(row,1);
for num=2:17
    template = table2array(letter(:,num));
    Last_input(:,num) = (template(:)- mean(template(:)))/std(template(:));
end
% template(:,3) = (template(:,3)- mean(template(:,3)))/std(template(:,3));
% template(:,4) = (template(:,4)- mean(template(:,4)))/std(template(:,4));
% template(:,5) = (template(:,5)- mean(template(:,5)))/std(template(:,5));
% template(:,6) = (template(:,6)- mean(template(:,6)))/std(template(:,6));
% template(:,7) = (template(:,7)- mean(template(:,7)))/std(template(:,7));
% template(:,8) = (template(:,8)- mean(template(:,8)))/std(template(:,8));
% template(:,9) = (template(:,9)- mean(template(:,9)))/std(template(:,9));
% template(:,10) = (template(:,10)- mean(template(:,10)))/std(template(:,10));
% template(:,11) = (template(:,11)- mean(template(:,11)))/std(template(:,11));
% template(:,12) = (template(:,12)- mean(template(:,12)))/std(template(:,12));
% template(:,13) = (template(:,13)- mean(template(:,13)))/std(template(:,13));
% template(:,14) = (template(:,14)- mean(template(:,14)))/std(template(:,14));
% template(:,15) = (template(:,15)- mean(template(:,15)))/std(template(:,15));
% template(:,16) = (template(:,16)- mean(template(:,16)))/std(template(:,16));
% template(:,17) = (template(:,17)- mean(template(:,17)))/std(template(:,17));

% Last_input = letter(:,2:17);
Last_output = sample;
