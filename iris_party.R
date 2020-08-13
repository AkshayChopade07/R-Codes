#Data load
data("iris")
#install the required packages
install.packages("caret")
install.packages("party")
install.packages("c50")
library(party)
str(iris)
head(iris)
#To get reproducible results
set.seed(1234)
ind<-sample(2,nrow(iris),replace=TRUE , prob=c(0.7,0.3))
# check the prediction
trainData <-iris[ind ==1,]
# predict on test data
testData <-iris[ind ==2,]
myFormula<-Species ~ Sepal.Length+Sepal.Width+Petal.Length+Petal.Width
iris_ctree <-ctree(myFormula,data=trainData)
train_predict <-predict(iris_ctree,trainData,type="response")
table(tarin_predict,trainData$Species)
mean(test_predict!=testData$Species)*100
##   Conditional inference tree with 4 terminal nodes
print(iris_ctree)
plot(iris_ctree)

