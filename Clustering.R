mydata1<- Universities
mydata<- scale(mydata1[,2:7])
d<-dist(mydata,method = "euclidean") #Computing the distance matrix
d
fit<-hclust(d,method = "centroid")
plot(fit)  #for Display dendrogram
groups<-cutree(fit,k=4) #cut tree into 5 clusters

# to draaw dendrograam with red borders around the 5 clusters
rect.hclust(fit,k=4,border = "red")

#Attach the cluster number to university
clusters=data.frame('Uni'=mydata1[,1],'Cluster'=groups)
View(clusters) #Final REport
