#scatter plot matrix
pairs(Cars)

#Correlation matrix
cor(Cars)

#Regression model on all 4 variables& summary
#the linear model of interest
model.car <- lm(MPG~VOL+HP+SP+WT,data=Cars)
summary(model.car)


########                    Scatter plot matrix with Correlations inserted in graph
panel.cor <- function(x, y, digits=2, prefix="", cex.cor)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r = (cor(x, y))
  txt <- format(c(r, 0.123456789), digits=digits)[1]
  txt <- paste(prefix, txt, sep="")
  if(missing(cex.cor)) cex <- 0.4/strwidth(txt)
  text(0.5, 0.5, txt, cex = cex)
}

pairs(Cars, upper.panel=panel.cor,main="Scatter Plot Matrix with Correlation Coefficients")


#Regress individually on non-significant variables
model.carV <- lm(MPG~VOL,data = Cars)
summary(model.carV)
model.carW <- lm(MPG~WT,data = Cars)
summary(model.carW)
model.carVW <- lm(MPG~VOL+WT,data = Cars)
summary(model.carVW)

#Check for multicollinearity
library(car)
car::vif(model.car)

#Treating collinearity using backward subset selection methos
library("MASS")
stepAIC(model.car) 

plot(model.car) #Modelvalidation plots( Hint enter in console to get all 4 plots)

#After treating collinearity, we drop WT variable & create a new model
model.final <- lm( MPG~VOL+HP+SP+WT,data = Cars)
summary(model.final)

#Diagnostic plots
# Residual Vrs Regressors,QQ plots,Std ResidualVrsFitted 
plot(model.car)


residualPlots(model.car)
#Added variable plots
avPlots(model.car,id.n=2,id.cex=0.7)

#QQ plots of studentised residuals
qqPlot(model.car)

#Deletion diagnotics
influenceIndexPlot(model.car) #index plots of the influence measures

Cars_D77 <- Cars[-77,]
