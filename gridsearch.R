#Grid search method
# load the library
install.packages("e1071")
library(e1071)
library(caret)

# load the dataset
data(iris)
ctrl <- trainControl(method="cv") 
my_knn_model <- train(Species ~ .,
                      method = "knn",
                      data = iris,
                      trControl=ctrl,
                      tuneGrid = expand.grid(k = c(2,9,10, 13, 19)))
my_knn_model
