# install packages and use implementation as in 
# https://github.com/lmweber/FlowSOM-Rtsne-example/blob/master/FlowSOM_Rtsne_example.R

# from Bioconductor
#source("https://bioconductor.org/biocLite.R") https://bioconductor.org/packages/release/bioc/html/FlowSOM.html
#biocLite("flowCore")
#biocLite("FlowSOM")

# from CRAN
#install.packages("Rtsne") https://cran.r-project.org/web/packages/Rtsne/index.html
#install.packages("ggplot2")

# load packages
library(flowCore)
library(FlowSOM)
library(Rtsne)
library(ggplot2)

# load data
pathname<-file.path("/Users/dorispopovic/Desktop/data.mat","data.mat")
library(R.matlab)
data<-readMat("/Users/dorispopovic/Desktop/data.mat","data.mat")

X<- as.data.frame(data);
# add header to tabele
colnames(X) <- c("DAPI", "NucSize", "CellSize", "LCD")

# convert to numeric matrix
data = data.matrix(X)

# create flowFrame object (required input format for FlowSOM)
data_FlowSOM <- flowCore::flowFrame(data)


###################
### RUN FLOWSOM ###
###################

# set seed for reproducibility
set.seed(5572) #1234

# run FlowSOM 
out <- FlowSOM::ReadInput(data_FlowSOM, transform = FALSE, scale = FALSE)
out_1 <- FlowSOM::BuildMST(out)

# visualize
FlowSOM::PlotStars(out_1)

# extract cluster labels (pre meta-clustering) from output object _ we dont do any metaclustering further!!!
labels_pre <- out_1$map$mapping[, 1]

# extract cluster labels for each single cell from the output object
labels <- out_1[labels_pre]

# summary of cluster sizes and number of clusters
table(labels)
length(table(labels))

# save cluster labels
inx_bin <- data.frame(cluster = labels_pre)
write.table(labels_pre, file = "FlowSOM\\ClusterID.txt", 
            row.names = FALSE, quote = FALSE, sep = "\t")
unique(inx_bin)

# if you append the indeces to the cells, can remove the bins with less than 20 cells in MatLab
# and calculate median value for each bin 

# load the bin median values and do Rtsne

#################
### RUN RTSNE ###
set.seed(1234)

# run BH-Rtsne 
# note initial PCA is not required, since few dimensions
bins <- Rtsne(bins, dims = 2, initial_dims = 4, perplexity = 20, pca = FALSE, max_iter = 1000)
# save the output___load to MatLab and project medians to the map
writeMat("bins.mat", bins = bins)

