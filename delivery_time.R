dur=read.csv(choose.files())
View(dur)
summary(dur)
attach(dur)
colnames(dur)=c("dil","sort")
View(dur)
reg=lm(dil~sort , data = dur) # Y ~ X function to get the best model 
summary(reg)# to find the R value 
confint(reg,level = 0.95)# to find B0 and B1 
pred=predict(reg,interval = "predict")# predict the error 
pred
reg=lm(sqrt(dil)~sort , data = dur)# square root function model 
summary(reg)
confint(reg,level = 0.95)
pred=predict(reg,interval = "predict")
pred
reg=lm(log(dil)~sort,data = dur)
summary(reg)
confint(reg,level = 0.95)
pred=predict(reg,interval = "predict")
pred
reg=lm(dil~log(sort), data = dur)
summary(reg)
confint(reg,level = 0.95)
pred=predict(reg,interval = "predict")
pred
reg=lm(log(dil)~sort + I(sort*sort), data=dur)
summary(reg)
confint(reg, level = 0.95)
pred=predict(reg,interval = "predict")
pred
