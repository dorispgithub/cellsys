%%% how to load multiple cycles of data, and generate one final matrix of
%%% shared single cells; DorisP
%% set paths to experiments and their settings
path_cycle01 = '/Volumes/Doris2TB/Desktop_12042017/Desktop/ACset/161130-PFAAc1stC/BATCH/';
path_cycle02 = '/Volumes/Doris2TB/Desktop_12042017/Desktop/ACset/161130-PFAAc2ndC/BATCH/';

path_setting01 = '/Volumes/Doris2TB/Desktop_12042017/Desktop/ACset/161130-PFAAc1stC/load/SettingsFile_Cycler.txt';
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

matCompleteData = [Data01, Data02];
matCompleteMetaData = C;
strFinalFieldName = [strFinalFieldName01, strFinalFieldName02];

%% 









