
minPixGreen = 110;
maxPixGreen = 200;

minPixBlue = 110;
maxPixBlue = 300;

% strSeg =    '/Volumes/Doris2TB/170228JUNPFA/SEGMENTATION/170228dorisJUN_D07_T0001F035L01A01Z01C01_SegmentedCells.png';
% strGreen =  '/Volumes/Doris2TB/170228JUNPFA/TIFF/170228dorisJUN_D07_T0001F035L01A02Z01C03.png';
% strBlue =   '/Volumes/Doris2TB/170228JUNPFA/TIFF/170228dorisJUN_D07_T0001F035L01A01Z01C01.png';
% strOutName = 'test.png';


strSeg =    '/Volumes/Doris2TB/170228JUNPFA/SEGMENTATION/170228dorisJUN_D07_T0001F004L01A01Z01C01_SegmentedCells.png';
strGreen =  '/Volumes/Doris2TB/170228JUNPFA/TIFF/170228dorisJUN_D07_T0001F004L01A02Z01C03.png';
strBlue =   '/Volumes/Doris2TB/170228JUNPFA/TIFF/170228dorisJUN_D07_T0001F004L01A01Z01C01.png';
strOutName = 'test.png';



% for j=1:length(S)
%     strSeg = S{j}.strSeg;
%     strGreen = S{j}.strGreen;
%     strBlue = S{j}.strBlue;
%     strOutName = S{j}.strOutName;
    
    SegImage = double(imread(strSeg));
    OrigGreen = double(imread(strGreen));
    OrigBlue = double(imread(strBlue));
    
    
    DilBackground = bwmorph(SegImage==0,'dilate',1);
    Edge = DilBackground & SegImage ~= 0;
    
    figure; imagesc(Edge)
    
   
    RescaledGreen = (OrigGreen - minPixGreen) ./ (maxPixGreen - minPixGreen);
    RescaledGreen(RescaledGreen>1) = 1;
    RescaledGreen(RescaledGreen<0) = 0;
    
    RescaledBlue = (OrigBlue - minPixBlue) ./ (maxPixBlue - minPixBlue);
    RescaledBlue(RescaledBlue>1) = 1;
    RescaledBlue(RescaledBlue<0) = 0;
    
    combinedImage = zeros(size(OrigGreen,1), size(OrigGreen,2), 3);
    combinedImage(:,:,2) = RescaledGreen;
    combinedImage(:,:,3) = RescaledBlue;
    
    
    rEdge = repmat(Edge, [1 1 3]);
    combinedImage(rEdge) = 1;
    imshow(combinedImage);
    imwrite(combinedImage, strOutName);
    
% end






