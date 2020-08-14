#Data Load
#data("Fraud_check")
Fraud <-Fraud_check
View(Fraud_check)

#Install the required packages
install.packages("caret")
install.packages("randomForest")
#Library invoke
library(caret)
library(randomForest)
#To make the results consistent across the runs
TIRisky <- NULL
TIRisky <- ifelse(Fraud$Taxable.Income<=30000,1,0)
Fraud[,"TIRisky"] <- TIRisky

Fraud$Undergrad <- as.factor(Fraud$Undergrad)
Fraud$Marital.Status <- as.factor(Fraud$Marital.Status)
Fraud$Urban <- as.factor(Fraud$Urban)
Fraud$TIRisky <- as.factor(Fraud$TIRisky)

fraud_risky <- Fraud[Fraud$TIRisky == "1",] 
fraud_not_risky <- Fraud[Fraud$TIRisky == "0",]

training <- rbind(fraud_risky[1:93,], fraud_not_risky[1:357,])
testing <- rbind(fraud_risky[94:124,], fraud_not_risky[357:476,])

# Building a random forest model on training data 
fit.forest <- randomForest(TIRisky~.,data=training, na.action=na.roughfix,importance=TRUE)

# Training accuracy 
mean(training$TIRisky == predict(fit.forest,training)) # 100% accuracy 

# Prediction of train data
pred_train <- predict(fit.forest,training)
library(caret)
# Confusion Matrix
confusionMatrix(training$TIRisky, pred_train)

# Predicting test data 
pred_test <- predict(fit.forest,newdata=testing)
mean(pred_test == testing$TIRisky) # Accuracy = 100%
# Confusion Matrix 

confusionMatrix(testing$TIRisky, pred_test)
# Visualization 
plot(fit.forest,lwd=2)
legend("topright", colnames(fit.forest$err.rate),col=1:4,cex=0.8,fill=1:4)

