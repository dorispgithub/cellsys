

%% Enter data, plot and calculate statistic

% set sizes
m=5000;  % number of samples in distribution
n=2;   % number of distributions
r=10000;  % number of repeats for generating probability distribution

% generate random sample for demonstration - put your data here
f1 = [(RANBP2Data(1:5000, 29)), (RANBP2datawof(1:5000,33))];
x=f1;

% plot data
y=(0:m-1)'/(m-1); % distribution from 0 to 1
figure
subplot(3,4,1)
plot(sort(x),y)
xlabel('Data values')
ylabel('Probability')
title('Cumulative distributions of data')

%gcf2pdf('/Volumes/Doris2TB/JEcells-wo-FISH/Plots_compareGFP_woFISH_wiFISH/', 'PLK1compare');

% and statistic for this sample
s=multiKS(x)
disp(' ')
legend(['Statistic for this sample  ',num2str(s)])
gcf2pdf('/Volumes/Doris2TB/JEcells-wo-FISH/Plots_compareGFP_woFISH_wiFISH/', 'RANBP2compare');

% generate random sample for demonstration - put your data here
x=f2;

% plot data
y=(0:m-1)'/(m-1); % distribution from 0 to 1

subplot(3,4,2)
plot(sort(x),y)
xlabel('Data values')
ylabel('Probability')
title('Cumulative distributions of data')

% and statistic for this sample
s=multiKS(x);
disp(' ')
disp(['Statistic for this sample  ',num2str(s)])

% generate random sample for demonstration - put your data here
x=f3;

% plot data
y=(0:m-1)'/(m-1); % distribution from 0 to 1

subplot(3,4,3)
plot(sort(x),y)
xlabel('Data values')
ylabel('Probability')
title('Cumulative distributions of data')

% and statistic for this sample
s=multiKS(x);
disp(' ')
disp(['Statistic for this sample  ',num2str(s)])


% generate random sample for demonstration - put your data here
x=f4;

% plot data
y=(0:m-1)'/(m-1); % distribution from 0 to 1

subplot(3,4,4)
plot(sort(x),y)
xlabel('Data values')
ylabel('Probability')
title('Cumulative distributions of data')

% and statistic for this sample
s=multiKS(x);
disp(' ')
disp(['Statistic for this sample  ',num2str(s)])


gcf2pdf('/Volumes/Doris2TB/Figures_opt/AddShToFIG4/', 'CumulativeDistributionsOfCellsPerTImepointMainFeaturesUsedForBinning');


%% Generate distribution for this statistic and plot

% probability and sorted distribution samples for the statisitic
disp(' ')
tic;[ps,d]=probKS(x);toc

disp(' ')
disp('Probability of statistic being that large ')
disp([' (upper tail) due to random variation only  ',num2str(ps)])

%% Plot distribution and statistic value

y=(0:r-1)'/(r-1);
figure
plot(d,y)
xlabel('Statistic value')
ylabel('Probability')
title('Position of data statistic on random cumulative distribution')
hold on
plot(s,1-ps,'r*')
legend('Distribution','Sample','Location','NorthWest')

