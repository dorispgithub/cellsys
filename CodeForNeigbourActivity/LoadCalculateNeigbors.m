%Paths and Settingfile
strRootPath = '/Volumes/Doris2TB/170228JUNPFA/BATCH/';
strSettingsFile = '/Volumes/Doris2TB/170228JUNPFA/load/settingFile/SettingsFile_ColorCode.txt'; 

[matData,strFieldName,matMeta] = getRawProbModelData2(strRootPath, strSettingsFile);

%%%
%Paths and Settingfile
strRootPath = '/Volumes/Doris2TB/170228JUNAcrepo/BATCH/';
strSettingsFile = '/Volumes/Doris2TB/170228JUNAcrepo/load/SettingsFile_Cycler.txt'; 

[matData,strFieldName,matMeta] = getRawProbModelData2(strRootPath, strSettingsFile);

%%% calculate well X and Y coordinates

X = matData(:,1);
Y = matData(:,2);

matXYinWell = getXYWithinWell(X,Y, matMeta, 'CV7K', 56)

%%%  now concatenate the XY coordinates of the cells to the fisr dataset

matData(:,[55 56]) = matXYinWell;

%%% now according to this you shoudl have all the info to calculate the
%%% neigbourhud

isLocalization  = ismember(strFieldName, {'CenterX_InWell','CenterY_InWell';}) | ...
    ismember(strFieldName, {'Location_Cells_1_CenterX','Location_Cells_2_CenterY'});

matData(:,185) = SpotCountAfterRemovingFalsePositive;

% it crashes if you do not pslit it in bins, ultimatelly for loop

for i = 1:8
    for j = 1:12 
        matFullInx = matMeta(:,1)==i & matMeta(:,2)==j ;
        FullData{i,j} = matData(matFullInx,:);
        FullMeta{i,j} = matMeta(matFullInx,:);
    end
end

%%% remove the cells where few of them have sot over because blob
% fit the lm on dapi and remove background  on protein quanttyies

x = DapB(:,3); %DAPI
y = DapB(:,29); % GFP substracted signal
format long
b1 = x\y    %b1 is the slope or regression coefficient. The linear relation is  y = b1*x
%%% y = 1.706606213836455e-04 * x

%%% lets plot now the linear model that is fitted
yCalc1 = b1*x;
scatter(x,y)
hold on
plot(x,yCalc1)
%xlabel('Population of state')
%ylabel('Fatal traffic accidents per state')
title('LinearRegressRelationBetweenCellSize&assignedBackground')
%%% Improve the fit by including a y-intercept  $\beta_0$ in your model as  $y = \beta_0 + \beta_1x$. 
%%%Calculate  $\beta_0$ by padding x with a column of ones and using the \ operator.
X = [ones(length(x),1) x];
b = X\y
%%%% y = 0.161051656790431 + 0.238249889030794 *x
%%% visualize
yCalc2 = X*b;
plot(x,yCalc2,'--')
legend('Data','Slope','Slope & Intercept','Location','best');
%%% now calculate Rsquares to see goodness of the fit
Rsq1 = 1 - sum((y - yCalc1).^2)/sum((y - mean(y)).^2)
Rsq2 = 1 - sum((y - yCalc2).^2)/sum((y - mean(y)).^2)

%%%

inx = find(matData(:,185)>350)
matData(inx,:)=[];
matMeta(inx,:)=[];

%%%

prot = 0.161051656790431 + 0.238249889030794 *  matData(:,3); % correcte for the background JUN

matData(:,29) = matData(:,29)-prot; 
matData(:,40) = matData(:,40)-prot;
matData(:,51) = matData(:,29)-matData(40);

b = matData(:,29); b(b<0)=0; matData(:,29)=b; 
b = matData(:,40); b(b<0)=0; matData(:,40)=b; 

%%% clean the few weird cells  not so good idea as this approach removes in
%%% some more dirty well more than it should

D = matData;
M = matMeta;

for i = [4 5]
    for j = 2:11 
        x = FullData{i,j}(:,[29]);
       [z,idx,outliers] = deleteoutliers(x, 0.0005); %this is good threshold for protein cleanup, however some outliers on spot make shit, remove them manually
       FullData{i,j}(idx,:) = [];
       FullMeta{i,j}(idx,:) = [];
    end
end
%%%

%%% clean HPRT also

data = FData; meta= FullMeta;

for i = 2:5
    for j = 2:11 
        x = FullData{i,j}(:,[50]);
       [z,idx,outliers] = deleteoutliers(x, 0.002); %this is good threshold for protein cleanup, however some outliers on spot make shit, remove them manually
       FullData{i,j}(idx,:) = [];
       FullMeta{i,j}(idx,:) = [];
    end
end

%%% as for Nuclear spots seems more reasonable to take the 4 column of
%%% estimated numbers, since that one has nothing in the negative control
%%% and the general distribution tendencies remain the same, moreover,
%%% there is no strange sources of spots at later timepoints where i anyway
%%% do not really see them by eye.


for i = 3
    for j = 2:11
%         figure()
%         boxplot(FullData{i,j}(:,49)); 
        figure()
        stem(FinalDataJUN{i,j}(:,29));
    end
end
%%%%


inx = find(FullData{5,2}(:,55)>40);
FullData{5,2}(inx,:) = [];
FullMeta{5,2}(inx,:) = [];

%%%%
FOI = [1:29 40 51 62:94 140:189 191:199 201:244 246:249 251 252];

strFieldName = FieldNames(foi);
x = cell(size(FData));

for i = 1:4
    for j = 1:10 
        FinalDataJUN{i,j} = FinalDataJUN{i,j}(:,foi);
    end
end

matData = Data;
Data = x;

sz = size(Data);
OUT = cell(sz);

for i = 2:5
    for j = 2:11 
        x = Data{i,j};
       [OUT{i,j}, strFieldnamesCell] = getAmountOfCellsAtDistance(Data{i,j}, strFieldName)
    end
end

%%% now this shit worked and looks good, we can follow it with the
%%% caluclation of the outher features

OUTspots = cell(sz);

for i = 2:5
    for j = 2:11 
        x = Data{i,j};
       [OUTspots{i,j}, strFieldnamesSpot] = getSpotsOfNearestCellsDP(Data{i,j}, strFieldName)
    end
end

%%% and now do the same for the proitens


OUTprot = cell(sz);

for i = 2:5
    for j = 2:11 
        x = Data{i,j};
       [OUTprot{i,j}, strFieldnamesProt] = getProteinOfNearestCellsDP(Data{i,j}, strFieldName)
    end
end


%%%% now cocatenate get final dataset JUN


%%% now first concatenate neighbour acitivyt stuff

Neigh = cell(sz);
for i = 2:5
    for j = 2:11 
       Neigh{i,j} = horzcat(OUT{i,j},OUTspots{i,j},OUTprot{i,j});
    end
end


%%%
Neigh = cell(sz);
for i = 2:5
    for j = 2:11 
       Neigh{i,j} = horzcat(OUT{i,j},OUTspots{i,j});
    end
end
%%% now put that shit on the rest of the data

FData = cell(sz);

for i = 2:5
    for j = 2:11 
       FData{i,j} = horzcat(Data{i,j},Neigh{i,j});
    end
end

FieldNames = [strFieldName, strFieldnamesCell,strFieldnamesSpot, strFieldnamesProt];

FieldNames = [strFieldName, strFieldnamesCell,strFieldnamesSpot];


%%% fix cytoplasm

for i = 2:5
    for j = 2:11 
       FData{i,j}(:,31) = FData{i,j}(:,29) - FData{i,j}(:,30);
    end
end


%check in plot

for i = 4
    for j = 2:11 
        figure()
       scatter(FData{i,j}(:,120), FData{i,j}(:,31))
    end
end


%%% inspect only cytoplasm now


for i = 4
    for j = 2:11 
        figure()
       stem(FData{i,j}(:,31))
    end
end


%%% now this looks good, put the things into the final data and meta,
%%% exclude unnecesary features

FinalMeta{1,2} = FullMeta{3,4};FinalMeta{2,2} = FullMeta{4,4};
FinalMeta{1,3} = FullMeta{3,5};FinalMeta{2,3} = FullMeta{4,5};
FinalMeta{1,4} = FullMeta{3,6};FinalMeta{2,4} = FullMeta{4,6};
FinalMeta{1,5} = FullMeta{6,3};FinalMeta{2,5} = FullMeta{7,3};
FinalMeta{1,6} = FullMeta{7,4};FinalMeta{2,6} = FullMeta{7,4};
FinalMeta{1,7} = FullMeta{7,5};FinalMeta{2,7} = FullMeta{7,5};
FinalMeta{1,8} = FullMeta{7,6};FinalMeta{2,8} = FullMeta{7,6};
FinalMeta{1,9} = FullMeta{7,7};FinalMeta{2,9} = FullMeta{7,7};

genes = n(1:4,1);

FieldNames = strFieldName;
FinalDataJUN = x;
FinalMeta = FullMeta;

save('ProcessedJUN_cyt', 'FinalDataJUN', 'FinalMeta', 'FieldNames', 'genes', 'timepoints');

save('ProcessedJUN_nuc', 'FinalDataJUN', 'FinalMeta', 'FieldNames');




