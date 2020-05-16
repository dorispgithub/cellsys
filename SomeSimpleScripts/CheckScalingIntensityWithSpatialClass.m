%Paths and Settingfile
strRootPath = '/Volumes/Doris2TB/170228JUNPFA/BATCH/';
strSettingsFile = '/Volumes/Doris2TB/170228JUNPFA/load/settingFile/SettingsFile_ColorCode.txt'; 

[matCompleteDataPFA,strColumnsPFA,matCompleteMetaDataPFA] = getRawProbModelData2(strRootPath, strSettingsFile);

%%%% Ac

INTcheckData = [JUN30data; JUN40data; JUN60data; JUN90data];
INTcheckMeta = [FullMetaJUNcyt{4,7}; FullMetaJUNcyt{5,7}; FullMetaJUNcyt{4,8}; FullMetaJUNcyt{5,8};...
    FullMetaJUNcyt{4,9}; FullMetaJUNcyt{5,9}; FullMetaJUNcyt{4,10}; FullMetaJUNcyt{5,10}];

%% now use the first and last two columns of both MetaData to obtain Site-Cell indeces
% those columns enable you to map back Raw, Column, Site, Cell (for used
% plate format)

CellIndeces01 = INTcheckMeta (:, [1 2 6 7]); % opt if multiple plates can use 3 as well
CellIndeces02 = matCompleteMetaDataPFA (:, [1 2 6 7]);

%% now generate a matrix that is intersection 
% this new matrix will be your new MetaData file!

[C,ia,ib] = intersect(CellIndeces01,CellIndeces02,'rows','legacy');



%% now use that new MetaData file to subset your Datasets, subsequently concatenate them and you will get your final dataset

Data01 = INTcheckData (ia,:);
Data02 = matCompleteDataPFA (ib,:);

INTdata = [Data01, Data02];
INTmeta = C;
%INTnames = [, strColumnsPFA];

% now take the uncorrected spot count and look how it scales with the
% intensity in that channel

scatter(INTdata(:,238), INTdata(:,216));

% now subset the spatial classes (as if you would when they would be discretized) and look closer

ix = find(INTdata(:,238)<20);
INTdata02 = INTdata;
INTdata(ix,:) = [];

INTdata = INTdata02;
CL1 = INTdata(find(INTdata(:,211)>0.6),:);
CL2 = INTdata(find(INTdata(:,212)>0.6),:);
CL3 = INTdata(find(INTdata(:,213)>0.6),:);


figure()
subplot(3,4,1);
scatter(INTdata(:,238), INTdata(:,216), 10, INTdata(:,211)); hold on;
scatter(CL1(:,238), CL1(:,216)); hold on;
scatter(CL2(:,238), CL2(:,216)); hold on;
scatter(CL3(:,238), CL3(:,216)); hold on;


figure()
subplot(3,4,1);
scatter(INTdata(:,238), INTdata(:,216), 10, INTdata(:,211), 'filled'); subplot(3,4,2);
scatter(INTdata(:,238), INTdata(:,216), 10, INTdata(:,212), 'filled'); subplot(3,4,3);
scatter(INTdata(:,238), INTdata(:,216), 10, INTdata(:,213), 'filled'); 
%scatter(CL3(:,238), CL3(:,216)); hold on;

gcf2pdf('/Volumes/Doris2TB/CleanedFigures/Fixes/NewJUNplots/', 'CorrIntensityWithSpotCount_All_spatialClass');

Corr_spot_int = [corr(INTdata(:,238), INTdata(:,216)); corr(CL1(:,238), CL1(:,216)); corr(CL2(:,238), CL2(:,216)); corr(CL3(:,238), CL3(:,216))]



checkINT = INTdata(find(INTdata(:,212)>0.6), :);
ix = find(checkINT(:,108)<20);
checkINT(ix,:)=[];





















