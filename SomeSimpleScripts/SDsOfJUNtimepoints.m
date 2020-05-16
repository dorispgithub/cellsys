%%% lets try to mark the outliers that fall into ceratin level of
 %%% stds
xdata1 = JUN0(:, 183); ydata1 = JUN0(:,27);
lmM1 = fitlm(xdata1, ydata1, 'linear', 'RobustOpts', 'on'); %X is a data matrix where each column is a predictor and each row is a cell
%
xdata2 = JUN7(:, 183); ydata2 = JUN7(:,27);
lmM2 = fitlm(xdata2, ydata2, 'linear', 'RobustOpts', 'on');
%
xdata3 = JUN15(:, 183); ydata3 = JUN15(:,27);
lmM3 = fitlm(xdata3, ydata3, 'linear', 'RobustOpts', 'on');
%
xdata4 = JUN20(:, 183); ydata4 = JUN20(:,27);
lmM4 = fitlm(xdata4, ydata4, 'linear', 'RobustOpts', 'on');
%
xdata5 = JUN30(:, 183); ydata5 = JUN30(:,27);
lmM5 = fitlm(xdata5, ydata5, 'linear', 'RobustOpts', 'on'); %X is a data matrix where each column is a predictor and each row is a cell
%
xdata6 = JUN40(:, 183); ydata6 = JUN40(:,27);
lmM6 = fitlm(xdata6, ydata6, 'linear', 'RobustOpts', 'on');
%
xdata7 = JUN60(:, 183); ydata7 = JUN60(:,27);
lmM7 = fitlm(xdata7, ydata7, 'linear', 'RobustOpts', 'on');
%
xdata8 = JUN90(:, 183); ydata8 = JUN90(:,27);
lmM8 = fitlm(xdata8, ydata8, 'linear', 'RobustOpts', 'on');
%
xdata9 = JUN210(:, 183); ydata9 = JUN210(:,27);
lmM9 = fitlm(xdata9, ydata9, 'linear', 'RobustOpts', 'on'); %X is a data matrix where each column is a predictor and each row is a cell
%

%%%% now detect ouliers of the linear fit and generate the plots, NOTE: 3
%%%% stds are too much freedom, you can set threshold of 1-1.5 std, that
%%%% makes way more sense


fdata1 = feval(lmM1,xdata1); fdata2 = feval(lmM2,xdata2); fdata3 = feval(lmM3,xdata3); fdata4 = feval(lmM4,xdata4);
fdata5 = feval(lmM5,xdata5); fdata6 = feval(lmM6,xdata6); fdata7 = feval(lmM7,xdata7); fdata8 = feval(lmM8,xdata8);
fdata9 = feval(lmM9,xdata9); 

I1 = abs(fdata1 - ydata1) > 1.5*std(ydata1);
outliers1 = excludedata(xdata1,ydata1,'indices',I1);
I2 = abs(fdata2 - ydata2) > 1.5*std(ydata2);
outliers2 = excludedata(xdata2,ydata2,'indices',I2);
I3 = abs(fdata3 - ydata3) > 1.5*std(ydata3);
outliers3 = excludedata(xdata3,ydata3,'indices',I3);
I4 = abs(fdata4 - ydata4) > 1.5*std(ydata4);
outliers4 = excludedata(xdata4,ydata4,'indices',I4);
I5 = abs(fdata5 - ydata5) > 1.5*std(ydata5);
outliers5 = excludedata(xdata5,ydata5,'indices',I5);
I6 = abs(fdata6 - ydata6) > 1.5*std(ydata6);
outliers6 = excludedata(xdata6,ydata6,'indices',I6);
I7 = abs(fdata7 - ydata7) > 1.5*std(ydata7);
outliers7 = excludedata(xdata7,ydata7,'indices',I7);
I8 = abs(fdata8 - ydata8) > 1.5*std(ydata8);
outliers8 = excludedata(xdata8,ydata8,'indices',I8);
I9 = abs(fdata9 - ydata9) > 1.5*std(ydata9);
outliers9 = excludedata(xdata9,ydata9,'indices',I9);



%%%% 1 std
I1 = abs(fdata1 - ydata1) > 1*std(ydata1);
outliers1 = excludedata(xdata1,ydata1,'indices',I1);
I2 = abs(fdata2 - ydata2) > 1*std(ydata2);
outliers2 = excludedata(xdata2,ydata2,'indices',I2);
I3 = abs(fdata3 - ydata3) > 1*std(ydata3);
outliers3 = excludedata(xdata3,ydata3,'indices',I3);
I4 = abs(fdata4 - ydata4) > 1*std(ydata4);
outliers4 = excludedata(xdata4,ydata4,'indices',I4);
I5 = abs(fdata5 - ydata5) > 1*std(ydata5);
outliers5 = excludedata(xdata5,ydata5,'indices',I5);
I6 = abs(fdata6 - ydata6) > 1*std(ydata6);
outliers6 = excludedata(xdata6,ydata6,'indices',I6);
I7 = abs(fdata7 - ydata7) > 1*std(ydata7);
outliers7 = excludedata(xdata7,ydata7,'indices',I7);
I8 = abs(fdata8 - ydata8) > 1*std(ydata8);
outliers8 = excludedata(xdata8,ydata8,'indices',I8);
I9 = abs(fdata9 - ydata9) > 1*std(ydata9);
outliers9 = excludedata(xdata9,ydata9,'indices',I9);



Color = [0.3 0.3 0.7; 0.9 0.4 0.4];
figure;
scatterhist(xdata1, ydata1,'Group',outliers1,'Kernel','on','Location','SouthEast',...
    'Direction','out','Color', Color, ...
    'LineWidth',[1,1],'Marker','.','MarkerSize',[10,10]);
gcf2pdf('/Volumes/Doris2TB/DataForFigures/JUNplots/Outliers/','JUN0');
figure;
scatterhist(xdata2, ydata2,'Group',outliers2,'Kernel','on','Location','SouthEast',...
    'Direction','out','Color', Color, ...
    'LineWidth',[1,1],'Marker','.','MarkerSize',[10,10]);
gcf2pdf('/Volumes/Doris2TB/DataForFigures/JUNplots/Outliers/','JUN7');
figure;
scatterhist(xdata3, ydata3,'Group',outliers3,'Kernel','on','Location','SouthEast',...
    'Direction','out','Color', Color, ...
    'LineWidth',[1,1],'Marker','.','MarkerSize',[10,10]);
gcf2pdf('/Volumes/Doris2TB/DataForFigures/JUNplots/Outliers/','JUN15');
figure;
scatterhist(xdata4, ydata4,'Group',outliers4,'Kernel','on','Location','SouthEast',...
    'Direction','out','Color', Color, ...
    'LineWidth',[1,1],'Marker','.','MarkerSize',[10,10]);
gcf2pdf('/Volumes/Doris2TB/DataForFigures/JUNplots/Outliers/','JUN20');
figure;
scatterhist(xdata5, ydata5,'Group',outliers5,'Kernel','on','Location','SouthEast',...
    'Direction','out','Color', Color, ...
    'LineWidth',[1,1],'Marker','.','MarkerSize',[10,10]);
gcf2pdf('/Volumes/Doris2TB/DataForFigures/JUNplots/Outliers/','JUN30');
figure;
scatterhist(xdata6, ydata6,'Group',outliers6,'Kernel','on','Location','SouthEast',...
    'Direction','out','Color', Color, ...
    'LineWidth',[1,1],'Marker','.','MarkerSize',[10,10]);
gcf2pdf('/Volumes/Doris2TB/DataForFigures/JUNplots/Outliers/','JUN40');
figure;
scatterhist(xdata7, ydata7,'Group',outliers7,'Kernel','on','Location','SouthEast',...
    'Direction','out','Color', Color, ...
    'LineWidth',[1,1],'Marker','.','MarkerSize',[10,10]);
gcf2pdf('/Volumes/Doris2TB/DataForFigures/JUNplots/Outliers/','JUN60');
figure;
scatterhist(xdata8, ydata8,'Group',outliers8,'Kernel','on','Location','SouthEast',...
    'Direction','out','Color', Color, ...
    'LineWidth',[1,1],'Marker','.','MarkerSize',[10,10]);
gcf2pdf('/Volumes/Doris2TB/DataForFigures/JUNplots/Outliers/','JUN90');
figure;
scatterhist(xdata9, ydata9,'Group',outliers9,'Kernel','on','Location','SouthEast',...
    'Direction','out','Color', Color, ...
    'LineWidth',[1,1],'Marker','.','MarkerSize',[10,10]);
gcf2pdf('/Volumes/Doris2TB/DataForFigures/JUNplots/Outliers/','JUN210');










