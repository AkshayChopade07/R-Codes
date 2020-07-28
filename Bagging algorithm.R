##Bagging algorithm
## Bagging ----
# Using the ipred bagged decision trees
install.packages("ipred")
library(ipred)
set.seed(300)
mybag <- bagging(iris$Species ~ ., data = iris, nbagg = 25)
pred <- predict(mybag, iris)
table(pred, iris$Species)
# Bagging using Caret bagged trees
library(caret)
set.seed(300)
ctrl <- trainControl(method = "cv", number = 10)
model_cv<-train(Species ~ ., data = iris, method = "treebag",trControl = ctrl)
pred <- predict(model_cv, testing)
table(pred, testing$Species)
