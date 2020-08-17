library(party)
library(C50)
df = read.csv("Company_Data.csv")
str(df)
head(df)
pairs(df)
range(df$Sales)
median(df$Sales)
sort(df$Sales)
length(df$Sales)
# Less Assume 3 sales segments I may consider low, Medium and High.
# Lets see the cutoff for High sales
sort(df$Sales)[(400/3 * 2)]
# As here cutoff we got is 8.67
# so we can condider that those sales which values are gratter than 8.5  will be considered as High sales and rest will be low sales
SaleC <- ifelse(df$Sales > 8.5,"High","Low")
prop.table(table(SaleC)) # Desired result achieved
comp <- data.frame(SaleC,df[,-1])

set.seed(101);split <- sample(nrow(comp),nrow(comp)*.7,F)
Train_comp <- comp[split,]
Test_comp <- comp[-split,]

#Model Building
model<-C5.0(SaleC~.,data = Train_comp) 
#Generate the model summary
summary(model)
#Predict for test data set
prob<-predict.C5.0(model,Test_comp[,-5]) #type ="prob"
#Accuracy of the algorithm
a<-table(Test_comp$Sales,pred)
sum(diag(a))/sum(a)
#Visualize the decision tree
plot(model)


