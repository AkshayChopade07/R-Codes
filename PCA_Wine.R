
#CODE 1
install.packages("HDclassif")
library(HDclassif)
data(wine)
str(wine)

names(wine) <- c("Type", "Alcohol", "Malic acid", "Ash", "Alcalinity of ash", 
                 "Magnesium", "Total phenols", "Flavanoids", "Nonflavanoid phenols", 
                 "Proanthocyanins", "Color intensity", "Hue", "OD280/OD315 of diluted wines", 
                 "Proline")

install.packages("stats")
library(stats)
wine_pca <- prcomp(wine, center = TRUE, scale = TRUE) 
summary(wine_pca)
biplot(wine_pca)
wine[c(4, 19),]
biplot(wine_pca, xlabs = rep("", nrow(wine)))






#CODE2
data(wine, package = 'rattle')
str(wine,list.len = 5)
install.packages("randomForest")
library(randomForest)
rfFit <- randomForest(Type ~ PC1 + PC2, data = pca.train.df)
paste("training accuracy is",confusionMatrix(training$Type,predict(rfFit))$overall[1]*100,"%")

paste("testing accuracy is",confusionMatrix(testing$Type,predict(rfFit,pca.test.df))$overall[1]*100,"%")



#CODE 3
Wine12<-read_csv("G://Statastics all Algorithms//wine.csv")
view(wine)
Wine1<-scale(wine[,2:7])
pca<-princomp(Wine1, cor = TRUE,scores = TRUE, covmat = NULL)
summary(pca)
pca$scores
new_data<-pca$scores[,1:2]
#pca$loadings

plot(pca$scores[,1:2],col="Blue",cex = 0.2)
text(pca$scores[,1:2], labels=c(1:25), cex= .7)