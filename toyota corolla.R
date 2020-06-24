library(readr)
ToyotaCorolla <- read_csv("C:/Users/Immortal/Documents/R/Toyoto_Corrola.csv")
View(ToyotaCorolla)
Corolla<-lm(Price~Age_08_04+KM+HP+cc+Doors+Gears+Quarterly_Tax+Weight,data = ToyotaCorolla)
summary(Corolla)


corolla_cc<-lm(Price~cc,data =ToyotaCorolla )
summary(corolla_cc)

corolla_Doors<-lm(Price~Doors,data =ToyotaCorolla )
summary(corolla_Doors)

corolla_cc_Doors<-lm(Price~cc+Doors,data =ToyotaCorolla )
summary(corolla_cc_Doors)

#without Doors
corolla_cc1<-lm(Price~Age_08_04+KM+HP+cc+Gears+Quarterly_Tax+Weight,data = ToyotaCorolla)
summary(corolla_cc1)

#without cc
corolla_Doors1<-lm(Price~Age_08_04+KM+HP+Doors+Gears+Quarterly_Tax+Weight,data =ToyotaCorolla )
summary(corolla_Doors1)

plot(Corolla)

library(car)
residualPlots(Corolla)
avPlots(Corolla)
qqPlot(Corolla)
influenceIndexPlot(Corolla)

ToyotaCorolla1<-ToyotaCorolla[-81,]
Corolla1<-lm( Price ~ Age_08_04 + KM + HP + Gears + Quarterly_Tax + 
                Weight, data = ToyotaCorolla1)
summary(Corolla1)
car::vif(Corolla1)
plot(Corolla1)
residualPlots(Corolla1)
qqPlot(Corolla1)
influenceIndexPlot(Corolla1)


ToyotaCorolla2<-ToyotaCorolla[-c(81,221),]
Corolla2<-lm( Price ~ Age_08_04 + KM + HP + Gears + Quarterly_Tax + 
                Weight, data = ToyotaCorolla2)
summary(Corolla2)
car::vif(Corolla2)
plot(Corolla2)
residualPlots(Corolla2)
qqPlot(Corolla2)
influenceIndexPlot(Corolla2)


ToyotaCorolla4<-ToyotaCorolla[-c(81,220,959),]
Corolla4<-lm( Price ~ Age_08_04 + KM + HP + Gears + Quarterly_Tax + 
                Weight, data = ToyotaCorolla4)
summary(Corolla4)
car::vif(Corolla4)
plot(Corolla4)
residualPlots(Corolla4)
qqPlot(Corolla4)
influenceIndexPlot(Corolla4)


ToyotaCorolla5<-ToyotaCorolla[-c(81,221,220,959,958),]
Corolla5<-lm( Price ~ Age_08_04 + KM + HP + Gears + Quarterly_Tax + 
                Weight, data = ToyotaCorolla5)
summary(Corolla5)
car::vif(Corolla5)
plot(Corolla5)
residualPlots(Corolla5)
qqPlot(Corolla5)
influenceIndexPlot(Corolla5)

ToyotaCorolla6<-ToyotaCorolla[-c(81,221,220,959,958,599),]
Corolla6<-lm( Price ~ Age_08_04 + KM + HP + Gears + Quarterly_Tax + 
                Weight, data = ToyotaCorolla6)
summary(Corolla6)
car::vif(Corolla6)
plot(Corolla6)
residualPlots(Corolla6)
qqPlot(Corolla6)
influenceIndexPlot(Corolla6)





library(car)
car::vif(Corolla)

library("MASS")
stepAIC(Corolla)



getwd()

View(ToyotaCorolla)

attach(Corolla)

pairs(Corolla)


panel.cor<-function(x,y,digits=2,prefix=",cex.cor")
{
  usr<-par("usr");on.exit(par(usr))
  par(usr=c(0,1,0,1))
  r=(cor(x,y))
  txt<-format(c(r,0.123456789),digits = digits)[1]
  txt<-paste(prefix,txt,sep = "")
  if (missing(cex.cor)) cex<-0.4/strwidth(txt)
  text(0.5,0.5,txt,cex = cex)
}
pairs(Corolla,upper.panel = panel.cor,main="Scatter plot matrix with correlation coefficients")

