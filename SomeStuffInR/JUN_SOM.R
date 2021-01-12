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
pathname<-file.path("/Volumes/Doris2TB/Desktop03/ALLjun","ALLjun.mat")
library(R.matlab)
data<-readMat("/Volumes/Doris2TB/Desktop03/ALLjun.mat", "ALLjun.mat")

X<- as.data.frame(data);
path_featurenames <- file.path("/Users/dorispopovic/Desktop/","featurenames.mat")
featurenames <- readMat(path_featurenames);



# add header to tabele

colnames(X) <- c("DAPI", "NucSize", "CellSize", "LCD")


a = colnames(featurenames)
colnames(X) = featurenames

# convert to numeric matrix
data = data.matrix(X)

# select protein marker columns to use for clustering
marker_cols <- 1:ncol(data)

# create flowFrame object (required input format for FlowSOM)
data_FlowSOM <- flowCore::flowFrame(data)


###################
### RUN FLOWSOM ###
###################

# set seed for reproducibility
set.seed(5572) #1234

# run FlowSOM (initial steps prior to meta-clustering)
out <- FlowSOM::ReadInput(data_FlowSOM, transform = FALSE, scale = FALSE)
out <- FlowSOM::BuildSOM(out, colsToUse = marker_cols)
out_1 <- FlowSOM::BuildMST(out)

# optional visualization
FlowSOM::PlotStars(out_1)

# extract cluster labels (pre meta-clustering) from output object
labels_pre <- out_1$map$mapping[, 1]

# specify final number of clusters for meta-clustering (can also be selected 
# automatically, but this often does not perform well)
k <- 70 #40

# run meta-clustering
seed <- 5572 #1234
out_2 <- ConsensusClusterPlus::ConsensusClusterPlus(t(out_1$map$codes), maxK = 70, seed = seed)
#out_2 <- ConsensusClusterPlus::ConsensusClusterPlus(t(out_1$map$codes), seed = seed)
out_2 <- out_2[[k]]$consensusClass

# extract cluster labels from output object
labels <- out_1[labels_pre]

# summary of cluster sizes and number of clusters
table(labels)
length(table(labels))


# save cluster labels
res <- data.frame(cluster = labels_pre)
write.table(labels_pre, file = "FlowSOM\\ClusterID.txt", 
            row.names = FALSE, quote = FALSE, sep = "\t")
unique(res)


#################
### RUN RTSNE ###
# subsampling (required due to runtime)
n_sub <- 10000
set.seed(1234)
ix <- sample(1:length(labels), n_sub)

# prepare data for Rtsne (matrix format required)
data_Rtsne <- data[ix, marker_cols]
data_Rtsne <- as.matrix(data_Rtsne)

head(data_Rtsne)
dim(data_Rtsne)

# remove any near-duplicate rows (required by Rtsne)
dups <- duplicated(data_Rtsne)
data_Rtsne <- data_Rtsne[!dups, ]

dim(data_Rtsne)

# run Rtsne (Barnes-Hut-SNE algorithm; runtime: 2-3 min)
# note initial PCA is not required, since we do not have too many dimensions
# (i.e. not thousands, which may be the case in other domains)
set.seed(1234)
out_Rtsne <- Rtsne(data_Rtsne, pca = FALSE, verbose = TRUE)

###################
### CREATE PLOT ###
###################

# select points used by Rtsne
labels_plot <- labels[ix][!dups]
length(labels_plot)  ## should be same as number of rows in data_Rtsne

# prepare Rtsne output data for plot
data_plot <- as.data.frame(out_Rtsne$Y)
colnames(data_plot) <- c("tSNE_1", "tSNE_2")

head(data_plot)
dim(data_plot)  ## should match length of labels_plot (otherwise labels will not match up correctly)

data_plot[, "cluster"] <- as.factor(labels_plot)

head(data_plot)

# plot 2-dimensional t-SNE projection
ggplot(data_plot, aes(x = tSNE_1, y = tSNE_2, color = cluster)) + 
  geom_point(size = 0.2) + 
  coord_fixed(ratio = 1) + 
  ggtitle("t-SNE projection with FlowSOM clustering") + 
  theme_bw()

ggsave("plots/FlowSOM_Rtsne_plot.pdf", height = 6, width = 7)
