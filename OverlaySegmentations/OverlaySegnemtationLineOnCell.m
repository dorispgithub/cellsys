% from NB TS Methods paper 2013 same
%%%%

strDapi = '/Volumes/Doris2TB/170228JUNPFA/TIFF/170228dorisJUN_E07_T0001F022L01A02Z01C03.png';

strDapi = '/Users/dorispopovic/shares/pelkmans-new-fileserver/dpopovic/2019/4i-siRNA/19102019Doris4i-siRNA-C1/images/19102019Doris4i-siRNA-C1_G07_T0001F008L01A01Z01C03.png';

strSegIt   = '/Users/dorispopovic/shares/pelkmans-new-fileserver/dpopovic/2019/4i-siRNA/19102019Doris4i-siRNA-C1/SEGMENTATION/19102019Doris4i-siRNA-C1_G07_T0001F008L01A01Z01C01_SegmentedCells.png';
strSegOrig = '/Users/dorispopovic/shares/pelkmans-new-fileserver/dpopovic/2019/4i-siRNA/19102019Doris4i-siRNA-C1/SEGMENTATION/19102019Doris4i-siRNA-C1_G07_T0001F008L01A01Z01C01_SegmentedCells.png';



Dapi = double(imread(strDapi));
%Succ = double(imread(strSucc));
SegIt = double(imread(strSegIt));
SegOrig = double(imread(strSegOrig));

% backIt = SegIt == 0;
% edgeIt = bwmorph(backIt,'dilate',1) & ~backIt;

objIt = SegIt ~= 0;
edgeIt = bwmorph(objIt,'dilate',1) & ~objIt;


% backOrig = SegOrig == 0;
% edgeOrig = bwmorph(backOrig,'dilate',1) & ~backOrig;

objOrig = SegOrig ~= 0;
edgeOrig = bwmorph(objOrig,'dilate',1) & ~objOrig;


figure;
imshow(SegIt ~= SegOrig)

rDapi = Dapi ./ max(Dapi(:));
rSucc = Succ ./ max(Succ(:));

im = rDapi;



f = edgeIt;

r = im; g=im; b=im;

% adjust the color of outline segentation line
r(f) = 1;
g(f) = 0.5;
b(f) = 0.5;

n = cat(3,r,g,b);

coR = 890:1030;
coC = 1280:1490;

figure;
imshow(n);

%%%

f = edgeOrig;

r = im; g=im; b=im;

r(f) = 1;
g(f) = 0;
b(f) = 0;

n = cat(3,r,g,b);
figure;
imshow(n);
