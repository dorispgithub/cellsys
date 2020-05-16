%%% PCA analysis of data


% PairwiseC = corr(DataCorrected, DataCorrected);
% w = 1./var(DataCorrected);
% [wcoeff,score,latent,tsquared,explained] = pca(DataCorrected,...
% 'VariableWeights',w);

%%%% remove alll nans and infs

DataCorrected = DataCorrected( ~any( isnan( DataCorrected ) | isinf( DataCorrected ), 2 ),: )


%%%% do PCA on two different datasets (opt)

FOIs = [1:28 61:82 128:147 149:157 159:179]; % features with spots
DataCorrectedZs = DataCorrectedZ (:, FOIs);

FOIns = [1:28 61:82 128:142 144:147 149:157 159:179]; % features without spots
DataCorrectedZns = DataCorrectedZ (:, FOIns);

names = strFinalName (FOIs);

TestData = [PLK1_Z;NCAPD3_Z;CEP192_Z;NCAPH_Z;NCAPD2_Z;TPR_Z;NUP214_Z;RANBP2_Z;SMC4_Z;AURKB_Z;NUP107_Z];
X= TestData;

%%%% do pairwise correaltions, and convince people that shit is lienarly
%%%% correalted hence using PLS makes total sense!!

A = corr(X, X);

HeatMap(PCAs,'Colormap', redbluecmap);
colorbar;

PCALoadingsZ = nanzscore(PCALoadings);
PCAs = PCALoadings(:,[1:6]);

GCObject = clustergram(PCAs, ...
                'cluster',3,...
                 'standardize',3,...
                'displayrange',1,...             
                'colormap',flipud(smoothcolormap(redbluecmap)) ...
            );
A = PCALoadings(:,[1:6]);
colormap ('redbluecmap');% set colormap
 imagesc(A);        % draw image and scale colormap to values range
 colorbar;
gcf2pdf('/Users/dorispopovic/Desktop/PCRvsPLSmodelTesting','pairwiseCorrsOfFeatures');

PairwiseCnc = corr(DataCorrectedZns, DataCorrectedZns);
HeatMap(PairwiseCnc); % in both casses you will be able to observe that the predictors are highly corelated 
%%% therefore onecan simpy go for the superwised modeing using PLS
%%% dimensionality reduction;

%%% in any case

[wcoeff,score,latent,tsquare, explained] = princomp(DataCorrectedZs);

X = DataCorrectedZ;
X = X(:, XFI);

%%%
[PCALoadings,PCAScores,PCAVar] = pca(X);
betaPCR = regress(y-mean(y), PCAScores(:,1:2));


figure;
plot(PCAScores(:,1),PCAScores(:,2),'+');
xlabel('1st Principal Component');
ylabel('2nd Principal Component');
gcf2pdf('/Users/dorispopovic/Desktop/DiagnosticsPCAvsPCR','PCAscoresFor2');

y = X(:,28);

%betaPCR = regress(y-mean(y), score(:,1:2)); %regress on PCAs so that you can later compare performace of both models

X = DataCorrectedZs;
X2 = DataCorrectedZs (:, [1:27 29:100]);

[Xloadings,Yloadings,Xscores,Yscores,betaPLS,PCTVAR,MSE] = plsregress(X,y,2);
yfitPLS = [ones(size(X,1),1) X]*betaPLS;
%yfitPLS = [ones(n,1) X2]*betaPLS;

%%% reduce PCA model to two components
%[PCALoadings,PCAScores,PCAVar] = pca(X,'Economy',false);
betaPCR = regress(y-mean(y), PCAScores(:,1:2));

%%% transform the regression coefficients to the normal

betaPCR = PCALoadings(:,1:2)*betaPCR;
betaPCR = [mean(y) - mean(X)*betaPCR; betaPCR];
yfitPCR = [ones(size(X,1),1) X]*betaPCR;



%%% now plot both models next to each other on on elot

plot(y,yfitPLS,'bo', y,yfitPCR,'ro');
xlabel('Observed Response');
ylabel('Fitted Response');
legend({'PLSR with 2 Components' 'PCR with 2 Components'},  ...
	'location','NW');
gcf2pdf('/Users/dorispopovic/Desktop/PCRvsPLSmodelTesting','PLSRvsPCRwith2components');

%%%% but keep in mind that still pca model can fit maybe better if oyu
%%%% would use larger number of componets, calculate the rs 

TSS = sum((y-mean(y)).^2);
RSS_PLS = sum((y-yfitPLS).^2);
rsquaredPLS = 1 - RSS_PLS/TSS;


RSS_PCR = sum((y-yfitPCR).^2);
rsquaredPCR = 1 - RSS_PCR/TSS;

%%%%Another way to compare the predictive power of the two models is to plot the response variable against the two predictors in both cases.
subplot(2,2,1);
plot(y,yfitPLS,'bo', y,yfitPCR,'ro');
xlabel('Observed Response');
ylabel('Fitted Response');
legend({'PLSR with 2 Components' 'PCR with 2 Components'},  ...
	'location','NW');

subplot(2,2,3);
plot3(Xscores(:,1),Xscores(:,2),y-mean(y),'bo');
legend('PLSR');
grid on; view(-30,30);
subplot(2,2,4);
plot3(PCAScores(:,1),PCAScores(:,2),y-mean(y),'ro');
legend('PCR');
grid on; view(-30,30);
gcf2pdf('/Users/dorispopovic/Desktop/DiagnosticsPCAvsPCR','PLSRvsPCR');

%%% look which model covers more variance explained using less componets
%%% and accrodingly chose the model

%%% you can also plot ther MSE on one plot and inspect ths
[Xloadings,Yloadings,Xscores,Yscores,betaPLS10,PCTVAR,MSE] = plsregress(X,y,10);
yfitPLS = [ones(size(X,1),1) X]*betaPLS;

plot(1:10,100*cumsum(PCTVAR(1,:)),'b-o',1:10,  ...
	100*cumsum(PCAVar(1:10))/sum(PCAVar(1:10)),'r-o');
xlabel('Number of Principal Components');
ylabel('Percent Variance Explained in X');
legend({'PLSR' 'PCR'},'location','SE');
gcf2pdf('/Users/dorispopovic/Desktop/PCRvsPLSmodelTesting','PLSRvsPCR');



%%% now fit more components and compare again
yfitPLS10 = [ones(size(X,1),1) X]*betaPLS10;
betaPCR10 = regress(y-mean(y), PCAScores(:,1:10));
betaPCR10 = PCALoadings(:,1:10)*betaPCR10;
betaPCR10 = [mean(y) - mean(X)*betaPCR10; betaPCR10];
yfitPCR10 = [ones(size(X,1),1) X]*betaPCR10;
plot(y,yfitPLS10,'bo',y,yfitPCR10,'ro');
xlabel('Observed Response');
ylabel('Fitted Response');
legend({'PLSR with 10 components' 'PCR with 10 Components'},  ...
	'location','NW');
gcf2pdf('/Users/dorispopovic/Desktop/PCRvsPLSmodelTesting','PLSRvsPCRwith10componets');

TSS = sum((y-mean(y)).^2);
RSS_PLS = sum((y-yfitPLS10).^2);
rsquaredPLS10 = 1 - RSS_PLS/TSS;


RSS_PCR = sum((y-yfitPCR10).^2);
rsquaredPCR10 = 1 - RSS_PCR/TSS;

%%% chose the number f componets with crossvalidation

[Xl,Yl,Xs,Ys,beta,pctVar,PLSmsep] = plsregress(X,y,10,'CV',10);

PCRmsep = sum(crossval(@pcrsse,X,y,'KFold',10),1) / size(X,1);

plot(0:10,PLSmsep(2,:),'b-o',0:10,PCRmsep,'r-^');
xlabel('Number of components');
ylabel('Estimated Mean Squared Prediction Error');
legend({'PLSR' 'PCR'},'location','NE');
gcf2pdf('/Users/dorispopovic/Desktop/PCRvsPLSmodelTesting','PLSRvsPCRcrossvalidatedMSE');


%%%% So if PCR requires four components to get the same prediction accuracy as PLSR with three components, is the PLSR model more parsimonious? 
%That depends on what aspect of the model you consider.
%%%The PLS weights are the linear combinations of the original variables that define the PLS components, 
%i.e., they describe how strongly each component in the PLSR depends on the original variables, and in what direction.

%%%% plot shit

[Xl,Yl,Xs,Ys,beta,pctVar,mse,stats] = plsregress(X,y,5);
subplot(2,1,1);
plot(1:100,stats.W,'-', 'LineWidth', 3);
xlabel('Variable');
ylabel('PLS Weight');
legend({'1st Component' '2nd Component' '3rd Component' '4th Component' '5th Component'},  ...
	'location','NW');
%gcf2pdf('/Users/dorispopovic/Desktop/PCRvsPLSmodelTesting','PLSRcomponets_dimensionReducedTo5');

%%% now plot similar thing for PCA
subplot(2,1,2);
plot(1:100,PCALoadings(:,1:5),'-','LineWidth', 3);
xlabel('Variable');
ylabel('PCA Loading');
legend({'1st Component' '2nd Component' '3rd Component'  ...
	'4th Component' '5th Component'},'location','NW');
gcf2pdf('/Users/dorispopovic/Desktop/PCRvsPLSmodelTesting','PCRvsPLSRcomponetsContributions');

rows_to_remove = matCompleteData(:,167)==1;
D = matCompleteData(:,167)
ind = find(D == 2);


matData = DataCorrectedZ(ind, :);
matMeta = matCompleteMetaData(ind, :);

PLK1 = PLK1DataR(:,167);
ind = find(PLK1==2);
PLK1nom = PLK1DataR (ind,:);

RPLK1 = (corr(PLK1DataR(:,28), PLK1DataR(:,143)))^2;
RPLK1nom = (corr(PLK1nom(:,28), PLK1nom(:,143)))^2;




