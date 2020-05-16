function [out, strFieldnames] = getSpotsOfNearestCellsDP(matData, strFieldName)
% note optionally obtain global coordinates by the getXYWithinWell()
% function
% obtains the number of spots of the closest to fifth closest other cell

isLocalization  = ismember(strFieldName, {'CenterX_InWell','CenterY_InWell';}) | ...
    ismember(strFieldName, {'Location_Cells_1_CenterX','Location_Cells_2_CenterY'});
% isSpots =   ismember(strFieldName, {'Children_Cells_2_DSpotsCount';}) | ...
%     ismember(strFieldName, {'Children_Cells_3_DSpots';}) | ...
%     ismember(strFieldName, {'Cells_Children_01';}) | ...
%     ismember(strFieldName, {'Children_Cells_2_MDSpotsCount';}) | ...
%     ismember(strFieldName, {'Cells_Unweighted_Children_01';}) | ...
%     ismember(strFieldName, {'Cells_Weighted_Children_01';});
isSpots =   ismember(strFieldName, {'Children_Cells_1_DSpots'});


OrigSpots= matData(:,isSpots);
WellCoordinates = matData(:,isLocalization);

CellsToConsider = 5;
[~, IX] = pdist2(WellCoordinates, WellCoordinates,'euclidean', 'Smallest',CellsToConsider+1);
IXofClosest = IX(2:end,:);
SpotsOfClosest = OrigSpots(IXofClosest);


if max(size(SpotsOfClosest)) < CellsToConsider
    warning('not enough cells')
    SpotsOfClosest = NaN(size(matData,1), CellsToConsider);
elseif size(SpotsOfClosest,2) > size(SpotsOfClosest,1)
    SpotsOfClosest = SpotsOfClosest';
end


out = SpotsOfClosest;
strFieldnames = {'SpotsOfClosestFirst','SpotsOfClosestSecond','SpotsOfClosestThird','SpotsOfClosestFourth','SpotsOfClosestFifth'};

end