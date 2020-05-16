# load data

pathname<-file.path("/Users/dorispopovic/Downloads/enrichment.Function2","enrichment.Function2.tsv")

data = read.csv("/Users/dorispopovic/Downloads/enrichment.Function2.tsv",header=FALSE);

install.packages("igraph")
install.packages("network") 
install.packages("sna")
install.packages("ndtv")

#nodes <- read.csv("/Users/dorispopovic/Downloads/Polnet2015/Data/Dataset1-Media-Example-NODES.csv", header=T, as.is=T)
#links <- read.csv("/Users/dorispopovic/Downloads/Polnet2015/Data/Dataset1-Media-Example-EDGES.csv", header=T, as.is=T)


head(nodes)
head(links)
nrow(nodes); length(unique(nodes$id))
nrow(links); nrow(unique(links[,c("from", "to")]))


links <- aggregate(links[,3], links[,-3], sum)
links <- links[order(links$from, links$to),]
colnames(links)[4] <- "weight"
rownames(links) <- NULL

nodes2 <- read.csv("/Users/dorispopovic/Downloads/Polnet2015/Data/Dataset2-Media-User-Example-NODES.csv", header=T, as.is=T)
links2 <- read.csv("/Users/dorispopovic/Downloads/Polnet2015/Data/Dataset2-Media-User-Example-EDGES.csv", header=T, row.names=1)

head(nodes2)
head(links2)

links2 <- as.matrix(links2)
dim(links2)
dim(nodes2)

library(igraph)

net <- graph.data.frame(links, nodes, directed=T)
net


E(net)       # The edges of the "net" object
V(net)       # The vertices of the "net" object
E(net)$type  # Edge attribute "type"
V(net)$media # Vertex attribute "media"

# You can also manipulate the network matrix directly:
net[1,]
net[5,7]

plot(net)
net <- simplify(net, remove.multiple = F, remove.loops = T)

plot(net, edge.arrow.size=.4,vertex.label=NA)

plot(net, edge.arrow.size=.2, edge.color="orange",
     vertex.color="orange", vertex.frame.color="#ffffff",
     vertex.label=V(net)$media, vertex.label.color="black") 



# Generate colors base on media type:
colrs <- colorRampPalette(brewer.pal(120,"RdYlBu"))(30)

#colrs <- colorRampPalette(brewer.pal(colorspace::diverge_hsv)(50))

#colrs <- c(colours=brewer.pal("YIGnBu"))
V(net)$color <- colrs[V(net)$audience.size]

# Compute node degrees (#links) and use that to set node size:
deg <- degree(net, mode="all")
V(net)$size <- deg*3
# We could also use the audience size value:
V(net)$size <- V(net)$audience.size*0.6

# The labels are currently node IDs.
# Setting them to NA will render no labels:
V(net)$label <- NA

# Set edge width based on weight:
E(net)$width <- E(net)$weight/6

#change arrow size and edge color:
E(net)$arrow.size <- .2
E(net)$edge.color <- "gray80"
E(net)$width <- 1+E(net)$weight/12
plot(net, vertex.label=V(net)$media,  
       edge.arrow.size = 0, edge.arrow.width = net$weight, edge.arrow.size = 2,
     sub = "GO_biological_process_enrichment", vertex.label.color="black") 


plot(net) 
legend(x=-1.5, y=-1.1, c(V(net)$media.type), pch=21,
       col="#777777", pt.bg=colrs, pt.cex=2, cex=.8, bty="n", ncol=1)