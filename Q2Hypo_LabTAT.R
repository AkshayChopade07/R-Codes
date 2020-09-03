#A hospital wants to determine whether there is any difference 
#in the average Turn Around Time (TAT) of reports of the laboratories 
#on their preferred list. They collected a random sample and 
#recorded TAT for reports of 4 laboratories. TAT is defined as 
#sample collected to report dispatch.

#Analyze the data and determine whether there is any difference 
#in average TAT among the different laboratories at 5% significance level.

labtat<-read.csv(file.choose())
View(labtat)
colnames(labtat)<-c("lab1","lab2","lab3","lab4")
#tat is turn around time so parameter is time continuous variabble comparison is on discrete population of 4 labs 

#comparison is on 4 labs

#Normality test on each lab
#H0: data are normal
#H1: data are not normal
attach(labtat)
shapiro.test(lab1)# pvalue- 0.5508 > 0.05 so normal data
shapiro.test(lab2)# p-value 0.8637 > 0.05 so normal data
shapiro.test(lab3)# p-value 0.4205 > 0.05 so normal data
shapiro.test(lab4)# p-value 0.6619 > 0.05 so normal data
# Data is normally distributed

#Stacking data to apply variance test and further hypothesis test
stack_labs<-stack(labtat)
View(stack_labs)

#variance test
library(car)
leveneTest(values~ ind, data = stack_labs)
# pvalue >0.05 so accept null hypothesis so variance are equal

# annova test
#H0: No difference in TAT among labs
#H1: Difference in TAT among labs
Anova_labs <- aov(values~ind,data = stack_labs)
summary(Anova_labs)
# p-value <<<0.05 forget null hypothesis 
#There is difference in TAT among labs  

