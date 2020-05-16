%%% to clean nuc FISH of GFP dataset use the replicate 1 because that one
%%% worked better and is more clean

%% set paths to experiments and their settings
path_cycle01 = '/Volumes/Doris2TB/Desktop_12042017/Desktop/ACset/161130-PFAAc1stC/BATCH/';
path_cycle02 = '/Volumes/Doris2TB/Desktop_12042017/Desktop/ACset/161130-PFAAc2ndC/BATCH/';

path_setting01 = '/Volumes/Doris2TB/Desktop_12042017/Desktop/ACset/161130-PFAAc1stC/load/SettingsFile_ColorCode.txt';
path_setting02 = '/Volumes/Doris2TB/Desktop_12042017/Desktop/ACset/161130-PFAAc2ndC/load/SettingsFile_Cycler.txt';

%% load data separetelly
% load data (here input the number accordingly so that you load each cycle
% separatelly) NOTE: for this I addapted grpm2 function by Berend
[matData01, strFinalFieldName01, matMetaData01] = ...
    SettingsFile_Cycler(path_cycle01,path_setting01);

[matData02, strFinalFieldName02, matMetaData02] = ...
    SettingsFile_Cycler(path_cycle02,path_setting02);
%% now use the first and last two columns of both MetaData to obtain Site-Cell indeces
% those columns enable you to map back Raw, Column, Site, Cell (for used
% plate format)

CellIndeces01 = matMetaData01 (:, [1 2 6 7]); % opt if multiple plates can use 3 as well
CellIndeces02 = matMetaData02 (:, [1 2 6 7]);

%% now generate a matrix that is intersection 
% this new matrix will be your new MetaData file!

[C,ia,ib] = intersect(CellIndeces01,CellIndeces02,'rows','legacy');


%% now use that new MetaData file to subset your Datasets, subsequently concatenate them and you will get your final dataset

Data01 = matData01 (ia,:);
Data02 = matData02 (ia,:);

matData = [Data01, Data02]; C(:,3)=1; C(:,[4 5])=NaN;
matMeta = C; 
strFieldName = [strFinalFieldName01, strFinalFieldName02];
%%
matCleanFeature = [3 84 94];  % DAPI intensity, Nuc size, Cell size
[inxRemove] = CleanUpMultiQuant(matData,matMeta,matCleanFeature,[0.005 0.995]);
matData(inxRemove,:) = [];
matMeta(inxRemove,:) = [];



for i = 1:8
    for j = 1:12 
        matFullInx = matMeta(:,1)==i & matMeta(:,2)==j ;
        FullData{i,j} = matData(matFullInx,:);
        FullMeta{i,j} = matMeta(matFullInx,:);
    end
end

DapB = [FullData{3,8}];


for i = 3:4
    for j = 10 
        figure()
        boxplot(FullData{i,j}(:,102))
    end
end

%%

D = matData;
M = matMeta;

for i = 3:4
    for j = 10 
        x = FullData{i,j}(:,[102]);
       [z,idx,outliers] = deleteoutliers(x, 0.001); %this is good threshold for protein cleanup, however some outliers on spot make shit, remove them manually
       FullData{i,j}(idx,:) = [];
       FullMeta{i,j}(idx,:) = [];
    end
end

%%% 

DataClean = [FullData{3,3};FullData{3,4};FullData{3,5};FullData{3,6};FullData{3,7};FullData{3,8};FullData{3,9};FullData{3,10};...
    FullData{4,3};FullData{4,4};FullData{4,5};FullData{4,6};FullData{4,7};FullData{4,8};FullData{4,9};FullData{4,10};...
    FullData{5,3};FullData{5,4};FullData{5,5};FullData{5,6};FullData{5,7};FullData{5,8};FullData{5,9};...
    FullData{6,3};FullData{6,4};FullData{6,5};FullData{6,6};FullData{6,7};FullData{6,8};FullData{6,9};];

%%%


MetaClean = [FullMeta{3,3};FullMeta{3,4};FullMeta{3,5};FullMeta{3,6};FullMeta{3,7};FullMeta{3,8};FullMeta{3,9};FullMeta{3,10};...
    FullMeta{4,3};FullMeta{4,4};FullMeta{4,5};FullMeta{4,6};FullMeta{4,7};FullMeta{4,8};FullMeta{4,9};FullMeta{4,10};...
    FullMeta{5,3};FullMeta{5,4};FullMeta{5,5};FullMeta{5,6};FullMeta{5,7};FullMeta{5,8};FullMeta{5,9};...
    FullMeta{6,3};FullMeta{6,4};FullMeta{6,5};FullMeta{6,6};FullMeta{6,7};FullMeta{6,8};FullMeta{6,9};];

FinalData = DataClean; FinalMeta = MetaClean;
%%% now you cleaned the spots, the things you need is cell cycle stages,
%%% and after that you can simply project the number of spots onto subsets
%%% of different cell cycle stages and see which cells are more prone to
%%% transcripbe which gene


%%CellCycle % this shit seems to complicated to do on cell level, meke it
%%back to one matrix and than reshape back to cell.

matM = DataClean(:,findFeature('mitotic_SVM_1',strFieldName)) == 1;
matS = DataClean(:,findFeature('Sphase_SVM_1',strFieldName))==1;
matS(matM ==1) = 0; 

[matDiscCC,inxDelete] = getCellCycle2(DataClean(:,[3]),matS,MetaClean(:,:),matM,0);
% DataClean((inxDelete),:) = [];
% MetaClean((inxDelete),:) = [];
% matDiscCC((inxDelete),:) = [];
% fprintf('CC done\n')

wellhist(matCompleteData(:,1),matCompleteMetaData, 100, matDiscCC~=2);

index = ismember(matCompleteMetaData(:,[1 2]),matWells(1,:),'rows');
CCscatter(matCompleteData(index,1),matCompleteData(index,14),matDiscCC(index),{'' ''})

%%% now concatenate cell cycle on this

DataClean(:,117) = matDiscCC;
matDiscCC(matDiscCC==0) = 5;

%log
log_G1 = matDiscCC==1;
log_S = matDiscCC==2;
log_G2 = matDiscCC==3;
log_M = matDiscCC==4;

%%% now subset again Data into cell and save


for i = 1:8
    for j = 1:12 
        matFullInx = MetaClean(:,1)==i & MetaClean(:,2)==j ;
        FullData{i,j} = DataClean(matFullInx,:);
        FullMeta{i,j} = MetaClean(matFullInx,:);
    end
end

%%% now calculate also neighbour activity and save final set, do tsne

%%% fisrt XY coordinates
%%% calculate well X and Y coordinates

X = DataClean(:,1);
Y = DataClean(:,2);

matXYinWell = getXYWithinWell(X,Y, MetaClean, 'CV7K', 80);

DataClean (:,[118 119]) = matXYinWell;

%%% now according to this you shoudl have all the info to calculate the
%%% neigbourhud

isLocalization  = ismember(strFieldName, {'CenterX_InWell','CenterY_InWell';}) | ...
    ismember(strFieldName, {'Location_Cells_1_CenterX','Location_Cells_2_CenterY'});
%%%

sz = size(FullData);
OUT = cell(sz);

for i = 3:6
    for j = 3:10 
        x = FullData{i,j};
       [OUT{i,j}, strFieldnamesCell] = getAmountOfCellsAtDistance(FullData{i,j}, strFieldName)
    end
end

%%% now this shit worked and looks good, we can follow it with the
%%% caluclation of the outher features

OUTspots = cell(sz);

for i = 3:6
    for j = 3:10 
        x = FullData{i,j};
       [OUTspots{i,j}, strFieldnamesSpot] = getSpotsOfNearestCellsDP(FullData{i,j}, strFieldName)
    end
end

%%%%
%%% now first concatenate neighbour acitivyt stuff

Neigh = cell(sz);
for i = 3:6
    for j = 3:10 
       Neigh{i,j} = horzcat(OUT{i,j},OUTspots{i,j});
    end
end

%%% now put that shit on the rest of the data

FData = cell(sz);

for i = 3:6
    for j = 3:10 
       FData{i,j} = horzcat(FullData{i,j},Neigh{i,j});
    end
end

D = FullData;
FullData = FData;

FieldNames = [strFieldName, strFieldnamesCell,strFieldnamesSpot];


save('Processed_GFPcells_NucFISH', 'FullData', 'FullMeta', 'FieldNames', 'DataClean', 'MetaClean');

%%% could also bin the cell in CC and see where transcrition occurs..
% better bin now the cells and generate boxplots accross the cell cycle
% stages for all genes, put that in supplement.

scatter(FullData{3,3}(:,88), FullData{3,3}(:,102), (FullData{3,3}(:,117)), FullData{3,3}(:,117));

for i = 3:6
    for j = 3:10 
        figure()
        ksdensity(FullData{i,j}(:,3));
       %scatter(FullData{i,j}(:,102), FullData{i,j}(:,88), (FullData{i,j}(:,117))*20, FullData{i,j}(:,117));
    end
end

%%% normalize shit before tSNE! there is no tpreferecne in terms of CC

spots = (DataClean(:,102) - min(DataClean(:,102))) / (max(DataClean(:,102)) - min(DataClean(:,102)));

figure()
subplot(2,2,1);
scatter(mappNUC.Y(:,1), mappNUC.Y(:,2), 8, DataClean(:,102));
subplot(2,2,2);
scatter(mappNUC.Y(:,1), mappNUC.Y(:,2), 8, DataClean(:,117));
subplot(2,2,3);
scatter(mappNUC.Y(:,1), mappNUC.Y(:,2), 8, DataClean(:,3));
subplot(2,2,4);
scatter(mappNUC.Y(:,1), mappNUC.Y(:,2), 8, DataClean(:,88));


figure()
subplot(2,3,1);
scatter(mappNUC02.Y(:,1), mappNUC02.Y(:,2), 4, DataClean(:,102));
subplot(2,3,2);
scatter(mappNUC02.Y(:,1), mappNUC02.Y(:,2), 4, DataClean(:,117));
subplot(2,3,3);
scatter(mappNUC02.Y(:,1), mappNUC02.Y(:,2), 4, DataClean(:,3));
subplot(2,3,4);
scatter(mappNUC02.Y(:,1), mappNUC02.Y(:,2), 4, DataClean(:,88));
subplot(2,3,5);
scatter(mappNUC02.Y(:,1), mappNUC02.Y(:,2), 4, DataClean(:,98));
subplot(2,3,6);
scatter(mappNUC02.Y(:,1), mappNUC02.Y(:,2), 4, DataClean(:,100));


%%% merge tsne to the data in case you remove some cells

DataClean(:,[131 132]) = mappNUC02.Y(:,:);

%%% remove cells with weird LCC values
x = DataClean(:,[98]);
       [z,idx,outliers] = deleteoutliers(x, 0.005); %this is good threshold for protein cleanup, however some outliers on spot make shit, remove them manually
       DataClean(idx,:) = [];
       MetaClean(idx,:) = [];


scatter(DataClean(:,29), DataClean(:,88));
mappNUC02.Y(:,:) = DataClean(:,[131 132]);


%%% now replot this

figure()
subplot(2,3,1);
scatter(DataClean(:,131), DataClean(:,132), 4, DataClean(:,102));
subplot(2,3,2);
scatter(DataClean(:,131), DataClean(:,132), 4, DataClean(:,117));
subplot(2,3,3);
scatter(DataClean(:,131), DataClean(:,132), 4, DataClean(:,3));
subplot(2,3,4);
scatter(DataClean(:,131), DataClean(:,132), 4, DataClean(:,88));
subplot(2,3,5);
scatter(DataClean(:,131), DataClean(:,132), 4, DataClean(:,98));
subplot(2,3,6);
scatter(DataClean(:,131), DataClean(:,132), 4, DataClean(:,100));










