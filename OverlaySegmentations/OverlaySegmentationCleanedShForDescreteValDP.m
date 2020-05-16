% strObjectName = 'Nuclei';
strRootPath = '/Volumes/Doris2TB/170228JUNPFA/BATCH/';
%strRootPath = '/Volumes/Doris2TB/170228JUNAcrepo/BATCH/';
strObjectName = 'Cells';

strFieldName_01 = 'DiscreteClass';
%strFieldName_02 = 'SpotCount';


% directory that contains well segmentation images (if missing, error)
strWellSegmentationPath = strrep(strRootPath,'BATCH','SEGMENTATION_WELL');
if ~fileattrib(strWellSegmentationPath)
   error('%s: required directory ''%s'' is missing. Please run stitchSegmentationPerWell()',mfilename,strWellSegmentationPath)
end 

% load in the well object id mapping. (if missing, error)
if ~exist('strWellSegmentationBatchPath')
    strWellSegmentationBatchPath = strRootPath;
end
strObjIDMeasurementsFile = fullfile(strWellSegmentationBatchPath, ['Measurements_',strObjectName,'_StitchedWellObjectIds.mat']);
if ~fileattrib(strObjIDMeasurementsFile)
    error('%s: required file ''%s'' is missing. Either change object name, or please run stitchSegmentationPerWell()',mfilename,strObjIDMeasurementsFile)
end

% get the complete singlecell data of interest
%[matCompleteData, strFinalFieldName, matCompleteMetaData] = getRawProbModelData2(strRootPath,strSettingsFile);

% matFeatureIx = find(strcmp(strFinalFieldName,'Edge'));
matFeatureIx = find(strcmp(strFinalFieldName,strFieldName_01));


% if two features are used, the strength of the second makes colors either
% gray or the actual color from the first parameter.
% [~,matFeatureIx] = ismember({'Direction','Distance'},strFinalFieldName);

% [~,matFeatureIx] = ismember('Direction',strFinalFieldName);
% matFeatureIx = find(strcmp(strFinalFieldName,'Direction'));
%  matFeatureIx = find(strcmp(strFinalFieldName,'Intensity_OrigGreen_Cells_2'));
% matFeatureIx = find(strcmp(strFinalFieldName,'LCD'));

% matCompleteData = matCompleteData(:,matFeatureIx);
% strFinalFieldName = strFinalFieldName(matFeatureIx);
if isempty(matFeatureIx)
    error('requested feature is not present in data!')
end

fprintf('%s: loading and parsing well object id data for ''%s''\n',mfilename,strObjectName)
% load object id mapping
handles = LoadMeasurements(struct(),strObjIDMeasurementsFile);
% put cell well object ids in cell array
cellWellObjectIDs = handles.Measurements.(strObjectName).StitchedWellObjectIds;

% let's add a column to matCompleteMetaData that contains the stitched
% well object id's.
matMetaDataWellObjectIDs = NaN(size(matCompleteMetaData,1),1);
for iOrigImage = unique(matCompleteMetaData(:,6))';
    
    matCellRowIX = matCompleteMetaData(:,6)==iOrigImage;
    
    matOKCellIX = matCompleteMetaData(matCellRowIX,7);
    
    matMetaDataWellObjectIDs(matCellRowIX) = cellWellObjectIDs{iOrigImage}(matOKCellIX);
end
matMetaDataWellObjectIDs = uint16(matMetaDataWellObjectIDs);



fprintf('%s: finding & parsing well segmentation images\n',mfilename,strObjectName)
% get list of well segmentation images for current object
strucWellSegmentationFileList = CPdir(strWellSegmentationPath);
strucWellSegmentationFileList(cat(1,strucWellSegmentationFileList.isdir)) = [];
cellWellSegmentationFileList = {strucWellSegmentationFileList.name};
clear strucWellSegmentationFileList
% filter image segmentation list for wanted object
matOKSegIX = cellfun(@(x) ~isempty(findstr(x,['_Segmented',strObjectName])), cellWellSegmentationFileList);
cellWellSegmentationFileList(~matOKSegIX) = [];

% get well coordinates from segmentation images
[matImageRow,matImageCol]=cellfun(@filterimagenamedata,cellWellSegmentationFileList);
matImageWellPositionData = [matImageRow',matImageCol'];


% get the image snake, and image positions. We need this for drawing white
% separator lines between original images.
handles = LoadMeasurements(handles,fullfile(strRootPath, 'Measurements_Image_FileNames.mat'));
cellFileNames = cat(1,handles.Measurements.Image.FileNames{:});
cellFileNames = cellFileNames(:,1);
[matPositionNumbers,cellMicroscopeTypes] = cellfun(@check_image_position,cellFileNames(1:120),'UniformOutput',false);
[matImageSnake,matStitchDimensions] = get_image_snake(max(cell2mat(matPositionNumbers)), unique(cellMicroscopeTypes));




% we should rescale the measurement such that it can be an RGB color..
% matFeatureIx has the column index of measurement of choice
matRescaledData = double(matCompleteData(:,matFeatureIx));
% matRescaledData = double(matCompleteData(:,matFeatureIx));
% if length(unique(matRescaledData(:)))==2
%     % discrete data, don't do quantile rescaling.
%     intLowerValue = nanmin(matRescaledData);
%     intUpperValue = nanmax(matRescaledData);
% else
%     % non-discrete data, do quantile rescaling.
% %     intLowerValue = quantile(matRescaledData,0.0001);
% %     intUpperValue = quantile(matRescaledData,0.95);
%     intLowerValue = quantile(matRescaledData,0.1);
%     intUpperValue = quantile(matRescaledData,0.9);
% end
% intUpperValue = quantile(matRescaledData,1);

intCellCount = size(matRescaledData,1);
% matRescaledData = (matRescaledData - repmat(intLowerValue,intCellCount,1)) ./ (repmat(intUpperValue,intCellCount,1)-repmat(intLowerValue,intCellCount,1));
% matRescaledData(matRescaledData<0)=0;
% matRescaledData(matRescaledData>1)=1;
% figure;hist(matRescaledData,100)
% matRescaledData = uint8(matRescaledData * 254) + 1;

matRescaledData = uint8(matRescaledData * 1) + 1;

%%% red-green cmap not via black
% matColorMap = [0 0 1;0.0158730167895556,0.984126985073090,0;0.0317460335791111,0.968253970146179,0;0.0476190485060215,0.952380955219269,0;0.0634920671582222,0.936507940292358,0;0.0793650820851326,0.920634925365448,0;0.0952380970120430,0.904761910438538,0;0.111111111938953,0.888888895511627,0;0.126984134316444,0.873015880584717,0;0.142857149243355,0.857142865657806,0;0.158730164170265,0.841269850730896,0;0.174603179097176,0.825396835803986,0;0.190476194024086,0.809523820877075,0;0.206349208950996,0.793650805950165,0;0.222222223877907,0.777777791023254,0;0.238095238804817,0.761904776096344,0;0.253968268632889,0.746031761169434,0;0.269841283559799,0.730158746242523,0;0.285714298486710,0.714285731315613,0;0.301587313413620,0.698412716388702,0;0.317460328340530,0.682539701461792,0;0.333333343267441,0.666666686534882,0;0.349206358194351,0.650793671607971,0;0.365079373121262,0.634920656681061,0;0.380952388048172,0.619047641754150,0;0.396825402975082,0.603174626827240,0;0.412698417901993,0.587301611900330,0;0.428571432828903,0.571428596973419,0;0.444444447755814,0.555555582046509,0;0.460317462682724,0.539682567119598,0;0.476190477609634,0.523809552192688,0;0.492063492536545,0.507936537265778,0;0.507936537265778,0.492063492536545,0;0.523809552192688,0.476190477609634,0;0.539682567119598,0.460317462682724,0;0.555555582046509,0.444444447755814,0;0.571428596973419,0.428571432828903,0;0.587301611900330,0.412698417901993,0;0.603174626827240,0.396825402975082,0;0.619047641754150,0.380952388048172,0;0.634920656681061,0.365079373121262,0;0.650793671607971,0.349206358194351,0;0.666666686534882,0.333333343267441,0;0.682539701461792,0.317460328340530,0;0.698412716388702,0.301587313413620,0;0.714285731315613,0.285714298486710,0;0.730158746242523,0.269841283559799,0;0.746031761169434,0.253968268632889,0;0.761904776096344,0.238095238804817,0;0.777777791023254,0.222222223877907,0;0.793650805950165,0.206349208950996,0;0.809523820877075,0.190476194024086,0;0.825396835803986,0.174603179097176,0;0.841269850730896,0.158730164170265,0;0.857142865657806,0.142857149243355,0;0.873015880584717,0.126984134316444,0;0.888888895511627,0.111111111938953,0;0.904761910438538,0.0952380970120430,0;0.920634925365448,0.0793650820851326,0;0.936507940292358,0.0634920671582222,0;0.952380955219269,0.0476190485060215,0;0.968253970146179,0.0317460335791111,0;0.984126985073090,0.0158730167895556,0;1,0,0;];
% matColorMap = [0 1 0;0.0158730167895556,0.984126985073090,0;0.0317460335791111,0.968253970146179,0;0.0476190485060215,0.952380955219269,0;0.0634920671582222,0.936507940292358,0;0.0793650820851326,0.920634925365448,0;0.0952380970120430,0.904761910438538,0;0.111111111938953,0.888888895511627,0;0.126984134316444,0.873015880584717,0;0.142857149243355,0.857142865657806,0;0.158730164170265,0.841269850730896,0;0.174603179097176,0.825396835803986,0;0.190476194024086,0.809523820877075,0;0.206349208950996,0.793650805950165,0;0.222222223877907,0.777777791023254,0;0.238095238804817,0.761904776096344,0;0.253968268632889,0.746031761169434,0;0.269841283559799,0.730158746242523,0;0.285714298486710,0.714285731315613,0;0.301587313413620,0.698412716388702,0;0.317460328340530,0.682539701461792,0;0.333333343267441,0.666666686534882,0;0.349206358194351,0.650793671607971,0;0.365079373121262,0.634920656681061,0;0.380952388048172,0.619047641754150,0;0.396825402975082,0.603174626827240,0;0.412698417901993,0.587301611900330,0;0.428571432828903,0.571428596973419,0;0.444444447755814,0.555555582046509,0;0.460317462682724,0.539682567119598,0;0.476190477609634,0.523809552192688,0;0.492063492536545,0.507936537265778,0;0.507936537265778,0.492063492536545,0;0.523809552192688,0.476190477609634,0;0.539682567119598,0.460317462682724,0;0.555555582046509,0.444444447755814,0;0.571428596973419,0.428571432828903,0;0.587301611900330,0.412698417901993,0;0.603174626827240,0.396825402975082,0;0.619047641754150,0.380952388048172,0;0.634920656681061,0.365079373121262,0;0.650793671607971,0.349206358194351,0;0.666666686534882,0.333333343267441,0;0.682539701461792,0.317460328340530,0;0.698412716388702,0.301587313413620,0;0.714285731315613,0.285714298486710,0;0.730158746242523,0.269841283559799,0;0.746031761169434,0.253968268632889,0;0.761904776096344,0.238095238804817,0;0.777777791023254,0.222222223877907,0;0.793650805950165,0.206349208950996,0;0.809523820877075,0.190476194024086,0;0.825396835803986,0.174603179097176,0;0.841269850730896,0.158730164170265,0;0.857142865657806,0.142857149243355,0;0.873015880584717,0.126984134316444,0;0.888888895511627,0.111111111938953,0;0.904761910438538,0.0952380970120430,0;0.920634925365448,0.0793650820851326,0;0.936507940292358,0.0634920671582222,0;0.952380955219269,0.0476190485060215,0;0.968253970146179,0.0317460335791111,0;0.984126985073090,0.0158730167895556,0;1,0,0;];
% matColorMap = [0,0,0.968253970146179;0.0158730167895556,0,0.952380955219269;0.0317460335791111,0,0.936507940292358;0.0476190485060215,0,0.920634925365448;0.0634920671582222,0,0.904761910438538;0.0793650820851326,0,0.888888895511627;0.0952380970120430,0,0.873015880584717;0.111111111938953,0,0.857142865657806;0.126984134316444,0,0.841269850730896;0.142857149243355,0,0.825396835803986;0.158730164170265,0,0.809523820877075;0.174603179097176,0,0.793650805950165;0.190476194024086,0,0.777777791023254;0.206349208950996,0,0.761904776096344;0.222222223877907,0,0.746031761169434;0.238095238804817,0,0.730158746242523;0.253968268632889,0,0.714285731315613;0.269841283559799,0,0.698412716388702;0.285714298486710,0,0.682539701461792;0.301587313413620,0,0.666666686534882;0.317460328340530,0,0.650793671607971;0.333333343267441,0,0.634920656681061;0.349206358194351,0,0.619047641754150;0.365079373121262,0,0.603174626827240;0.380952388048172,0,0.587301611900330;0.396825402975082,0,0.571428596973419;0.412698417901993,0,0.555555582046509;0.428571432828903,0,0.539682567119598;0.444444447755814,0,0.523809552192688;0.460317462682724,0,0.507936537265778;0.476190477609634,0,0.492063492536545;0.492063492536545,0,0.476190477609634;0.507936537265778,0,0.460317462682724;0.523809552192688,0,0.444444447755814;0.539682567119598,0,0.428571432828903;0.555555582046509,0,0.412698417901993;0.571428596973419,0,0.396825402975082;0.587301611900330,0,0.380952388048172;0.603174626827240,0,0.365079373121262;0.619047641754150,0,0.349206358194351;0.634920656681061,0,0.333333343267441;0.650793671607971,0,0.317460328340530;0.666666686534882,0,0.301587313413620;0.682539701461792,0,0.285714298486710;0.698412716388702,0,0.269841283559799;0.714285731315613,0,0.253968268632889;0.730158746242523,0,0.238095238804817;0.746031761169434,0,0.222222223877907;0.761904776096344,0,0.206349208950996;0.777777791023254,0,0.190476194024086;0.793650805950165,0,0.174603179097176;0.809523820877075,0,0.158730164170265;0.825396835803986,0,0.142857149243355;0.841269850730896,0,0.126984134316444;0.857142865657806,0,0.111111111938953;0.873015880584717,0,0.0952380970120430;0.888888895511627,0,0.0793650820851326;0.904761910438538,0,0.0634920671582222;0.920634925365448,0,0.0476190485060215;0.936507940292358,0,0.0317460335791111;0.952380955219269,0,0.0158730167895556;0.968253970146179,0,0;0.984126985073090,0.0158730167895556,0;1,0,0;]
% matColorMap = imresize(matColorMap,[255,3],'lanczos2');
% matColorMap(matColorMap>1)=1;
% matColorMap(matColorMap<0)=0;

% black-red-yellow-white cmap
%matColorMap = [0,1,0;1,0,0;0,0,1;0.5,0.4,0.2];
%matColorMap = hot(8);
%matColorMap = [1,1,1;0,0.8,0.4;0,0,1];
matColorMap = mymap;
matColorMap = imresize(matColorMap,[255,3],'lanczos2');
matColorMap(matColorMap>1)=1;
matColorMap(matColorMap<0)=0;

if size(matRescaledData,2)==1
    matColoredData = matColorMap(matRescaledData,:);
elseif size(matRescaledData,2)==2
    
    % if there is a second parameter, the first one determines the color.
    % the second when lower values makes the color go more to gray
    matColoredData = matColorMap(matRescaledData(:,1),:);
    
    % calculate how much it takes to transform each color to gray.
    matDifferenceFromGray = repmat([.5 .5 .5],size(matRescaledData,1),1) - matColoredData;

    % make that transformation to gray stepwise depending on second
    % parameter value.
    matStepFactor = 100 * nanzscore(double(matRescaledData(:,2)));
    matStepFactor(matStepFactor<1) = 1;
    
    matColoredData = matColoredData + (matDifferenceFromGray ./ repmat(matStepFactor,1,3));
    
    matColoredData(matColoredData<0) = 0;
    matColoredData(matColoredData>1) = 1;
    
end


matWellPosToDo = [];
if exist('matWells')
    if ~isempty(matWells)
        matWellPosToDo = matWells;
    else
        matWellPosToDo = unique(matCompleteMetaData(:,[1,2]),'rows')';
    end
else
    matWellPosToDo = unique(matCompleteMetaData(:,[1,2]),'rows')';
end   
fprintf('%s: looping over well segmentation images\n',mfilename,strObjectName)

%%%%
% loop over all present well coordinates
for iWellPos = matWellPosToDo;%unique(matCompleteMetaData(:,[1,2]),'rows')'
    
    matCellIX = ismember(matCompleteMetaData(:,[1,2]),iWellPos','rows');
    
    fprintf('well average value = %.3g\n',nanmean(matCompleteData(matCellIX,matFeatureIx)))
    
    matSegImgIX = ismember(matImageWellPositionData,iWellPos','rows');
    
    matSegImg = imread(fullfile(strWellSegmentationPath, cellWellSegmentationFileList{matSegImgIX}));
    
%     if ~(length(unique(matMetaDataWellObjectIDs(matCellIX))) == sum(matCellIX))
%         error('this should not happen :(')
%     end
    
    % make colormap with for each object id value a unique color... (will
    % this work?)
%     matObjectColorMap = zeros(max([matMetaDataWellObjectIDs(matCellIX);unique(matSegImg(matSegImg>0))]),3);
    matObjectColorMap = 0.3 * ones(max([matMetaDataWellObjectIDs(matCellIX);unique(matSegImg(matSegImg>0))]),3);
    
    %%%%%%%%%%%%%%%%%%%%
    %%% CHECK THIS!! %%%
    % sum(matMetaDataWellObjectIDs==0)
    %%% should really not occur!
    % matCellIX(matMetaDataWellObjectIDs(matCellIX)==0)=1;
    
    matObjectColorMap(matMetaDataWellObjectIDs(matCellIX),:) = matColoredData(matCellIX,:);
    
    % color code objects according to measurements
    matRGB = label2rgb(matSegImg, matObjectColorMap, [0,0,0]);
    %matRGB = label2rgb(matSegImg, matObjectColorMap, [1,1,1]);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%% TEMP HACK, DRAW DIVIDING LINES BETWEEN FRAMES %%%
    % shirnk figure a bit
%     matRGB = imresize(matRGB,0.5);
    % draw grey (color = 0.5 0.5 0.5) lines at image borders
    [matSize1,matSize2,matSize3]=size(matRGB);
    matStepSize1 = matSize1 / matStitchDimensions(1);% should come from get_image_snake!!
    matStepSize2 = matSize2 / matStitchDimensions(2);% should come from get_image_snake!!
    matYSteps = 0:matStepSize1:matSize1;matYSteps(1)=1;
    matXSteps = 0:matStepSize2:matSize2;matXSteps(1)=1;
    matRGB(matYSteps,:,:) = intmax(class(matRGB))/2;
    matRGB(:,matXSteps,:) = intmax(class(matRGB))/2;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    figure()
    clf(gcf)
    hold on
    imshow(matRGB)
    colormap(matColorMap);
    colorbar
    hold off
    
    
    strFileName = fullfile(strrep(strWellSegmentationPath,'SEGMENTATION_WELL','JPG'),strrep(cellWellSegmentationFileList{matSegImgIX},'.png',['_',strFinalFieldName{matFeatureIx},'.bmp']));
    imwrite(matRGB,strFileName);
    fprintf('%s: stored %s\n',mfilename,strFileName)

    drawnow
    pause(1)
end


drawnow


 
