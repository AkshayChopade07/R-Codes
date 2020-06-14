#Linear Regression

fit=lm(ATTORNEY ~ factor(CLMSEX)+ factor(CLMINSUR) +factor(SEATBELT)
       +CLMAGE+LOSS)
summary(fit)




#install.packages("aod")

#Logistic Regresssion
logit=glm(ATTORNEY ~ factor(CLMSEX)+factor (CLMINSUR)+factor(SEATBELT)
          +CLMAGE+LOSS,family="binominal",sata=claimants)
summary(logit)

#odds Ratio
exp(coef(logit))

#confusion matrix table
prob=predict(logit,type=c("response"),cliamants)
prob
confusion<-table(prob>0.5,claimants$ATTORNEY)
confusion

#Model Accuracy
Accuracy<-sum(diag(confusion))/sum(confusion)
Accuracy

##ROC Curve
#Extract From the fitted model object the vector of fitted probabilities:

library(pROC)
roccurve<-roc(claimants$ATTORNEY~prob)
plot(roccurve)

