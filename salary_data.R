sal=read.csv("C:/Users/Immortal/Desktop/Statastics all Algorithms/Simple linear Regression/salary_data.csv")
View(sal)
summary(sal)
colnames(sal)=c("exp", "sal")
View(sal)
attach(sal)
reg=lm(sal~exp ,data = sal)# Y ~ X function to get the best model 
summary(reg)# to find the R value 
confint(reg,level = 0.95)# to find B0 and B1 
pred=predict(reg,interval = "predict")
pred
