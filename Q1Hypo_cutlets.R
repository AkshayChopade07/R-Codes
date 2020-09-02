#A F&B manager wants to determine whether there is any significant
#difference in the diameter of the cutlet between two units. 
#A randomly selected sample of cutlets was collected from both 
#units and measured? Analyze the data and draw inferences at 
#5% significance level. Please state the assumptions and tests 
#that you carried out to check validity of the assumptions.


#creating object cutlet of type dataframe by reading data from Cutlets.csv file 
cutlet<-read.csv(file.choose())
View(cutlet)
colnames(cutlet)<-c("A","B") #changing col names to A and B for ease of use  operation
attach(cutlet)

#Normality test
#H0- Data are normal
#H1 - Data are not normal
install.packages("shapiro")
shapiro.test(A)  #p-value is 0.32 > 0.05 so data are normal
shapiro.test(B) #p-value is 0.5225 > 0.05 so data are normal

#assuming external conditions are different 
#as two different units have two different state of machines for making cutlets and also 
#other factors like raw material used

#variance test
var.test(A,B)
#?var.test
#p-value is 0.3136 which is >0.05 so p high null fly do variance are equal

#variances are equal so go for 2 sample T test for equal variances
t.test(A,B,conf.level = 0.95,correct = TRUE)
# alternative = "two.sided" means we are checking for equal and unequal
# means
# null Hypothesis -> Equal means
# Alternate Hypothesis -> Unequal Hypothesis
# p-value = 0.4723 > 0.05 accept null Hypothesis

#  from the following test we assume 
# unitA and unitB have no significant difference in cutlets diameter from samples  
# so no action to be taken by F&B Manager to improve accuracy
# As sample size is also large enough >30 so that can be apply to population also