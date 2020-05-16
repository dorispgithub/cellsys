function matXYinWell = getXYWithinWell(X,Y,matCompleteMetaData, strMicroscopeType,maxSites,cellstrDataPaths)
% This function will create absolute XY coordinates of the position of
% individual objects within a well.
%
% strMicroscopeType can be any type supported by the imagesnake function
% (such as 'CV7K' )
%
% In contrast to getAbsoluteCoordinateInWell it combines multiple steps and
% adds additional safety checks input to to prevent possible (never observed,
% but potentially) devastating effects

%%% input for X and Y are following features:
%%% {'Location_Cells_1_CenterX';'Location_Cells_2_CenterY'}; DP

% input checking
if nargin < 5
    maxSites = []; % default value which will trigger heuristics
end

if nargin<6
    useCellstrDataPaths = false;
elseif isempty(cellstrDataPaths)
    useCellstrDataPaths = false;
else
    useCellstrDataPaths = true;
end

if useCellstrDataPaths == false
    fprintf('%s: No cellstrDataPaths provided. Trying to make guess of site number', mfilename);
end

% check, if metadata is sorted
ensureCorrectSortingOfMatCompleteMetaData(matCompleteMetaData);

% get absolute X and Y coordinates within a single well
if useCellstrDataPaths == false
    [SiteIX maxSites]= getSiteIndexFromMeta(matCompleteMetaData,maxSites);
else
    [SiteIX maxSites]= getSiteIndexFromMetaAndImageName(matCompleteMetaData,cellstrDataPaths);
end

[wellX wellY] = getAbsoluteCoordinateInWell(X,Y,SiteIX,maxSites,strMicroscopeType);
matXYinWell = [wellX wellY];

end