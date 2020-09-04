#Sales of products in four different regions is tabulated 
#for males and females. Find if male-female buyer rations 
#are similar across regions.

buyrat<-read.csv(file.choose())# file to choose newBuyerRatio.csv for data processing ease


#y- is dicrete which are labels male/female
#x- is discrete comparison between 4 population
# Chi-sqare test chosen for Hypothesis test
#to view the newBuyerRatio.csv file
View(buyrat)

#stacking all data in stack 
stacked_buyrat<-stack(buyrat)

attach(stacked_buyrat)
#making table apply chi-square test 
table(stacked_buyrat$ind,stacked_buyrat$values)

#H0 - All proportions are equal
#H1 - All proportions are not equal
chisq.test(table(stacked_buyrat$ind,stacked_buyrat$values))
#p-value is 0.6603 > 0.05 so p high null fly 
# null hypothesis H0 is accepted
#all proportions are equal or similar

#male-female buyer ratio are similar across all specified regions
