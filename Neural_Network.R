##### Neural Networks -------------------
# Load the Concrete data

# custom normalization function
normalize <- function(x) { 
  return((x - min(x)) / (max(x) - min(x)))
}
# apply normalization to entire data frame
concrete<-read.csv("C:/Users/Immortal/Documents/R/concrete.csv")
concrete_norm <- as.data.frame(lapply(concrete, normalize))
# create training and test data
concrete_train <- concrete_norm[1:773, ]
concrete_test <- concrete_norm[774:1030, ]
## Training a model on the data ----
# train the neuralnet model
install.packages("neuralnet")
library(neuralnet)
# simple ANN with only a single hidden neuron
concrete_model <- neuralnet(strength ~ cement + slag +
                              ash + water + superplastic + 
                              coarseagg + fineagg + age,
                            data = concrete_train,act.fct ="logistic")

# visualize the network topology
windows();plot(concrete_model)
## Evaluating model performance ----
# obtain model results
model_results <- compute(concrete_model, concrete_test[1:8])
# obtain predicted strength values
predicted_strength <- model_results$net.result
# examine the correlation between predicted and actual values

cor(predicted_strength, concrete_test$strength)

