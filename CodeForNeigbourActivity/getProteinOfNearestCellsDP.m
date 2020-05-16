function [out, strFieldnames] = getProteinOfNearestCellsDP (matData, strFieldName)
% note optionally obtain global coordinates by the getXYWithinWell()
% function
% obtains the total integrated and mean protein of GFP and total protein content Succ of the closest to fifth closest other cell

isLocalization  = ismember(strFieldName, {'CenterX_InWell','CenterY_InWell';}) | ...
    ismember(strFieldName, {'Location_Cells_1_CenterX','Location_Cells_2_CenterY'});
isProt =   ismember(strFieldName, {'Intensity_SubsGreen_Cells_1_IntegratedIntensity';'Intensity_SubsGreen_Cells_1_MeanIntensity';'Intensity_SubsFarRed_Cells_1_IntegratedIntensity';'Intensity_SubsFarRed_Cells_1_MeanIntensity'});


OrigProt= matData(:,isProt);
WellCoordinates = matData(:,isLocalization);

CellsToConsider = 5;
[~, IX] = pdist2(WellCoordinates, WellCoordinates,'euclidean', 'Smallest',CellsToConsider+1);
IXofClosest = IX(2:end,:);
ProtOfClosest = OrigProt(IXofClosest);


if max(size(ProtOfClosest)) < CellsToConsider
    warning('not enough cells')
    ProtOfClosest = NaN(size(matData,1), CellsToConsider);
elseif size(ProtOfClosest,2) > size(ProtOfClosest,1)
    ProtOfClosest = ProtOfClosest';
end


out = ProtOfClosest;
strFieldnames = {'ProtOfClosestFirst','ProtOfClosestSecond','ProtOfClosestThird','ProtOfClosestFourth','ProtOfClosestFifth'};

end