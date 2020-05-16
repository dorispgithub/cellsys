# Library
library(fmsb)

# Library
library(fmsb)

# Create data: note in High school for several students
set.seed(99)
data=as.data.frame(matrix( sample( 0:20 , 15 , replace=F) , ncol=5))
colnames(data)=c("math" , "english" , "biology" , "music" , "R-coding" )
rownames(data)=paste("mister" , letters[1:3] , sep="-")

# To use the fmsb package, I have to add 2 lines to the dataframe: the max and min of each topic to show on the plot!
data=rbind(rep(20,5) , rep(0,5) , data)

####
pathname<-file.path("/Users/dorispopovic/Desktop/W1","W1.mat")
library(R.matlab)
data<-readMat("/Users/dorispopovic/Desktop/W1.mat", "W1.mat")

data<- as.data.frame(data);

#==================
# Plot 1: Default radar chart proposed by the library:
radarchart(C1, maxmin = TRUE)


#==================
# Plot 2: Same plot with custom features
colors_border=c( rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9) , rgb(0.7,0.5,0.1,0.9), rgb(0.2,0.5,0.1,0.9), rgb(0.7,0.5,0.1,0.3), rgb(0.7,0.5,0.6,0.3) )
colors_in=c( rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4) , rgb(0.7,0.5,0.1,0.4),rgb(0.2,0.5,0.1,0.9), rgb(0.7,0.5,0.1,0.3), rgb(0.7,0.5,0.6,0.3)  )

colors_border=c( rgb(0.8,0.2,0.5,0.9) , rgb(0.7,0.5,0.1,0.9), rgb(0.2,0.5,0.1,0.9), rgb(0.7,0.5,0.1,0.3), rgb(0.7,0.5,0.6,0.3) )
colors_in=c( rgb(0.8,0.2,0.5,0.4) , rgb(0.7,0.5,0.1,0.4),rgb(0.2,0.5,0.1,0.9), rgb(0.7,0.5,0.1,0.3), rgb(0.7,0.5,0.6,0.3)  )

C1<- data[1:3, 1:54];
c<- c(1,2,4);
C2<- data[c, 1:54]
c1<- c1(1,2,5);
C3<- data[c1, 1:54]
c2<- c2(1,2,6);
C4<- data[c2, 1:54]

# bare in mind that different scaling does not change the apperance
par(mfrow=c(2,2)) 
radarchart( C1, axistype=1 , na.itp=FALSE,
            #custom polygon
            pcol=rgb(1,0.4,0.5,0.9) , pfcol=rgb(0.5,0.5,0.5,0.4), plwd=6 , plty=1,
            #custom the grid
            cglcol="grey", cglty=1, axislabcol="grey", cglwd=0.8,
            #custom labels
            vlcex=0.8 
)
radarchart( C2, axistype=1 , na.itp=FALSE,
            #custom polygon
            pcol=rgb(1,0.4,0.5,0.9) , pfcol=rgb(0.5,0.5,0.5,0.4), plwd=6 , plty=1,
            #custom the grid
            cglcol="grey", cglty=1, axislabcol="grey", cglwd=0.8,
            #custom labels
            vlcex=0.8 
)

radarchart( C3, axistype=1 , na.itp=FALSE,
            #custom polygon
            pcol=rgb(1,0.4,0.5,0.9) , pfcol=rgb(0.5,0.5,0.5,0.4), plwd=6 , plty=1,
            #custom the grid
            cglcol="grey", cglty=1, axislabcol="grey", cglwd=0.8,
            #custom labels
            vlcex=0.8 
)

radarchart( C4, axistype=1 , na.itp=FALSE,
            #custom polygon
            pcol=rgb(1,0.4,0.5,0.9) , pfcol=rgb(0.5,0.5,0.5,0.4), plwd=6 , plty=1,
            #custom the grid
            cglcol="grey", cglty=1, axislabcol="grey", cglwd=0.8,
            #custom labels
            vlcex=0.8 
)

radarchart(C5, axistype=1 , na.itp=FALSE,
            #custom polygon
            pcol=rgb(1,0.4,0.5,0.9) , pfcol=rgb(0.5,0.5,0.5,0.4), plwd=6 , plty=1,
            #custom the grid
            cglcol="grey", cglty=1, axislabcol="grey", cglwd=0.8,
            #custom labels
            vlcex=0.8 
)

radarchart(C6, axistype=1 , na.itp=FALSE,
            #custom polygon
            pcol=rgb(0.7,0.2,0.9,0.8) , pfcol=rgb(0.7,0.2,0.9,0.5), plwd=6 , plty=1,
            #custom the grid
            cglcol="grey", cglty=1, axislabcol="grey", cglwd=0.8,
            #custom labels
            #vlcex=0.8 
)


legend(x=0.7, y=1, legend = rownames(data[-c(1,2),]), bty = "n", pch=20 , col=colors_in , text.col = "grey", cex=1.2, pt.cex=3)



#=================
# Plot3: If you remove the 2 first lines, the function compute the max and min of each variable with the available data:
colors_border=c( rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9) , rgb(0.7,0.5,0.1,0.9) )
colors_in=c( rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4) , rgb(0.7,0.5,0.1,0.4) )
radarchart( data[-c(1,2),]  , axistype=0 , maxmin=F,
            #custom polygon
            pcol=colors_border , pfcol=colors_in , plwd=4 , plty=1,
            #custom the grid
            cglcol="grey", cglty=1, axislabcol="black", cglwd=0.8, 
            #custom labels
            vlcex=0.8 
)
legend(x=0.7, y=1, legend = rownames(data[-c(1,2),]), bty = "n", pch=20 , col=colors_in , text.col = "grey", cex=1.2, pt.cex=3)
