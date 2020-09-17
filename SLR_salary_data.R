data = read.csv("G:/Statastics all Algorithms/Simple linear Regression/Salary_Data.csv" , header = T)
library(tidyverse)
library(caret)
library(MASS)
library(lmtest)
library(olsrr)
library(broom)
# Random Inspection of Dataset
sample_n(data,5)
plot(data$YearsExperience,data$Salary)
cor.test(data$YearsExperience , data$Salary)
# Randomly Split the data into training and test set

set.seed(123)
training.samples <- data$Salary %>%
  createDataPartition(p = 0.6, list = FALSE)
train.data  <- data[training.samples, ]
test.data <- data[-training.samples, ]
# Fit model

model <- lm(Salary ~ YearsExperience , data = train.data)

summary(model)
# Visualization
qqnorm(model$residuals)
qqline(model$residuals , col = "steelblue", lwd = 2)  

# Statistical Test
shapiro.test(model$residuals)
# Visualization
plot(model$fitted.values , model$residuals)

# Statistical Test
bptest(model)

# Visualization
plot(1:20 , model$residuals)

# Statistical Test
dwtest(model,  alternative = c("two.sided"))

# Calculating mean of errors
mean(model$residuals)
# Define training control
set.seed(123)
train.control <- trainControl(method = "repeatedcv", 
                              number = 4, repeats = 3)
# Train the model
model_cv <- train(Salary ~ YearsExperience , data = data, method="lm",
                  trControl = train.control)

# Summarize the results

# Fitting Orthogonal polynomial model

model_poly <- lm(Salary ~ poly(YearsExperience,2) , data = train.data )

# Summarizing model
summary(model_poly)
print(model_cv)
