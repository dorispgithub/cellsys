
% define the test and training data well

PLK1D_01 = zscore([FullDataGFP{3,3}]); %this we train
PLK1D_02 = zscore([FullDataGFP{4,3}]); %this we test

% 1. only mRNA
% 2. only cell autnomous
% 3. mRNA and cell autnomous
% 4. mRNA, cell autonomous and mRNA spatial
% 5. mRNA, cell autnomous, mRNA spatial, and neighbour activity features!

predictors01 = [3:28 62:94 140:184 186:189 191:199 201:207 211:214 252:262 265:266]; % only cell autnomous
predictors02 = [3:28 62:94 140:185 186:189 191:199 201:207 211:214 252:262 265:266]; % mRNA and cell autnomous
predictors03 = [3:28 62:94 140:185 186:189 191:199 201:207 211:214 216:249 252:262 265:266]; % mRNA, its spatial and cell autnomous
predictors04 = [3:28 62:94 140:185 186:189 191:199 201:207 211:214 216:249 252:262 265:266 275:281]; % full model, mRNA, its spatial and cell autonmous, and neighbour activity

X1 = PLK1D_01(:, 185); %predictor is spot count
y1 = PLK1D_01(:,29); %we predict the protein
lmModel1 = fitlm(X1, y1, 'linear', 'RobustOpts', 'on'); 
% test LM
Xnew1 = PLK1D_02(:,185); 
ypred1 = predict(lmModel1, Xnew1); 


Xall01 = PLK1D_01(:, predictors01); XnewALL01 = PLK1D_02(:,predictors01);
Xall02 = PLK1D_01(:, predictors02); XnewALL02 = PLK1D_02(:,predictors02);
Xall03 = PLK1D_01(:, predictors03); XnewALL03 = PLK1D_02(:,predictors03);
Xall04 = PLK1D_01(:, predictors04); XnewALL04 = PLK1D_02(:,predictors04);

% regress PLSR1 
[XL1,yl1,XS1,YS1,beta1,PCTVAR1, MSE1, stats1] = plsregress(Xall01,y1,6,'cv', 100);
% do diagnostics
figure;
plot(1:6,cumsum(100*PCTVAR1(2,:)),'-bo');
xlabel('Number of PLS components');
ylabel('Percent Variance Explained in y');

figure;
[axes,h1,h2] = plotyy(0:6,MSE1(1,:),0:6,MSE1(2,:));
set(h1,'Marker','o'); 
set(h2,'Marker','o');  
legend('MSE Predictors','MSE Response')
xlabel('Number of Components'); 
% predict
yfit01 = [ones(size(XnewALL01,1),1) XnewALL01]*beta1;

%do KS do Ftest
[h1,p1,ks2stat1] = kstest2(PLK1D_02(:,29), yfit01);
[h1,p1,fstat1] = vartest2(PLK1D_02(:,29), yfit01);

%plot the weights for PLSR, min max normalize before
minmaxW = bsxfun(@rdivide, bsxfun(@minus, stats1.W, (min(stats1.W))), (max(stats1.W)) - (min(stats1.W)));
plot(minmaxW);














