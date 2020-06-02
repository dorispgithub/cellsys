function [Zscore, MAD, Bscore, SmoothBscore, correctionfactor, smoothedcorrectionfactor] = bscore2(input)
%function bcore2
%   B-Score2 normalizes a matrix to 0 median dividing by its MAD, while
%   taking away row and column median effects
%   Edited by Pauli 29.5.2007 (Calculates also Zscore, "Mad", standard B-score, and smooth B-score normalizations)
%
%   USAGE: [Zscore, "MAD", B-score, Smooth B-score] = bscore(input)

output = zeros(size(input));
correctionfactor = zeros(size(input));
smoothedoutput = zeros(size(input));
normalizedoutput = zeros(size(input));
smoothedinput = zeros(size(input));

if nargin == 0
    error('not enough input arguments')
end

rows = [];
column = [];

totalmed=nanmedian(input(:));
totalmad=mad2(input(:))/0.6745;
normalizedoutput=(input-totalmed)/totalmad;

for row=1:size(input,1)
    rowmed=median2(input(row,:))-totalmed;
    rows(row) = rowmed;    
    for column=1:size(input,2)
        columed=median2(input(:,column))-totalmed;
        cols(column) = columed;        
        %We could add some multipliers before rowmed and columed if the spatial normalization is too strong
        output(row,column)=(input(row,column)-rowmed-columed);
        correctionfactor(row,column)=rowmed+columed;        
    end
end

% STANDARD B-SCORE
totalmed=nanmedian(output(:));
totalmad=mad2(output(:))/0.6745;
Bscore=(output-totalmed)/totalmad;

% BEREND'S SMOOTHED B-SCORE
H = fspecial('disk',4);

correctionfactor(find(isnan(correctionfactor))) = nanmedian(correctionfactor(:));
correctionfactor(find(isinf(correctionfactor))) = nanmedian(correctionfactor(:));
smoothedcorrectionfactor = imfilter(correctionfactor,H,'replicate');

smoothedoutput = input - smoothedcorrectionfactor;
smoothtotalmedian=median2(smoothedoutput(:));
smoothtotalmad=mad2(smoothedoutput(:))/0.6745;
SmoothBscore = (smoothedoutput - smoothtotalmedian)/smoothtotalmad;

% ZSCORE
% Zscore=input-mean2(input(:));
% Zscore=Zscore./std2(Zscore(:));
% MADE SAME AS MATLAB DEFINITION OF Z-SCORE (see 'help zscore')
Zscore = (input-mean2(input))./std2(input);

% "MAD" 
% MAD=input-median2(input(:));
% MAD=MAD/mad2(MAD(:));
MAD = (input-median2(input))./mad2(input);