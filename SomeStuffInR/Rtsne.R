# install package
# https://github.com/jkrijthe/Rtsne
install.packages("Rtsne")
library(Rtsne)
install.packages("R.matlab")
# load the Z-scored data (measuements of all the single cells you wish to see in BH-tSNE)
pathname<-file.path("/Users/dorispopovic/Desktop/data.mat","data.mat")
library(R.matlab)
data<-readMat("/Users/dorispopovic/Desktop/data.mat","data.mat")

# transform to data frame and run tSNE
X<- as.data.frame(data);
set.seed(1234)
mappedX <- Rtsne(X, dims = 2, initial_dims = 37, perplexity = 30, pca = TRUE, max_iter = 1000)
# plot the map to inspect
plot(mappedX$Y, t='n', main="BarnesHutSNE")
# save the output___load to MatLab and project any feature to the map
writeMat("mappedX.mat", mappedX = mappedX)























