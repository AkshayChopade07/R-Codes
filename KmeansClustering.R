library(plyr)
x<-runif(50) #generate 50 random no. from uniform distribution 0  and 1
y<-runif(50) #generate 50 random no.
data<-cbind(x,y) #combine the column
plot(data)
km<-kmeans(data,4) #Kmeans clustering -4 clusters;k~sqrt(n/2)


library(animation)
km<-kmeans.ani(data,4)

#Scree plot
wss<-c()
for(i in 2:15) wss[i]<-sum(kmeans(data,centers = i)$withinss)
plot(1:15,wss,type = "b",xlab = "no. of clusters",ylab = "Avg Distance")

