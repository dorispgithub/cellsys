
% bootstrap example for comparing two groups

% Example 3: Bootstrapping on a ratio of variances

% A ratio of variances of two samples an F-distribution. 
% An F-test tests the null hypothesis that the two variances are the same (ratio = 1). 
% We can perform a nonparametric version of the f-test using the bootstrap method.

CIrange = 95;
nReps = 1000;

x1 = PLK1D_02(:,29);
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

subplot(5,4,1)

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
x1 = NCAPD3D_02(:,29);
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

subplot(5,4,2)

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
x1 = CEP192D_02(:,29);
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

subplot(5,4,3)

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
x1 = NCAPHD_02(:,29);
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

subplot(5,4,4)

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
x1 = NCAPD2D_02(:,29);
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

subplot(5,4,5)

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
x1 = TPRD_02(:,29);
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

subplot(5,4,6)

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
x1 = NUP214D_02(:,29);
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

subplot(5,4,7)

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
x1 = RANBP2D_02(:,29);
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

subplot(5,4,8)

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
x1 = SMC4D_02(:,29);
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

subplot(5,4,9)

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
x1 = AURKBD_02(:,29);
x2 = yfit1_10;
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

subplot(5,4,10)

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

x2 = yfit1_10_;
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
x1 = NUP107D_02(:,29);
x2 = yfit1_11;
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

subplot(5,4,11)

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

x2 = yfit1_11_;
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
x1 = TFRCD_02(:,29);
x2 = yfit1_12;
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

subplot(5,4,12)

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

x2 = yfit1_12_;
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
x1 = LAMP1D_02(:,29);
x2 = yfit1_13;
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

subplot(5,4,13)

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

x2 = yfit1_13_;
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
x1 = EEA1D_02(:,29);
x2 = yfit1_14;
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

subplot(5,4,14)

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

x2 = yfit1_14_;
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
x1 = VPS35D_02(:,29);
x2 = yfit1_15;
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

subplot(5,4,15)

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

x2 = yfit1_15_;
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
x1 = ACTBD_02(:,29);
x2 = yfit1_16;
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

subplot(5,4,16)

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

x2 = yfit1_16_;
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

gcf2pdf('/Users/dorispopovic/Dropbox/Unsorted/', 'bootstrap_on_ratio_of_variances_Ftest');















































%%%% You can also make this all as a set of boxplots, so Lucas can chose.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%



CIrange = 95;
nReps = 1000;

x1 = PLK1D_02(:,29);
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

xx = min(bootstrapStat):.01:max(bootstrapStat);
notBoxPlot(bootstrapStat,1);

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
notBoxPlot(bootstrapStat,2);


%%%%%%%%%%%%%%
x1 = NCAPD3D_02(:,29);
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
xx = min(bootstrapStat):.01:max(bootstrapStat);
notBoxPlot(bootstrapStat,3);


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
notBoxPlot(bootstrapStat,4);


%%%%%%%%%%%%%%
x1 = CEP192D_02(:,29);
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
xx = min(bootstrapStat):.01:max(bootstrapStat);
notBoxPlot(bootstrapStat,5);

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
notBoxPlot(bootstrapStat,6);


%%%%%%
x1 = NCAPHD_02(:,29);
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
xx = min(bootstrapStat):.01:max(bootstrapStat);
notBoxPlot(bootstrapStat,7);


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
notBoxPlot(bootstrapStat,8);

%%%%%%
x1 = NCAPD2D_02(:,29);
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

xx = min(bootstrapStat):.01:max(bootstrapStat);
notBoxPlot(bootstrapStat,9);


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
notBoxPlot(bootstrapStat,10);

%%%%%%
x1 = TPRD_02(:,29);
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

xx = min(bootstrapStat):.01:max(bootstrapStat);
notBoxPlot(bootstrapStat,11);

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
notBoxPlot(bootstrapStat,12);


%%%%%%
x1 = NUP214D_02(:,29);
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

xx = min(bootstrapStat):.01:max(bootstrapStat);
notBoxPlot(bootstrapStat,13);

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
notBoxPlot(bootstrapStat,14);


%%%%%%
x1 = RANBP2D_02(:,29);
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

xx = min(bootstrapStat):.01:max(bootstrapStat);
notBoxPlot(bootstrapStat,15);


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
notBoxPlot(bootstrapStat,16);


%%%%%%
x1 = SMC4D_02(:,29);
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

xx = min(bootstrapStat):.01:max(bootstrapStat);
notBoxPlot(bootstrapStat,17);


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
notBoxPlot(bootstrapStat,18);
%%%%%%
x1 = AURKBD_02(:,29);
x2 = yfit1_10;
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
xx = min(bootstrapStat):.01:max(bootstrapStat);
notBoxPlot(bootstrapStat,19);


hold on;

x2 = yfit1_10_;
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
notBoxPlot(bootstrapStat,20);



%%%%%%
x1 = NUP107D_02(:,29);
x2 = yfit1_11;
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

xx = min(bootstrapStat):.01:max(bootstrapStat);
notBoxPlot(bootstrapStat,21);

hold on;

x2 = yfit1_11_;
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
notBoxPlot(bootstrapStat,22);

%%%%%%
x1 = TFRCD_02(:,29);
x2 = yfit1_12;
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


xx = min(bootstrapStat):.01:max(bootstrapStat);
notBoxPlot(bootstrapStat,23);

hold on;

x2 = yfit1_12_;
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
notBoxPlot(bootstrapStat,24);

%%%%%%
x1 = LAMP1D_02(:,29);
x2 = yfit1_13;
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


xx = min(bootstrapStat):.01:max(bootstrapStat);
hist(bootstrapStat,xx);
notBoxPlot(bootstrapStat,25);

hold on;

x2 = yfit1_13_;
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
notBoxPlot(bootstrapStat,26);


%%%%%%
x1 = EEA1D_02(:,29);
x2 = yfit1_14;
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


xx = min(bootstrapStat):.01:max(bootstrapStat);
hist(bootstrapStat,xx);
notBoxPlot(bootstrapStat,27);

hold on;

x2 = yfit1_14_;
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
notBoxPlot(bootstrapStat,28);


%%%%%%
x1 = VPS35D_02(:,29);
x2 = yfit1_15;
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

xx = min(bootstrapStat):.01:max(bootstrapStat);
notBoxPlot(bootstrapStat,29);

hold on;

x2 = yfit1_15_;
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
notBoxPlot(bootstrapStat,30);


%%%%%%
x1 = ACTBD_02(:,29);
x2 = yfit1_16;
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


xx = min(bootstrapStat):.01:max(bootstrapStat);
notBoxPlot(bootstrapStat,31);


hold on;

x2 = yfit1_16_;
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
notBoxPlot(bootstrapStat,32);


gcf2pdf('/Users/dorispopovic/Dropbox/Unsorted/', 'bootstrap_on_ratio_of_variances_Ftest');

subplot(2,3,1)
notBoxPlot(-log10(pvaluesF));
gcf2pdf('/Users/dorispopovic/Dropbox/Unsorted/', 'boxPlot_pvals');
















