
% example on how to subset the outliers (residuals) after linear fit 

%% fit LM and mark the cells that fal outside of the 1.5 standard deviation from the line

xdata1 = TPRData(:, 185); % define predictor mRNA
ydata1 = TPRData(:,29); %define unknown protein
lmM1 = fitlm(xdata1, ydata1, 'linear', 'RobustOpts', 'on'); %fit LM
fdata1 = feval(lmM1,xdata1); 
I1 = abs(fdata1 - ydata1) > 1.5*std(ydata1); %find the utliers
outliers1 = excludedata(xdata1,ydata1,'indices',I1); %map their indeces

%% make a plot

h = scatterhist(xdata1, ydata1,'Group',outliers1,'Kernel','on','Location','SouthEast',...
    'Direction','out','Color', Color, ...
    'LineWidth',[1,1],'Marker','.','MarkerSize',[10,10]);
set(h, 'MarkerFaceColor', 'b');
set(h(2), 'MarkerFaceColor', 'r');

%% residuals that are UP or DOWN
% append it as a feature from lm
TPRData(:,288) = table2array(lmM1.Residuals(1:end,1));

% give them different number based on UP or DOWN and UTULIER classification
% and apend new class to dataset (2==UP, 3==DOWN)
inxUP = find(TPRData(:,287)==1&TPRData(:,288)>0);  inxDOWN = find(TPRData(:,287)==1&TPRData(:,288)<0);
TPRData(inxUP,289) = 2;  TPRData(inxDOWN,289) = 3;



