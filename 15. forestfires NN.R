library(neuralnet)  # regression
library(nnet) # classification 
library(NeuralNetTools)
library(plyr)

# Read the data
forestfires <- read.csv(file.choose())
View(forestfires)
class(forestfires)

forestfires$month <- as.numeric(revalue(forestfires$month,
                                     c("jan"="0", "Feb"="1",  "march"="2,  "apr"="3", "jun"="4",  "aug"="5",  "sep"="6",  "oct"="7",  "nov"="8",  "dec"="9)))
str(forestfires)

forestfires <- as.data.frame(forestfires)
attach(forestfires)

 Exploratory data Analysis 

plot(FFMC, size_category)

plot(DMC, size_category)

plot(DC, size_category)

plot(ISI, size_category)

plot(temp, size_category)

plot(RH, size_category)

plot(wind, size_category)

plot(rain, size_category)

plot(area, size_category)



windows()
# Find the correlation between Output (size_category) & inputs (FFMC,DMC,DC ISI,temp,RH,wind,rain,area) - SCATTER DIAGRAM
pairs(forestfires)

# Correlation coefficient - Strength & Direction of correlation
cor(forestfires)

summary(forestfires) # Confirms on the different scale and demands normalizing the data.


# Apply Normalization technique to the whole dataset :

normalize<-function(x){
  return ( (x-min(x))/(max(x)-min(x)))
}
forestfires_norm<-as.data.frame(lapply(forestfires,FUN=normalize))
summary(forestfires_norm$size_category) # Normalized form of profit

summary(forestfires$size_category) # Orginal profit value

# Data Partition 
set.seed(123)
ind <- sample(2, nrow(forestfires_norm), replace = TRUE, prob = c(0.7,0.3))
forestfires_train <- forestfires_norm[ind==1,]
forestfires_test  <- forestfires_norm[ind==2,]


# Creating a neural network model on training data


forestfires_model <- neuralnet(size_category~FFMC+DMC+DC+ISI+temp+RH+wind+rain+area
                            ,data = forestfires_train)
str(forestfires_model)

plot(forestfires_model, rep = "best")

summary(forestfires_model)


par(mar = numeric(4), family = 'serif')
plotnet(forestfires_model, alpha = 0.6)

# Evaluating model performance

set.seed(12323)
model_results <- compute(forestfires_model,forestfires_test[3:11])
predicted_size_category <- model_results$net.result

# Predicted size_category Vs Actual size_category of test data.
cor(predicted_size_category,forestfires_test$size_category)


# since the prediction is in Normalized form, we need to de-normalize it 
# to get the actual prediction on size_category
str_max <- max(forestfires$size_category)
str_min <- min(forestfires$size_category)

unnormalize <- function(x, min, max) { 
  return( (max - min)*x + min )
}

Actualsize_category <- unnormalize(predicted_size_category,str_min,str_max)
head(Actualsize_category_pred)


# Improve the model performance :
set.seed(12345)
forestfires_model2 <- neuralnet(si~FFMC+DMC+DC+ISI+temp+RH+wind+rain+area,data = Startups_train,
                             hidden = 2)
plot(forestfires_model2 ,rep = "best")


summary(forestfires_model2)

model_results2<-compute(forestfires$size_model2,forestfires$size_test[3:11])
predicted_size_category2<-model_results2$net.result
cor(predicted_size_category2,forestfires_test$size_category)

plot(predicted_size_category2,forestfires_test$size_category)

par(mar = numeric(4), family = 'serif')
plotnet(forestfires_model2, alpha = 0.6)

# SSE(Error) has reduced and training steps had been increased as the number of neurons  under hidden layer are increased













