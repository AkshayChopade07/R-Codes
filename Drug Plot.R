pain=c(4,5,4,3,2,4,3,4,4,6,8,4,5,4,6,5,8,6,6,7,6,6,7,5,6,5,5)
drug=c(rep("A",9),rep("B",9),rep("C",9))
migraine=data.frame(pain,drug)

plot(pain~drug,data=migraine)

#anova

result=aov(pain~drug,data = migraine)
summary(result)

