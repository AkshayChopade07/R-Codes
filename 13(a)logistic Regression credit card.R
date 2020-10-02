creditcard<-read.csv("D:/folders/ExcelR/Assignments/Logistic Regression/creditcard.csv")

#Finding null values
sum(is.na(creditcard))

#Removing null values- na.omit(dataset)
creditcard <- na.omit(creditcard)

# Logistic Regression
#glm(y~x,family="bin....)
logit<-glm(card ~ factor(reports) + factor(dependents) + factor(majorcards) 
           + age+income+share+owner+expenditure+selfemp+months+active,family= "binomial",data=creditcard)
summary(logit)
# its a better model as residual deviance is less than null deviance

#odds ratio
exp(coef(logit))

#Model validation
# Confusion Matrix Table
#predict(modelobject,testdataset)
prob=predict(logit,type=c("response"),creditcard)

#table(dataframe1,dataframe2) ..to create 2X2 matrix
confusion<-table(prob>0.5,creditcard$card)
confusion

# Model Accuracy
#adding diagonal elements in the confusion matrix
Accuracy<-sum(diag(confusion))/sum(confusion)
Accuracy

####
## ROC Curve

#Extract from the fitted model object the vector of fitted probabilities:
install.packages("ROCR")
install.packages("pROC")
library(ROCR)
library(pROC)
#prediction(probability values from model,y variable)
rocrpred<-prediction(prob,creditcard$card)
rocrperf<-performance(rocrpred,'tpr','fpr')
plot(rocrperf,colorize=T,text.adj=c(-0.2,1.7))
#plot(rocrperf)
auc <- auc(creditcard$card ~ prob)
auc
