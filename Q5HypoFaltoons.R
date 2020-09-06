#Fantaloons Sales managers commented that % of males 
#versus females walking in to the store differ 
#based on day of the week. Analyze the data and 
#determine whether there is evidence at 5 % significance level 
#to support this hypothesis.

#Minitab File: Fantaloons.mtw

fanta<-read.csv(file.choose())
View(fanta)
attach(fanta)
tablefanta<-table(Weekdays,Weekend)
View(tablefanta)
# from tablefanta we get 
#females walking in on weekdays = 287,males walkingin on weekdays = 113
#total females walking in store per week =520, total males walking in store per week = 280

#2-proportion t test
prop.test(x=c(287,113),n=c(520,280),conf.level = 0.95,correct = FALSE,alternative = "two.sided")
#two sided ->chcecking for equal proportions males and females walking in store
#P-value 6.261e-05 <<<0.05 accept alternate hypothesis 
#unequal proportions

prop.test(x=c(287,113),n=c(520,280),conf.level = 0.95,correct = FALSE,alternative = "greater")
#H1 : Proportions of females > proportion of males
#H0 : Proportions of females !> proportion of males
#pvalue 6.261e-05<<< 0.05 so reject null hypothesis

prop.test(x=c(287,113),n=c(520,280),conf.level = 0.95,correct = FALSE,alternative = "less")
#H1 :Proportions of females < proportion of males
#H0 :Proportions of females !< proportion of males
#pvalue 1>>0.05 so accept null hypothesis

#%males versus % female differ in days of the week with 95% confidence
