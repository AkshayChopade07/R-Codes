WCT<- wc_at
mymodel<-lm(AT~Waist,data=WCT)
summary(mymodel)

test<-data.frame(Waist=c(70,95))
test


pred<-predict(mymodel,newdata=test)
pred
finaldata<-data.frame(pred,"error")
