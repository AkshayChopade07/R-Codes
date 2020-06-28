Cigar<-read.csv("C:/Users/Immortal/Documents/R/Cigarttes.csv")
View (Cigar)

pairs(Cigar[,2:8])
cor(Cigar[,2:8])

model<-lm(Sales~Age+HS+Income+Black+Female+Price,data=Cigar)
summary(model)