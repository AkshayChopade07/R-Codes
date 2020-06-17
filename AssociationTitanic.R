#Association Rules
library(arules)
Titanic1<-Titanic[,-c(1)]     #Remove the 1st colmn
rules <- apriori(Titanic1)
arules::inspect(rules)
rules.sorted <- sort(rules,by="lift")#Sorted rules used to display values greater than 1 to eliminate to lift value which are less than 1
arules::inspect(rules.sorted)# 27 rules replaced by 10 rules

#rules with rhs containing "Survives only"
rules<-apriori(Titanic1,parameter= list(minlen=1,supp=0.2,conf=0.5)
               ,appearance=list(rhs=c("Survived=No","Survived=Yes")
                                ,default="lhs"),control=list(verbose=F))
arules::inspect(rules)

