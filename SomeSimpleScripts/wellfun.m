function [dataOutput, matOutputTCN] = wellfun(fhandle, matCompleteData, matCompleteMetaData, isOutputCell)
% WELLFUN parses getRawProbModel2 data structures to evaluate any function
% handle on all cells per well.
%
%
% [dataOutput, matOutputTCN] = wellfun(fhandle, matCompleteData, matCompleteMetaData, isOutputCell)
%
% Evaluates the function handle of "fhandle" on all the datapoints in
% all columns of matCompleteData, per each well as indicated by
% matCompleteMetaData. The user must specify beforehand wether the
% dataOutput should be a cell array (if output per well contains more than
% one datapoint) or wether dataOutput can be a matrix (default if not
% specified).
%
% dataOutput will contain a matrix with per well and plate -index the
% output from fhandle run on all datapoints per well
%
% matOutputTCN will contain the number of datapoints per well
%
% If matCompleteMetaData only has two columns, the first is the
% well-row-number and the second is the well-column-number.
%
% If matCompleteMetaData contains 3 or more columns, the third is the plate
% number. In this case, all output will be 3D, of shape [row,column,plate].
%
% Example:
%
%    % settings file for getRawProbModelData2
%    strSettingsFile = npc('\\nas-biol-imsb-1\share-3-$\Data\Users\50K_final_reanalysis\ProbModel_Settings.txt');
%    % data path for getRawProbModelData2
%    strRootPath = '\\nas-biol-imsb-1\share-3-$\Data\Users\50K_final_reanalysis\VSV_CNX';
%    % get data from path with settingsfile
%    [matCompleteData, strFinalFieldName, matCompleteMetaData] = getRawProbModelData2(strRootPath,strSettingsFile);
%    % function handle
%    fhandle = @(x) median(sum(x));
%    % run wellfun
%    [dataOutput, matOutputTCN] = wellfun(fhandle, matCompleteData, matCompleteMetaData)
%
%
%   See also getRawProbModelData2 cellfun arrayfun
%
% Copyright: Berend Snijder, 2010. Diggety.

% run in demo mode
if nargin==0
    strSettingsFile = npc('\\nas-biol-imsb-1\share-3-$\Data\Users\50K_final_reanalysis\ProbModel_Settings.txt');
    strRootPath = '\\nas-biol-imsb-1\share-3-$\Data\Users\50K_final_reanalysis\VSV_MZ';
    
    [matCompleteData, strFinalFieldName, matCompleteMetaData] = getRawProbModelData2(strRootPath,strSettingsFile);
    % Where matCompleteMetaData contains 
    %     Row, 
    %     Column, 
    %     Plate number, 
    %     Cell Plate number, 
    %     Replica number, 
    %     Image number, 
    %     Object number
    
    % pass function handle. as with arrayfun & cellfun can be made on the
    % fly.
    fhandle = @(x) mean(x(:,1));
    
    % output must be a cell if the function handle and input evaluates to
    % more than a single datapoint.
    isOutputCell = false;
end

% default output is matrix, due to potential memory saving
if (nargin~=0) & (nargin<4)
    isOutputCell = false;
end

% if no plate numbers are passed, process only well indices
intMetaDataColSize = size(matCompleteMetaData,2);

if intMetaDataColSize==2
    intMetaDataCols = 1:2;
else
    intMetaDataCols = 1:3;
end
    
% find out how many well rows & columns are present
matRowColPlateNums = max(matCompleteMetaData(:,intMetaDataCols));

% reformat well indices as plate indices, giving unique indices per well.
matWellSubIndices = sub2ind2(matRowColPlateNums,matCompleteMetaData(:,intMetaDataCols));

% sort data according to well indices
[matWellSubIndices, matSortIX] = sort(matWellSubIndices);

% sort input data
matCompleteData = matCompleteData(matSortIX,:);

% now get the unique values of the sorted subindices, and return the 'last'
% of each occuring unique subindex. this means we can then stepwise loop
% over all unique subindices and batch-wise calculate the readout values
% without ever having to do a 'find' command! sweet fastness.
[matUniqueWellSubIndices, matBinIX1] = unique(matWellSubIndices,'last');

% loop over the each well-index value, and batch-wise evaluate the function
% handle "fhandle" for all cells for that well index.

% output can be either a cell or a matrix, but must be a-priori indicated
% by user. defaults to matrix.
if isOutputCell
    dataOutput = cell(matRowColPlateNums);
else
    dataOutput = NaN(matRowColPlateNums);
end

% initialize datapoint count per well
matOutputTCN = NaN(matRowColPlateNums);

matPreviousIX = 1;
for iBin = 1:size(matUniqueWellSubIndices,1)
    % get data sub-indices
    matCurrentIX = (matPreviousIX:matBinIX1(iBin));
    
    % evaluate input function
    matWellOutput = feval(fhandle, matCompleteData(matCurrentIX,:));
    
    % do a check. if output of first well contains more than one datapoint,
    % set isOutputCell to true and notify user. Only do this check at the
    % first point.
    if iBin==1
        if ~isOutputCell && numel(matWellOutput)>1
            % fprintf('%s: for first well output evaluated in more than a single datapoint. setting output to cell array. please see ''help wellfun'' for more info\n',mfilename)
            isOutputCell  = true;
            dataOutput = cell(matRowColPlateNums);
        end
    end
    
    % put output in dataOutput
    if isOutputCell
        dataOutput{matUniqueWellSubIndices(iBin)} = matWellOutput;
    else
        dataOutput(matUniqueWellSubIndices(iBin)) = matWellOutput;
    end
    
    % count number of datapoints
    matOutputTCN(matUniqueWellSubIndices(iBin)) = numel(matCurrentIX);
    
    % increment data sub-indices to go to start of next data point
    matPreviousIX = matBinIX1(iBin)+1;
end
