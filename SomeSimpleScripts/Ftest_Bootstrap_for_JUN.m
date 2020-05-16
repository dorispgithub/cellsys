% bootstrap example for comparing two groups

% Example 3: Bootstrapping on a ratio of variances

% A ratio of variances of two samples an F-distribution. 
% An F-test tests the null hypothesis that the two variances are the same (ratio = 1). 
% We can perform a nonparametric version of the f-test using the bootstrap method.

CIrange = 99;
nReps = 1000;

x1 = JUN0D_02(:,27);
x2 = yfit1_1;
% Our statistic is the ratio of the variances

myStatistic = @(x1,x2) var(x1)/var(x2);
% This is our observed value (should be near 1)

sampStat = myStatistic(x1,x2);
% We'll do this manually, rather than call the boostrap program because the program preserves 
% the pair-wise relationship between the two values and can't handle two different sample sizes. 
% This means we won't use the BCa method and instead will use the standard percentiles on our sampled distribution to get the confidence intervals.

bootstrapStat = zeros(1,nReps);
for i=1:nReps
    resampX1 = x1(ceil(rand(size(x1))*length(x1)));
    resampX2 = x2(ceil(rand(size(x2))*length(x2)));
    bootstrapStat(i) = myStatistic(resampX1,resampX2);
end
% Calculate the confidence interval using percentiles.

CI = prctile(bootstrapStat,[50-CIrange/2,50+CIrange/2]);
disp(sprintf('Ratio of variances: %5.2f',sampStat));
disp(sprintf('%d%% Confidence interval: [%5.2f,%5.2f]',CIrange,CI(1),CI(2)));
%Ratio of variances:  0.87
% Confidence interval: [ 0.35, 1.54]
%draw a histogram of the sampled distribution and the confidence intervals.

subplot(5,5,1)

xx = min(bootstrapStat):.01:max(bootstrapStat);
hist(bootstrapStat,xx);
hold on
ylim = get(gca,'YLim');
plot(sampStat*[1,1],ylim,'y-','LineWidth',2);
plot(CI(1)*[1,1],ylim,'r-','LineWidth',2);
plot(CI(2)*[1,1],ylim,'r-','LineWidth',2);
plot([1,1],ylim,'b-','LineWidth',2)
%set(gca,'XTick',[-10:.5:10]);
title('bootstrapping on a ratio of variances');

hold on;

x2 = yfit1_1_;
% Our statistic is the ratio of the variances

myStatistic = @(x1,x2) var(x1)/var(x2);
% This is our observed value (should be near 1)

sampStat = myStatistic(x1,x2);
% We'll do this manually, rather than call the boostrap program because the program preserves 
% the pair-wise relationship between the two values and can't handle two different sample sizes. 
% This means we won't use the BCa method and instead will use the standard percentiles on our sampled distribution to get the confidence intervals.

bootstrapStat = zeros(1,nReps);
for i=1:nReps
    resampX1 = x1(ceil(rand(size(x1))*length(x1)));
    resampX2 = x2(ceil(rand(size(x2))*length(x2)));
    bootstrapStat(i) = myStatistic(resampX1,resampX2);
end
% Calculate the confidence interval using percentiles.

CI = prctile(bootstrapStat,[50-CIrange/2,50+CIrange/2]);
disp(sprintf('Ratio of variances: %5.2f',sampStat));
disp(sprintf('%d%% Confidence interval: [%5.2f,%5.2f]',CIrange,CI(1),CI(2)));
%Ratio of variances:  0.87
% Confidence interval: [ 0.35, 1.54]
%draw a histogram of the sampled distribution and the confidence intervals.

%figure(1)

xx = min(bootstrapStat):.01:max(bootstrapStat);
hist(bootstrapStat,xx);
hold on
ylim = get(gca,'YLim');
plot(sampStat*[1,1],ylim,'g-','LineWidth',2);
plot(CI(1)*[1,1],ylim,'c-','LineWidth',2);
plot(CI(2)*[1,1],ylim,'c-','LineWidth',2);
plot([1,1],ylim,'b-','LineWidth',2)
%set(gca,'XTick',[-10:.5:10]);
title('bootstrapping on a ratio of variances');

%%%%%%%%%%%%%%
x1 = JUN7D_02(:,27);
x2 = yfit1_2;
% Our statistic is the ratio of the variances

myStatistic = @(x1,x2) var(x1)/var(x2);
% This is our observed value (should be near 1)

sampStat = myStatistic(x1,x2);
% We'll do this manually, rather than call the boostrap program because the program preserves 
% the pair-wise relationship between the two values and can't handle two different sample sizes. 
% This means we won't use the BCa method and instead will use the standard percentiles on our sampled distribution to get the confidence intervals.

bootstrapStat = zeros(1,nReps);
for i=1:nReps
    resampX1 = x1(ceil(rand(size(x1))*length(x1)));
    resampX2 = x2(ceil(rand(size(x2))*length(x2)));
    bootstrapStat(i) = myStatistic(resampX1,resampX2);
end
% Calculate the confidence interval using percentiles.

CI = prctile(bootstrapStat,[50-CIrange/2,50+CIrange/2]);
disp(sprintf('Ratio of variances: %5.2f',sampStat));
disp(sprintf('%d%% Confidence interval: [%5.2f,%5.2f]',CIrange,CI(1),CI(2)));
%Ratio of variances:  0.87
% Confidence interval: [ 0.35, 1.54]
%draw a histogram of the sampled distribution and the confidence intervals.

subplot(5,5,2)

xx = min(bootstrapStat):.01:max(bootstrapStat);
hist(bootstrapStat,xx);
hold on
ylim = get(gca,'YLim');
plot(sampStat*[1,1],ylim,'y-','LineWidth',2);
plot(CI(1)*[1,1],ylim,'r-','LineWidth',2);
plot(CI(2)*[1,1],ylim,'r-','LineWidth',2);
plot([1,1],ylim,'b-','LineWidth',2)
%set(gca,'XTick',[-10:.5:10]);
title('bootstrapping on a ratio of variances');

hold on;

x2 = yfit1_2_;
% Our statistic is the ratio of the variances

myStatistic = @(x1,x2) var(x1)/var(x2);
% This is our observed value (should be near 1)

sampStat = myStatistic(x1,x2);
% We'll do this manually, rather than call the boostrap program because the program preserves 
% the pair-wise relationship between the two values and can't handle two different sample sizes. 
% This means we won't use the BCa method and instead will use the standard percentiles on our sampled distribution to get the confidence intervals.

bootstrapStat = zeros(1,nReps);
for i=1:nReps
    resampX1 = x1(ceil(rand(size(x1))*length(x1)));
    resampX2 = x2(ceil(rand(size(x2))*length(x2)));
    bootstrapStat(i) = myStatistic(resampX1,resampX2);
end
% Calculate the confidence interval using percentiles.

CI = prctile(bootstrapStat,[50-CIrange/2,50+CIrange/2]);
disp(sprintf('Ratio of variances: %5.2f',sampStat));
disp(sprintf('%d%% Confidence interval: [%5.2f,%5.2f]',CIrange,CI(1),CI(2)));
%Ratio of variances:  0.87
% Confidence interval: [ 0.35, 1.54]
%draw a histogram of the sampled distribution and the confidence intervals.

%figure(1)

xx = min(bootstrapStat):.01:max(bootstrapStat);
hist(bootstrapStat,xx);
hold on
ylim = get(gca,'YLim');
plot(sampStat*[1,1],ylim,'g-','LineWidth',2);
plot(CI(1)*[1,1],ylim,'c-','LineWidth',2);
plot(CI(2)*[1,1],ylim,'c-','LineWidth',2);
plot([1,1],ylim,'b-','LineWidth',2)
%set(gca,'XTick',[-10:.5:10]);
title('bootstrapping on a ratio of variances');

%%%%%%%%%%%%%%
x1 = JUN15D_02(:,27);
x2 = yfit1_3;
% Our statistic is the ratio of the variances

myStatistic = @(x1,x2) var(x1)/var(x2);
% This is our observed value (should be near 1)

sampStat = myStatistic(x1,x2);
% We'll do this manually, rather than call the boostrap program because the program preserves 
% the pair-wise relationship between the two values and can't handle two different sample sizes. 
% This means we won't use the BCa method and instead will use the standard percentiles on our sampled distribution to get the confidence intervals.

bootstrapStat = zeros(1,nReps);
for i=1:nReps
    resampX1 = x1(ceil(rand(size(x1))*length(x1)));
    resampX2 = x2(ceil(rand(size(x2))*length(x2)));
    bootstrapStat(i) = myStatistic(resampX1,resampX2);
end
% Calculate the confidence interval using percentiles.

CI = prctile(bootstrapStat,[50-CIrange/2,50+CIrange/2]);
disp(sprintf('Ratio of variances: %5.2f',sampStat));
disp(sprintf('%d%% Confidence interval: [%5.2f,%5.2f]',CIrange,CI(1),CI(2)));
%Ratio of variances:  0.87
% Confidence interval: [ 0.35, 1.54]
%draw a histogram of the sampled distribution and the confidence intervals.

subplot(5,5,3)

xx = min(bootstrapStat):.01:max(bootstrapStat);
hist(bootstrapStat,xx);
hold on
ylim = get(gca,'YLim');
plot(sampStat*[1,1],ylim,'y-','LineWidth',2);
plot(CI(1)*[1,1],ylim,'r-','LineWidth',2);
plot(CI(2)*[1,1],ylim,'r-','LineWidth',2);
plot([1,1],ylim,'b-','LineWidth',2)
%set(gca,'XTick',[-10:.5:10]);
title('bootstrapping on a ratio of variances');

hold on;

x2 = yfit1_3_;
% Our statistic is the ratio of the variances

myStatistic = @(x1,x2) var(x1)/var(x2);
% This is our observed value (should be near 1)

sampStat = myStatistic(x1,x2);
% We'll do this manually, rather than call the boostrap program because the program preserves 
% the pair-wise relationship between the two values and can't handle two different sample sizes. 
% This means we won't use the BCa method and instead will use the standard percentiles on our sampled distribution to get the confidence intervals.

bootstrapStat = zeros(1,nReps);
for i=1:nReps
    resampX1 = x1(ceil(rand(size(x1))*length(x1)));
    resampX2 = x2(ceil(rand(size(x2))*length(x2)));
    bootstrapStat(i) = myStatistic(resampX1,resampX2);
end
% Calculate the confidence interval using percentiles.

CI = prctile(bootstrapStat,[50-CIrange/2,50+CIrange/2]);
disp(sprintf('Ratio of variances: %5.2f',sampStat));
disp(sprintf('%d%% Confidence interval: [%5.2f,%5.2f]',CIrange,CI(1),CI(2)));
%Ratio of variances:  0.87
% Confidence interval: [ 0.35, 1.54]
%draw a histogram of the sampled distribution and the confidence intervals.

%figure(1)

xx = min(bootstrapStat):.01:max(bootstrapStat);
hist(bootstrapStat,xx);
hold on
ylim = get(gca,'YLim');
plot(sampStat*[1,1],ylim,'g-','LineWidth',2);
plot(CI(1)*[1,1],ylim,'c-','LineWidth',2);
plot(CI(2)*[1,1],ylim,'c-','LineWidth',2);
plot([1,1],ylim,'b-','LineWidth',2)
%set(gca,'XTick',[-10:.5:10]);
title('bootstrapping on a ratio of variances');


%%%%%%
x1 = JUN20D_02(:,27);
x2 = yfit1_4;
% Our statistic is the ratio of the variances

myStatistic = @(x1,x2) var(x1)/var(x2);
% This is our observed value (should be near 1)

sampStat = myStatistic(x1,x2);
% We'll do this manually, rather than call the boostrap program because the program preserves 
% the pair-wise relationship between the two values and can't handle two different sample sizes. 
% This means we won't use the BCa method and instead will use the standard percentiles on our sampled distribution to get the confidence intervals.

bootstrapStat = zeros(1,nReps);
for i=1:nReps
    resampX1 = x1(ceil(rand(size(x1))*length(x1)));
    resampX2 = x2(ceil(rand(size(x2))*length(x2)));
    bootstrapStat(i) = myStatistic(resampX1,resampX2);
end
% Calculate the confidence interval using percentiles.

CI = prctile(bootstrapStat,[50-CIrange/2,50+CIrange/2]);
disp(sprintf('Ratio of variances: %5.2f',sampStat));
disp(sprintf('%d%% Confidence interval: [%5.2f,%5.2f]',CIrange,CI(1),CI(2)));
%Ratio of variances:  0.87
% Confidence interval: [ 0.35, 1.54]
%draw a histogram of the sampled distribution and the confidence intervals.

subplot(5,5,4)

xx = min(bootstrapStat):.01:max(bootstrapStat);
hist(bootstrapStat,xx);
hold on
ylim = get(gca,'YLim');
plot(sampStat*[1,1],ylim,'y-','LineWidth',2);
plot(CI(1)*[1,1],ylim,'r-','LineWidth',2);
plot(CI(2)*[1,1],ylim,'r-','LineWidth',2);
plot([1,1],ylim,'b-','LineWidth',2)
%set(gca,'XTick',[-10:.5:10]);
title('bootstrapping on a ratio of variances');

hold on;

x2 = yfit1_4_;
% Our statistic is the ratio of the variances

myStatistic = @(x1,x2) var(x1)/var(x2);
% This is our observed value (should be near 1)

sampStat = myStatistic(x1,x2);
% We'll do this manually, rather than call the boostrap program because the program preserves 
% the pair-wise relationship between the two values and can't handle two different sample sizes. 
% This means we won't use the BCa method and instead will use the standard percentiles on our sampled distribution to get the confidence intervals.

bootstrapStat = zeros(1,nReps);
for i=1:nReps
    resampX1 = x1(ceil(rand(size(x1))*length(x1)));
    resampX2 = x2(ceil(rand(size(x2))*length(x2)));
    bootstrapStat(i) = myStatistic(resampX1,resampX2);
end
% Calculate the confidence interval using percentiles.

CI = prctile(bootstrapStat,[50-CIrange/2,50+CIrange/2]);
disp(sprintf('Ratio of variances: %5.2f',sampStat));
disp(sprintf('%d%% Confidence interval: [%5.2f,%5.2f]',CIrange,CI(1),CI(2)));
%Ratio of variances:  0.87
% Confidence interval: [ 0.35, 1.54]
%draw a histogram of the sampled distribution and the confidence intervals.

%figure(1)

xx = min(bootstrapStat):.01:max(bootstrapStat);
hist(bootstrapStat,xx);
hold on
ylim = get(gca,'YLim');
plot(sampStat*[1,1],ylim,'g-','LineWidth',2);
plot(CI(1)*[1,1],ylim,'c-','LineWidth',2);
plot(CI(2)*[1,1],ylim,'c-','LineWidth',2);
plot([1,1],ylim,'b-','LineWidth',2)
%set(gca,'XTick',[-10:.5:10]);
title('bootstrapping on a ratio of variances');

%%%%%%
x1 = JUN30D_02(:,27);
x2 = yfit1_5;
% Our statistic is the ratio of the variances

myStatistic = @(x1,x2) var(x1)/var(x2);
% This is our observed value (should be near 1)

sampStat = myStatistic(x1,x2);
% We'll do this manually, rather than call the boostrap program because the program preserves 
% the pair-wise relationship between the two values and can't handle two different sample sizes. 
% This means we won't use the BCa method and instead will use the standard percentiles on our sampled distribution to get the confidence intervals.

bootstrapStat = zeros(1,nReps);
for i=1:nReps
    resampX1 = x1(ceil(rand(size(x1))*length(x1)));
    resampX2 = x2(ceil(rand(size(x2))*length(x2)));
    bootstrapStat(i) = myStatistic(resampX1,resampX2);
end
% Calculate the confidence interval using percentiles.

CI = prctile(bootstrapStat,[50-CIrange/2,50+CIrange/2]);
disp(sprintf('Ratio of variances: %5.2f',sampStat));
disp(sprintf('%d%% Confidence interval: [%5.2f,%5.2f]',CIrange,CI(1),CI(2)));
%Ratio of variances:  0.87
% Confidence interval: [ 0.35, 1.54]
%draw a histogram of the sampled distribution and the confidence intervals.

subplot(5,5,5)

xx = min(bootstrapStat):.01:max(bootstrapStat);
hist(bootstrapStat,xx);
hold on
ylim = get(gca,'YLim');
plot(sampStat*[1,1],ylim,'y-','LineWidth',2);
plot(CI(1)*[1,1],ylim,'r-','LineWidth',2);
plot(CI(2)*[1,1],ylim,'r-','LineWidth',2);
plot([1,1],ylim,'b-','LineWidth',2)
%set(gca,'XTick',[-10:.5:10]);
title('bootstrapping on a ratio of variances');

hold on;

x2 = yfit1_5_;
% Our statistic is the ratio of the variances

myStatistic = @(x1,x2) var(x1)/var(x2);
% This is our observed value (should be near 1)

sampStat = myStatistic(x1,x2);
% We'll do this manually, rather than call the boostrap program because the program preserves 
% the pair-wise relationship between the two values and can't handle two different sample sizes. 
% This means we won't use the BCa method and instead will use the standard percentiles on our sampled distribution to get the confidence intervals.

bootstrapStat = zeros(1,nReps);
for i=1:nReps
    resampX1 = x1(ceil(rand(size(x1))*length(x1)));
    resampX2 = x2(ceil(rand(size(x2))*length(x2)));
    bootstrapStat(i) = myStatistic(resampX1,resampX2);
end
% Calculate the confidence interval using percentiles.

CI = prctile(bootstrapStat,[50-CIrange/2,50+CIrange/2]);
disp(sprintf('Ratio of variances: %5.2f',sampStat));
disp(sprintf('%d%% Confidence interval: [%5.2f,%5.2f]',CIrange,CI(1),CI(2)));
%Ratio of variances:  0.87
% Confidence interval: [ 0.35, 1.54]
%draw a histogram of the sampled distribution and the confidence intervals.

%figure(1)

xx = min(bootstrapStat):.01:max(bootstrapStat);
hist(bootstrapStat,xx);
hold on
ylim = get(gca,'YLim');
plot(sampStat*[1,1],ylim,'g-','LineWidth',2);
plot(CI(1)*[1,1],ylim,'c-','LineWidth',2);
plot(CI(2)*[1,1],ylim,'c-','LineWidth',2);
plot([1,1],ylim,'b-','LineWidth',2)
%set(gca,'XTick',[-10:.5:10]);
title('bootstrapping on a ratio of variances');

%%%%%%
x1 = JUN40D_02(:,27);
x2 = yfit1_6;
% Our statistic is the ratio of the variances

myStatistic = @(x1,x2) var(x1)/var(x2);
% This is our observed value (should be near 1)

sampStat = myStatistic(x1,x2);
% We'll do this manually, rather than call the boostrap program because the program preserves 
% the pair-wise relationship between the two values and can't handle two different sample sizes. 
% This means we won't use the BCa method and instead will use the standard percentiles on our sampled distribution to get the confidence intervals.

bootstrapStat = zeros(1,nReps);
for i=1:nReps
    resampX1 = x1(ceil(rand(size(x1))*length(x1)));
    resampX2 = x2(ceil(rand(size(x2))*length(x2)));
    bootstrapStat(i) = myStatistic(resampX1,resampX2);
end
% Calculate the confidence interval using percentiles.

CI = prctile(bootstrapStat,[50-CIrange/2,50+CIrange/2]);
disp(sprintf('Ratio of variances: %5.2f',sampStat));
disp(sprintf('%d%% Confidence interval: [%5.2f,%5.2f]',CIrange,CI(1),CI(2)));
%Ratio of variances:  0.87
% Confidence interval: [ 0.35, 1.54]
%draw a histogram of the sampled distribution and the confidence intervals.

subplot(5,5,6)

xx = min(bootstrapStat):.01:max(bootstrapStat);
hist(bootstrapStat,xx);
hold on
ylim = get(gca,'YLim');
plot(sampStat*[1,1],ylim,'y-','LineWidth',2);
plot(CI(1)*[1,1],ylim,'r-','LineWidth',2);
plot(CI(2)*[1,1],ylim,'r-','LineWidth',2);
plot([1,1],ylim,'b-','LineWidth',2)
%set(gca,'XTick',[-10:.5:10]);
title('bootstrapping on a ratio of variances');

hold on;

x2 = yfit1_6_;
% Our statistic is the ratio of the variances

myStatistic = @(x1,x2) var(x1)/var(x2);
% This is our observed value (should be near 1)

sampStat = myStatistic(x1,x2);
% We'll do this manually, rather than call the boostrap program because the program preserves 
% the pair-wise relationship between the two values and can't handle two different sample sizes. 
% This means we won't use the BCa method and instead will use the standard percentiles on our sampled distribution to get the confidence intervals.

bootstrapStat = zeros(1,nReps);
for i=1:nReps
    resampX1 = x1(ceil(rand(size(x1))*length(x1)));
    resampX2 = x2(ceil(rand(size(x2))*length(x2)));
    bootstrapStat(i) = myStatistic(resampX1,resampX2);
end
% Calculate the confidence interval using percentiles.

CI = prctile(bootstrapStat,[50-CIrange/2,50+CIrange/2]);
disp(sprintf('Ratio of variances: %5.2f',sampStat));
disp(sprintf('%d%% Confidence interval: [%5.2f,%5.2f]',CIrange,CI(1),CI(2)));
%figure(1)

xx = min(bootstrapStat):.01:max(bootstrapStat);
hist(bootstrapStat,xx);
hold on
ylim = get(gca,'YLim');
plot(sampStat*[1,1],ylim,'g-','LineWidth',2);
plot(CI(1)*[1,1],ylim,'c-','LineWidth',2);
plot(CI(2)*[1,1],ylim,'c-','LineWidth',2);
plot([1,1],ylim,'b-','LineWidth',2)
%set(gca,'XTick',[-10:.5:10]);
title('bootstrapping on a ratio of variances');

%%%%%%
x1 = JUN60D_02(:,27);
x2 = yfit1_7;
% Our statistic is the ratio of the variances

myStatistic = @(x1,x2) var(x1)/var(x2);
% This is our observed value (should be near 1)

sampStat = myStatistic(x1,x2);
% We'll do this manually, rather than call the boostrap program because the program preserves 
% the pair-wise relationship between the two values and can't handle two different sample sizes. 
% This means we won't use the BCa method and instead will use the standard percentiles on our sampled distribution to get the confidence intervals.

bootstrapStat = zeros(1,nReps);
for i=1:nReps
    resampX1 = x1(ceil(rand(size(x1))*length(x1)));
    resampX2 = x2(ceil(rand(size(x2))*length(x2)));
    bootstrapStat(i) = myStatistic(resampX1,resampX2);
end
% Calculate the confidence interval using percentiles.

CI = prctile(bootstrapStat,[50-CIrange/2,50+CIrange/2]);
disp(sprintf('Ratio of variances: %5.2f',sampStat));
disp(sprintf('%d%% Confidence interval: [%5.2f,%5.2f]',CIrange,CI(1),CI(2)));
%Ratio of variances:  0.87
% Confidence interval: [ 0.35, 1.54]
%draw a histogram of the sampled distribution and the confidence intervals.

subplot(5,5,7)

xx = min(bootstrapStat):.01:max(bootstrapStat);
hist(bootstrapStat,xx);
hold on
ylim = get(gca,'YLim');
plot(sampStat*[1,1],ylim,'y-','LineWidth',2);
plot(CI(1)*[1,1],ylim,'r-','LineWidth',2);
plot(CI(2)*[1,1],ylim,'r-','LineWidth',2);
plot([1,1],ylim,'b-','LineWidth',2)
%set(gca,'XTick',[-10:.5:10]);
title('bootstrapping on a ratio of variances');

hold on;

x2 = yfit1_7_;
% Our statistic is the ratio of the variances

myStatistic = @(x1,x2) var(x1)/var(x2);
% This is our observed value (should be near 1)

sampStat = myStatistic(x1,x2);
% We'll do this manually, rather than call the boostrap program because the program preserves 
% the pair-wise relationship between the two values and can't handle two different sample sizes. 
% This means we won't use the BCa method and instead will use the standard percentiles on our sampled distribution to get the confidence intervals.

bootstrapStat = zeros(1,nReps);
for i=1:nReps
    resampX1 = x1(ceil(rand(size(x1))*length(x1)));
    resampX2 = x2(ceil(rand(size(x2))*length(x2)));
    bootstrapStat(i) = myStatistic(resampX1,resampX2);
end
% Calculate the confidence interval using percentiles.

CI = prctile(bootstrapStat,[50-CIrange/2,50+CIrange/2]);
disp(sprintf('Ratio of variances: %5.2f',sampStat));
disp(sprintf('%d%% Confidence interval: [%5.2f,%5.2f]',CIrange,CI(1),CI(2)));
%figure(1)

xx = min(bootstrapStat):.01:max(bootstrapStat);
hist(bootstrapStat,xx);
hold on
ylim = get(gca,'YLim');
plot(sampStat*[1,1],ylim,'g-','LineWidth',2);
plot(CI(1)*[1,1],ylim,'c-','LineWidth',2);
plot(CI(2)*[1,1],ylim,'c-','LineWidth',2);
plot([1,1],ylim,'b-','LineWidth',2)
%set(gca,'XTick',[-10:.5:10]);
title('bootstrapping on a ratio of variances');

%%%%%%
x1 = JUN90D_02(:,27);
x2 = yfit1_8;
% Our statistic is the ratio of the variances

myStatistic = @(x1,x2) var(x1)/var(x2);
% This is our observed value (should be near 1)

sampStat = myStatistic(x1,x2);
% We'll do this manually, rather than call the boostrap program because the program preserves 
% the pair-wise relationship between the two values and can't handle two different sample sizes. 
% This means we won't use the BCa method and instead will use the standard percentiles on our sampled distribution to get the confidence intervals.

bootstrapStat = zeros(1,nReps);
for i=1:nReps
    resampX1 = x1(ceil(rand(size(x1))*length(x1)));
    resampX2 = x2(ceil(rand(size(x2))*length(x2)));
    bootstrapStat(i) = myStatistic(resampX1,resampX2);
end
% Calculate the confidence interval using percentiles.

CI = prctile(bootstrapStat,[50-CIrange/2,50+CIrange/2]);
disp(sprintf('Ratio of variances: %5.2f',sampStat));
disp(sprintf('%d%% Confidence interval: [%5.2f,%5.2f]',CIrange,CI(1),CI(2)));
%Ratio of variances:  0.87
% Confidence interval: [ 0.35, 1.54]
%draw a histogram of the sampled distribution and the confidence intervals.

subplot(5,5,8)

xx = min(bootstrapStat):.01:max(bootstrapStat);
hist(bootstrapStat,xx);
hold on
ylim = get(gca,'YLim');
plot(sampStat*[1,1],ylim,'y-','LineWidth',2);
plot(CI(1)*[1,1],ylim,'r-','LineWidth',2);
plot(CI(2)*[1,1],ylim,'r-','LineWidth',2);
plot([1,1],ylim,'b-','LineWidth',2)
%set(gca,'XTick',[-10:.5:10]);
title('bootstrapping on a ratio of variances');

hold on;

x2 = yfit1_8_;
% Our statistic is the ratio of the variances

myStatistic = @(x1,x2) var(x1)/var(x2);
% This is our observed value (should be near 1)

sampStat = myStatistic(x1,x2);
% We'll do this manually, rather than call the boostrap program because the program preserves 
% the pair-wise relationship between the two values and can't handle two different sample sizes. 
% This means we won't use the BCa method and instead will use the standard percentiles on our sampled distribution to get the confidence intervals.

bootstrapStat = zeros(1,nReps);
for i=1:nReps
    resampX1 = x1(ceil(rand(size(x1))*length(x1)));
    resampX2 = x2(ceil(rand(size(x2))*length(x2)));
    bootstrapStat(i) = myStatistic(resampX1,resampX2);
end
% Calculate the confidence interval using percentiles.

CI = prctile(bootstrapStat,[50-CIrange/2,50+CIrange/2]);
disp(sprintf('Ratio of variances: %5.2f',sampStat));
disp(sprintf('%d%% Confidence interval: [%5.2f,%5.2f]',CIrange,CI(1),CI(2)));
%figure(1)

xx = min(bootstrapStat):.01:max(bootstrapStat);
hist(bootstrapStat,xx);
hold on
ylim = get(gca,'YLim');
plot(sampStat*[1,1],ylim,'g-','LineWidth',2);
plot(CI(1)*[1,1],ylim,'c-','LineWidth',2);
plot(CI(2)*[1,1],ylim,'c-','LineWidth',2);
plot([1,1],ylim,'b-','LineWidth',2)
%set(gca,'XTick',[-10:.5:10]);
title('bootstrapping on a ratio of variances');

%%%%%%
x1 = JUN210D_02(:,27);
x2 = yfit1_9;
% Our statistic is the ratio of the variances

myStatistic = @(x1,x2) var(x1)/var(x2);
% This is our observed value (should be near 1)

sampStat = myStatistic(x1,x2);
% We'll do this manually, rather than call the boostrap program because the program preserves 
% the pair-wise relationship between the two values and can't handle two different sample sizes. 
% This means we won't use the BCa method and instead will use the standard percentiles on our sampled distribution to get the confidence intervals.

bootstrapStat = zeros(1,nReps);
for i=1:nReps
    resampX1 = x1(ceil(rand(size(x1))*length(x1)));
    resampX2 = x2(ceil(rand(size(x2))*length(x2)));
    bootstrapStat(i) = myStatistic(resampX1,resampX2);
end
% Calculate the confidence interval using percentiles.

CI = prctile(bootstrapStat,[50-CIrange/2,50+CIrange/2]);
disp(sprintf('Ratio of variances: %5.2f',sampStat));
disp(sprintf('%d%% Confidence interval: [%5.2f,%5.2f]',CIrange,CI(1),CI(2)));
%Ratio of variances:  0.87
% Confidence interval: [ 0.35, 1.54]
%draw a histogram of the sampled distribution and the confidence intervals.

subplot(5,5,9)

xx = min(bootstrapStat):.01:max(bootstrapStat);
hist(bootstrapStat,xx);
hold on
ylim = get(gca,'YLim');
plot(sampStat*[1,1],ylim,'y-','LineWidth',2);
plot(CI(1)*[1,1],ylim,'r-','LineWidth',2);
plot(CI(2)*[1,1],ylim,'r-','LineWidth',2);
plot([1,1],ylim,'b-','LineWidth',2)
%set(gca,'XTick',[-10:.5:10]);
title('bootstrapping on a ratio of variances');

hold on;

x2 = yfit1_9_;
% Our statistic is the ratio of the variances

myStatistic = @(x1,x2) var(x1)/var(x2);
% This is our observed value (should be near 1)

sampStat = myStatistic(x1,x2);
% We'll do this manually, rather than call the boostrap program because the program preserves 
% the pair-wise relationship between the two values and can't handle two different sample sizes. 
% This means we won't use the BCa method and instead will use the standard percentiles on our sampled distribution to get the confidence intervals.

bootstrapStat = zeros(1,nReps);
for i=1:nReps
    resampX1 = x1(ceil(rand(size(x1))*length(x1)));
    resampX2 = x2(ceil(rand(size(x2))*length(x2)));
    bootstrapStat(i) = myStatistic(resampX1,resampX2);
end
% Calculate the confidence interval using percentiles.

CI = prctile(bootstrapStat,[50-CIrange/2,50+CIrange/2]);
disp(sprintf('Ratio of variances: %5.2f',sampStat));
disp(sprintf('%d%% Confidence interval: [%5.2f,%5.2f]',CIrange,CI(1),CI(2)));
%figure(1)

xx = min(bootstrapStat):.01:max(bootstrapStat);
hist(bootstrapStat,xx);
hold on
ylim = get(gca,'YLim');
plot(sampStat*[1,1],ylim,'g-','LineWidth',2);
plot(CI(1)*[1,1],ylim,'c-','LineWidth',2);
plot(CI(2)*[1,1],ylim,'c-','LineWidth',2);
plot([1,1],ylim,'b-','LineWidth',2)
%set(gca,'XTick',[-10:.5:10]);
title('bootstrapping on a ratio of variances');

%%%%%%



gcf2pdf('/Users/dorispopovic/Dropbox/Unsorted/', 'bootstrap_on_ratio_of_variances_Ftest_JUNtimepoints');

subplot(2,3,1)
notBoxPlot(-log10(pvaluesF));
gcf2pdf('/Users/dorispopovic/Dropbox/Unsorted/', 'heatmap_MLRs_corrected');





% and vartest2
[h01,p01,ks2stat01] = vartest2(JUN0D_02(:,27), yfit1_1); %only autonomous
[h02,p02,ks2stat02] = vartest2(JUN7D_02(:,27), yfit1_2);
[h03,p03,ks2stat03] = vartest2(JUN15D_02(:,27), yfit1_3);
[h04,p04,ks2stat04] = vartest2(JUN20D_02(:,27), yfit1_4);
[h05,p05,ks2stat05] = vartest2(JUN30D_02(:,27), yfit1_5);
[h06,p06,ks2stat06] = vartest2(JUN40D_02(:,27), yfit1_6);
[h07,p07,ks2stat07] = vartest2(JUN60D_02(:,27), yfit1_7);
[h08,p08,ks2stat08] = vartest2(JUN90D_02(:,27), yfit1_8);
[h09,p09,ks2stat09] = vartest2(JUN210D_02(:,27), yfit1_9);

%%%%
[h01_,p01_,ks2stat01_] = vartest2(JUN0D_02(:,27), yfit1_1_); % mRNA and autonomous
[h02_,p02_,ks2stat02_] = vartest2(JUN7D_02(:,27), yfit1_2_);
[h03_,p03_,ks2stat03_] = vartest2(JUN15D_02(:,27), yfit1_3_);
[h04_,p04_,ks2stat04_] = vartest2(JUN20D_02(:,27), yfit1_4_);
[h05_,p05_,ks2stat05_] = vartest2(JUN30D_02(:,27), yfit1_5_);
[h06_,p06_,ks2stat06_] = vartest2(JUN40D_02(:,27), yfit1_6_);
[h07_,p07_,ks2stat07_] = vartest2(JUN60D_02(:,27), yfit1_7_);
[h08_,p08_,ks2stat08_] = vartest2(JUN90D_02(:,27), yfit1_8_);
[h09_,p09_,ks2stat09_] = vartest2(JUN210D_02(:,27), yfit1_9_);
%%%%

