
#influence.measures(model.Car)


#for scatter plot matrix
pairs(Cars)

#for correlation matrix
cor(Cars)
model.car<-lm(MPG~VOL+HP+SP+WT,data = Cars)
summary(model.car)

 
#Mulit Colinearity
library(car)
car::vif(model.car)


plot(model.car)
