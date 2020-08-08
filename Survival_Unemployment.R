install.packages("survival")
library(survival)
survival_unemployment1<-read.csv("C:/Users/Immortal/Documents/R/survival_unemployment1.CSV")

attach(survival_unemployment1)

# Define variables 
time <- spell
group <- ui
X <- cbind(logwage, ui, age)
# Kaplan-Meier non-parametric analysis
kmsurvival <- survfit(Surv(time,event) ~ 1)

plot(kmsurvival, xlab="Time", ylab="Survival Probability")

# Kaplan-Meier non-parametric analysis by group
kmsurvival1 <- survfit(Surv(time, event) ~ group)
plot(kmsurvival1,xlab="Time", ylab="Survival Probability",col = c(2,3),conf.int = T)

