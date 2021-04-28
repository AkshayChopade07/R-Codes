# Get the `MASS` library
library(MASS)

# Train and test sets
train <- Pima.tr
test <- Pima.te

# Print out the first lines of `train`
head(train)
# Get a summary of `train`
summary(train)
help(Pima.tr)
y <- as.numeric(train[,8])-1
ytest <- as.numeric(test[,8])-1
x <- data.frame(train[,1:7])
xtest <- data.frame(test[,1:7])
x <- data.frame(train[,1:7])
xtest <- data.frame(test[,1:7])
set.seed(150)
single.model <- SuperLearner(y,
                             x,
                             family=binomial(),
                             SL.library=list("SL.ranger"))

single.model

# Set the seed
set.seed(150)

# Fit the ensemble model
model <- SuperLearner(y,
                      x,
                      family=binomial(),
                      SL.library=list("SL.ranger",
                                      "SL.ksvm",
                                      "SL.ipredbagg",
                                      "SL.bayesglm"))

# Return the model
model
# Get V-fold cross-validated risk estimate
cv.model <- CV.SuperLearner(y,
                            x,
                            V=5,
                            SL.library=list("SL.ranger",
                                            "SL.ksvm",
                                            "SL.ipredbagg",
                                            "SL.bayesglm"))

# Print out the summary statistics
summary(cv.model)

plot(cv.model)
predictions <- predict.SuperLearner(model, newdata=xtest)
head(predictions$pred)
head(predictions$library.predict

# Load the package
 library(dplyr)
     
# Recode probabilities
conv.preds <- ifelse(predictions$pred>=0.5,1,0)
# Load in `caret`
library(caret)

# Create the confusion matrix
cm <- confusionMatrix(conv.preds, ytest)

# Return the confusion matrix
cm

SL.ranger.tune <- function(...){
  SL.ranger(..., num.trees=1000, mtry=2)
}

SL.ipredbagg.tune <- function(...){
  SL.ipredbagg(..., nbagg=250)
}

# Set the seed
set.seed(150)

# Tune the model
cv.model.tune <- CV.SuperLearner(y,
                                 x,
                                 V=5,
                                 SL.library=list("SL.ranger",
                                                 "SL.ksvm",
                                                 "SL.ipredbagg","SL.bayesglm", 
                                                 "SL.ranger.tune",
                                                 "SL.ipredbagg.tune"))

# Get summary statistics
summary(cv.model.tune)
