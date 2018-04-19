%%%%%%%%%%%
% This is the code used to cleaning the data
% For now, the only method I know is one-hot-encoding
% For simplicity, Some of the data will be convert to 1 or 0
%%%%%%%%%%%
%%%%%%%%%%%
% There are N+1 types for each data since there is a unknown ?
% 1. age: numbers
% 2. workclass: 9 bits
% 3. fnlwgt: numbers
% 4. education: 17 bits
% 5. education-num: numbers
% 6. marital-status: 8 bits
% 7. occupation: 15 bits
% 8. relationship: 7 bits
% 9. race: 6 bits
% 10. sex: 3 bit
% 11. capital-gain: numbers
% 12. capital-loss: numbers
% 13. hours-per-week: numbers
% 14. native-country: 3 bits (in US or not)
% 15. class: 2 bits
%% Work class converting
% Private                   000000001
% Self-emp-not-inc          000000010
% Self-emp-inc              000000100
% Federal-gov               000001000
% Local-gov                 000010000
% State-gov                 000100000
% Without-pay               001000000
% Never-worked              010000000
% Unknown                   100000000

temp = table2array(bankfull(:,2));
one_hot_job = zeros(45211,12);
[size1,size2] = size(temp);
for i = 1:size1
   if(temp(i) == 'entrepreneur')
       one_hot_job(i,1) = 1;
   elseif(temp(i) == 'housemaid')
       one_hot_job(i,2) = 1; 
   elseif(temp(i) == 'admin.')
       one_hot_job(i,3) = 1;
   elseif(temp(i) == 'blue-collar')
       one_hot_job(i,4) = 1;
   elseif(temp(i) == 'management')
       one_hot_job(i,5) = 1;
   elseif(temp(i) == 'retired')
       one_hot_job(i,6) = 1;
   elseif(temp(i) == 'self-employed')
       one_hot_job(i,7) = 1;
   elseif(temp(i) == 'services')
       one_hot_job(i,8) = 1;
   elseif(temp(i) == 'student')
       one_hot_job(i,9) = 1;
   elseif(temp(i) == 'technician')
       one_hot_job(i,10) = 1;
   elseif(temp(i) == 'unemployed')
       one_hot_job(i,11) = 1;
   elseif(temp(i) == 'unknown')
       one_hot_job(i,12) = 1;
   end
end
%% Education converting
% Bachelors             00000000000000001
% Some-college          00000000000000010
% 11th                  00000000000000100
% HS-grad               00000000000001000
% Prof-school           00000000000010000
% Assoc-acdm            00000000000100000
% Assoc-voc             00000000001000000
% 9th                   00000000010000000
% 7th-8th               00000000100000000
% 12th                  00000001000000000
% Masters               00000010000000000
% 1st-4th               00000100000000000
% 10th                  00001000000000000
% Doctorate             00010000000000000
% 5th-6th               00100000000000000
% Preschool             01000000000000000
% Unknown               10000000000000000
temp = table2array(bankfull(:,3));
one_hot_marital = zeros(45211,4);
[size1,size2] = size(temp);
for i = 1:size1
   if(temp(i) == 'divorced')
       one_hot_marital(i,1) = 1;
   elseif(temp(i) == 'married')
       one_hot_marital(i,2) = 1; 
   elseif(temp(i) == 'single')
       one_hot_marital(i,3) = 1;
   elseif(temp(i) == 'unknown')
       one_hot_marital(i,4) = 1;
   end
end
%% Marital-status
% Married-civ-spouse                   00000001
% Divorced                             00000010
% Never-married                        00000100
% Separated                            00001000
% Widowed                              00010000
% Married-spouse-absent                00100000
% Married-AF-spouse                    01000000
% Unknown                              10000000
temp = table2array(bankfull(:,4));
one_hot_education = zeros(45211,8);
[size1,size2] = size(temp);
for i = 1:size1
   if(temp(i) == 'basic.4y')
       one_hot_education(i,1) = 1;
   elseif(temp(i) == 'basic.6y')
       one_hot_education(i,2) = 1; 
   elseif(temp(i) == 'basic.9y')
       one_hot_education(i,3) = 1;
   elseif(temp(i) == 'high.school')
       one_hot_education(i,4) = 1;
   elseif(temp(i) == 'illiterate')
       one_hot_education(i,5) = 1;
   elseif(temp(i) == 'professional.course')
       one_hot_education(i,6) = 1;
   elseif(temp(i) == 'university.degree')
       one_hot_education(i,7) = 1;
   elseif(temp(i) == 'unknown')
       one_hot_education(i,8) = 1;
   end
end
%% Occupation
% Tech-support              000000000000001
% Craft-repair              000000000000010
% Other-service             000000000000100
% Sales                     000000000001000
% Exec-managerial           000000000010000
% Prof-specialty            000000000100000
% Handlers-cleaners         000000001000000
% Machine-op-inspct         000000010000000
% Adm-clerical              000000100000000
% Farming-fishing           000001000000000
% Transport-moving          000010000000000
% Priv-house-serv           000100000000000
% Protective-serv           001000000000000
% Armed-Forces              010000000000000
% Unknow                    100000000000000
temp = table2array(bankfull(:,5));
one_hot_default = zeros(45211,3);
[size1,size2] = size(temp);
for i = 1:size1
   if(temp(i) == 'yes')
       one_hot_default(i,1) = 1;
   elseif(temp(i) == 'no')
       one_hot_default(i,2) = 1; 
   elseif(temp(i) == 'unknown')
       one_hot_default(i,3) = 1;

   end
end
%% Relationship
% Wife                      0000001
% Own-child                 0000010
% Husband                   0000100
% Not-in-family             0001000
% Other-relative            0010000
% Unmarried                 0100000
% Unknown                   1000000
temp = table2array(bankfull(:,7));
one_hot_housing = zeros(45211,3);
[size1,size2] = size(temp);
for i = 1:size1
   if(temp(i) == 'yes')
       one_hot_housing(i,1) = 1;
   elseif(temp(i) == 'no')
       one_hot_housing(i,2) = 1; 
   elseif(temp(i) == 'unknown')
       one_hot_housing(i,3) = 1;

   end
end
%% Race
% White                             000001
% Asian-Pac-Islander                000010
% Amer-Indian-Eskimo                000100
% Other                             001000
% Black                             010000
% Unknown                           100000
temp = table2array(bankfull(:,8));
one_hot_loan = zeros(45211,3);
[size1,size2] = size(temp);
for i = 1:size1
   if(temp(i) == 'yes')
       one_hot_loan(i,1) = 1;
   elseif(temp(i) == 'no')
       one_hot_loan(i,2) = 1; 
   elseif(temp(i) == 'unknown')
       one_hot_loan(i,3) = 1;
   end
end
%% Sex
% Female   001
% Male     010
% Unknown  100
temp = table2array(bankfull(:,9));
one_hot_contact = zeros(45211,2);
[size1,size2] = size(temp);
for i = 1:size1
   if(temp(i) == 'cellular')
       one_hot_contact(i,1) = 1;
   elseif(temp(i) == 'telephone')
       one_hot_contact(i,2) = 1; 
   end
end
%% Native country
% United-States 001
% other         010
% Unknown       100
temp = table2array(bankfull(:,11));
one_hot_month = zeros(45211,12);
[size1,size2] = size(temp);
for i = 1:size1
   if(temp(i) == 'jan')
       one_hot_month(i,1) = 1;
   elseif(temp(i) == 'feb')
       one_hot_month(i,2) = 1; 
   elseif(temp(i) == 'mar')
       one_hot_month(i,3) = 1;
   elseif(temp(i) == 'apr')
       one_hot_month(i,4) = 1;
   elseif(temp(i) == 'may')
       one_hot_month(i,5) = 1; 
   elseif(temp(i) == 'jun')
       one_hot_month(i,6) = 1;
   elseif(temp(i) == 'jul')
       one_hot_month(i,7) = 1;
   elseif(temp(i) == 'aug')
       one_hot_month(i,8) = 1;
   elseif(temp(i) == 'sep')
       one_hot_month(i,9) = 1; 
   elseif(temp(i) == 'oct')
       one_hot_month(i,10) = 1;
   elseif(temp(i) == 'nov')
       one_hot_month(i,11) = 1;
   elseif(temp(i) == 'dec')
       one_hot_month(i,12) = 1; 
   end
end
%% Class
% >50K    01
% <=50K   10
temp = table2array(bankfull(:,16));
one_hot_poutcome = zeros(45211,4);
[size1,size2] = size(temp);
for i = 1:size1
   if(temp(i) == 'success')
       one_hot_poutcome(i,1) = 1;
   elseif(temp(i) == 'failure')
       one_hot_poutcome(i,2) = 1;
   elseif(temp(i) == 'unknown')
       one_hot_poutcome(i,3) = 1;
   elseif(temp(i) == 'other')
       one_hot_poutcome(i,4) = 1;
   end
end

temp = table2array(bankfull(:,17));
one_hot_output = zeros(45211,1);
[size1,size2] = size(temp);
for i = 1:size1
   if(temp(i) == 'yes')
       one_hot_output(i,1) = 1;
   elseif(temp(i) == 'no')
       one_hot_output(i,1) = 0;
   end
end
%% Combine the data
%below lines of normalization only for knn, commend them out for other
%methods
bank_input = zeros(45211,58);
bank_output = zeros(45211,1);
bank_input(:,1) = table2array(bankfull(:,1));
bank_input(:,1) = (bank_input(:,1)- mean(bank_input(:,1)))/std(bank_input(:,1));
bank_input(:,2:13) = one_hot_job;
bank_input(:,14:17) = one_hot_marital;
bank_input(:,18:25) = one_hot_education;
bank_input(:,26:28) = one_hot_default;
bank_input(:,29) = table2array(bankfull(:,6));
bank_input(:,29) = (bank_input(:,29)- mean(bank_input(:,29)))/std(bank_input(:,29));
bank_input(:,30:32) = one_hot_housing;
bank_input(:,33:35) = one_hot_loan;
bank_input(:,36:37) = one_hot_contact;
bank_input(:,38) = table2array(bankfull(:,10));
bank_input(:,38) = (bank_input(:,38)- mean(bank_input(:,38)))/std(bank_input(:,38));
bank_input(:,39:50) = one_hot_month;
bank_input(:,51) = table2array(bankfull(:,12));
bank_input(:,51) = (bank_input(:,51)- mean(bank_input(:,51)))/std(bank_input(:,51));
bank_input(:,52) = table2array(bankfull(:,13));
bank_input(:,52) = (bank_input(:,52)- mean(bank_input(:,52)))/std(bank_input(:,52));
bank_input(:,53) = table2array(bankfull(:,14));
bank_input(:,53) = (bank_input(:,53)- mean(bank_input(:,53)))/std(bank_input(:,53));
bank_input(:,54) = table2array(bankfull(:,15));
bank_input(:,54) = (bank_input(:,54)- mean(bank_input(:,54)))/std(bank_input(:,54));
bank_input(:,55:58) = one_hot_poutcome;
bank_output = one_hot_output;
k=1; v=1;
% for i = 1:32561
%    if(bank_input(i,1) == '?')
%        loca1(k) = i;
%        k = k+1;
%    end
%     if(bank_input(i,71) == '?')
%        loca2(v) = i;
%        v = v+1;
%    end
% end
% C =[loca1,loca2];
% bank_input(C,:) = [];
% bank_output(C,:) = [];
%remember for 12 if it is 0, set the output to 0

%happens on 6425,22938,36426
