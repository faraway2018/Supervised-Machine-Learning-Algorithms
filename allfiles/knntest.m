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

temp = table2array(adttest(:,2));
one_hot_workclass = zeros(16281,9);
[size1,size2] = size(temp);
for i = 1:size1
   if(temp(i) == '?')
       one_hot_workclass(i,1) = 1;
   elseif(temp(i) == 'Never-worked')
       one_hot_workclass(i,2) = 1; 
   elseif(temp(i) == 'Without-pay')
       one_hot_workclass(i,3) = 1;
   elseif(temp(i) == 'State-gov')
       one_hot_workclass(i,4) = 1;
   elseif(temp(i) == 'Local-gov')
       one_hot_workclass(i,5) = 1;
   elseif(temp(i) == 'Federal-gov')
       one_hot_workclass(i,6) = 1;
   elseif(temp(i) == 'Self-emp-inc')
       one_hot_workclass(i,7) = 1;
   elseif(temp(i) == 'Self-emp-not-inc')
       one_hot_workclass(i,8) = 1;
   elseif(temp(i) == 'Private')
       one_hot_workclass(i,9) = 1;
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
temp = table2array(adttest(:,4));
one_hot_education = zeros(16281,17);
[size1,size2] = size(temp);
for i = 1:size1
   if(temp(i) == '?')
       one_hot_education(i,1) = 1;
   elseif(temp(i) == 'Preschool')
       one_hot_education(i,2) = 1; 
   elseif(temp(i) == '5th-6th')
       one_hot_education(i,3) = 1;
   elseif(temp(i) == 'Doctorate')
       one_hot_education(i,4) = 1;
   elseif(temp(i) == '10th')
       one_hot_education(i,5) = 1;
   elseif(temp(i) == '1st-4th')
       one_hot_education(i,6) = 1;
   elseif(temp(i) == 'Masters')
       one_hot_education(i,7) = 1;
   elseif(temp(i) == '12th')
       one_hot_education(i,8) = 1;
   elseif(temp(i) == '7th-8th')
       one_hot_education(i,9) = 1;
   elseif(temp(i) == '9th')
       one_hot_education(i,10) = 1;
   elseif(temp(i) == 'Assoc-voc')
       one_hot_education(i,11) = 1;
   elseif(temp(i) == 'Assoc-acdm')
       one_hot_education(i,12) = 1;
   elseif(temp(i) == 'Prof-school')
       one_hot_education(i,13) = 1;
   elseif(temp(i) == 'HS-grad')
       one_hot_education(i,14) = 1;
   elseif(temp(i) == '11th')
       one_hot_education(i,15) = 1;
   elseif(temp(i) == 'Some-college')
       one_hot_education(i,16) = 1;
   elseif(temp(i) == 'Bachelors')
       one_hot_education(i,17) = 1;
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
temp = table2array(adttest(:,6));
one_hot_marital = zeros(16281,8);
[size1,size2] = size(temp);
for i = 1:size1
   if(temp(i) == '?')
       one_hot_marital(i,1) = 1;
   elseif(temp(i) == 'Married-AF-spouse')
       one_hot_marital(i,2) = 1; 
   elseif(temp(i) == 'Married-spouse-absent')
       one_hot_marital(i,3) = 1;
   elseif(temp(i) == 'Widowed')
       one_hot_marital(i,4) = 1;
   elseif(temp(i) == 'Separated')
       one_hot_marital(i,5) = 1;
   elseif(temp(i) == 'Never-married')
       one_hot_marital(i,6) = 1;
   elseif(temp(i) == 'Divorced')
       one_hot_marital(i,7) = 1;
   elseif(temp(i) == 'Married-civ-spouse')
       one_hot_marital(i,8) = 1;
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
temp = table2array(adttest(:,7));
one_hot_occupation = zeros(16281,15);
[size1,size2] = size(temp);
for i = 1:size1
   if(temp(i) == '?')
       one_hot_occupation(i,1) = 1;
   elseif(temp(i) == 'Armed-Forces')
       one_hot_occupation(i,2) = 1; 
   elseif(temp(i) == 'Protective-serv')
       one_hot_occupation(i,3) = 1;
   elseif(temp(i) == 'Priv-house-serv')
       one_hot_occupation(i,4) = 1;
   elseif(temp(i) == 'Transport-moving')
       one_hot_occupation(i,5) = 1;
   elseif(temp(i) == 'Farming-fishing')
       one_hot_occupation(i,6) = 1;
   elseif(temp(i) == 'Adm-clerical')
       one_hot_occupation(i,7) = 1;
   elseif(temp(i) == 'Machine-op-inspct')
       one_hot_occupation(i,8) = 1;
   elseif(temp(i) == 'Handlers-cleaners')
       one_hot_occupation(i,9) = 1;
   elseif(temp(i) == 'Prof-specialty')
       one_hot_occupation(i,10) = 1;
   elseif(temp(i) == 'Exec-managerial')
       one_hot_occupation(i,11) = 1;
   elseif(temp(i) == 'Sales')
       one_hot_occupation(i,12) = 1;
   elseif(temp(i) == 'Other-service')
       one_hot_occupation(i,13) = 1;
   elseif(temp(i) == 'Craft-repair')
       one_hot_occupation(i,14) = 1;
   elseif(temp(i) == 'Tech-support')
       one_hot_occupation(i,15) = 1;
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
temp = table2array(adttest(:,8));
one_hot_relationship = zeros(16281,7);
[size1,size2] = size(temp);
for i = 1:size1
   if(temp(i) == '?')
       one_hot_relationship(i,1) = 1;
   elseif(temp(i) == 'Unmarried')
       one_hot_relationship(i,2) = 1; 
   elseif(temp(i) == 'Other-relative')
       one_hot_relationship(i,3) = 1;
   elseif(temp(i) == 'Not-in-family')
       one_hot_relationship(i,4) = 1;
   elseif(temp(i) == 'Husband')
       one_hot_relationship(i,5) = 1;
   elseif(temp(i) == 'Own-child')
       one_hot_relationship(i,6) = 1;
   elseif(temp(i) == 'Wife')
       one_hot_relationship(i,7) = 1;
   end
end
%% Race
% White                             000001
% Asian-Pac-Islander                000010
% Amer-Indian-Eskimo                000100
% Other                             001000
% Black                             010000
% Unknown                           100000
temp = table2array(adttest(:,9));
one_hot_race = zeros(16281,6);
[size1,size2] = size(temp);
for i = 1:size1
   if(temp(i) == '?')
       one_hot_race(i,1) = 1;
   elseif(temp(i) == 'Black')
       one_hot_race(i,2) = 1; 
   elseif(temp(i) == 'Other')
       one_hot_race(i,3) = 1;
   elseif(temp(i) == 'Amer-Indian-Eskimo')
       one_hot_race(i,4) = 1;
   elseif(temp(i) == 'Asian-Pac-Islander')
       one_hot_race(i,5) = 1;
   elseif(temp(i) == 'White')
       one_hot_race(i,6) = 1;
   end
end
%% Sex
% Female   001
% Male     010
% Unknown  100
temp = table2array(adttest(:,10));
one_hot_sex = zeros(16281,3);
[size1,size2] = size(temp);
for i = 1:size1
   if(temp(i) == '?')
       one_hot_sex(i,1) = 1;
   elseif(temp(i) == 'Male')
       one_hot_sex(i,2) = 1; 
   elseif(temp(i) == 'Female')
       one_hot_sex(i,3) = 1;
   end
end
%% Native country
% United-States 001
% other         010
% Unknown       100
temp = table2array(adttest(:,14));
one_hot_country = zeros(16281,3);
[size1,size2] = size(temp);
for i = 1:size1
   if(temp(i) == '?')
       one_hot_country(i,1) = 1;
   elseif(temp(i) == 'United-States')
       one_hot_country(i,3) = 1; 
   else
       one_hot_country(i,2) = 1;
   end
end
%% Class
% >50K    01
% <=50K   10
temp = table2array(adttest(:,15));
one_hot_class = zeros(16281,1);
[size1,size2] = size(temp);
for i = 1:size1
   if(temp(i) == '<=50K.')
       one_hot_class(i,1) = 1;
   else
       one_hot_class(i,1) = 0;
   end
end
%% Combine the data
Test_input = zeros(16281,74);
Test_output = zeros(16281,2);
Test_input(:,1) = table2array(adttest(:,1));
Test_input(:,2:10) = one_hot_workclass;
Test_input(:,11) = table2array(adttest(:,3));
Test_input(:,12:28) = one_hot_education;
Test_input(:,29) = table2array(adttest(:,5));
Test_input(:,30:37) = one_hot_marital;
Test_input(:,38:52) = one_hot_occupation;
Test_input(:,53:59) = one_hot_relationship;
Test_input(:,60:65) = one_hot_race;
Test_input(:,66:68) = one_hot_sex;
Test_input(:,69) = table2array(adttest(:,11));
Test_input(:,70) = table2array(adttest(:,12));
Test_input(:,71) = table2array(adttest(:,13));
Test_input(:,72:74) = one_hot_country;
Test_output = one_hot_class;
k=1; v=1;
for i = 1:16281
   if(Test_input(i,1) == '?')
       del1(k) = i;
       k = k+1;
   end
    if(Test_input(i,71) == '?')
       del2(v) = i;
       v = v+1;
   end
end
Col =[del1,del2];
Test_input(Col,:) = [];
Test_output(Col,:) = [];