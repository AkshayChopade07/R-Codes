#Data load
#crimedata1<-read.csv("C:/Users/admin/Desktop/crime_data.csv")

################################
##data standardization
crimedata <- scale(crimedata1[,2:5]) #Scale will convert the crimedata1 into Z scores

d <- dist(crimedata, method = "euclidean") #Computing the distance natrix
d
#####################################################################################################
#fit<-hclust(d,method = "centroid")
#plot(fit)  #for Display dendrogram
#groups<-cutree(fit,k=2) #cut tree into 2 clusters

# to draaw dendrograam with red borders around the 2 clusters
#rect.hclust(fit,k=5,border = "red")

#Attach the cluster number to 
#clusters=data.frame('x'=crimedata[,1],'Cluster'=groups)
#View(clusters) #Final REport
#by centrod method , improper dendogram, hence using avg metod & library factoextra

######################################################################################################
as.matrix(d)

fit <- hclust(d, method="average") # Building the algorithm # try with 'centroid' # display dendogram
 #cex: label size
install.packages('factoextra')
library("factoextra")
fviz_dend(fit, cex = 0.5)
 #Cut in 2 groups and color by groups
fviz_dend(fit, k = 2, # Cut in four groups
          cex = 0.5, # label size
          color_labels_by_k = TRUE, # color labels by groups
          rect = TRUE # Add rectangle around groups
)
#Attach the cluster numbers to X
clusters<-cutree(fit,k=2)
Final_output=data.frame('X'=crimedata1[,1],'Cluster' =clusters)
View(Final_output)

require("igraph")
fviz_dend(fit, k =2,type = "phylogenic", repel = TRUE)
#################################################################################################




