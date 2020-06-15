library(moments)
skewness(Q9_a$speed)
skewness(Q9_a$dist)


kurtosis(Q9_a$speed)
kurtosis(Q9_a$dist)

hist(Q9_a$speed, breaks=20)
hist(Q9_a$dist, breaks=20)

library(moments)
skewness(Q9_b$SP)
skewness(Q9_b$WT)

kurtosis(Q9_b$SP)
kurtosis(Q9_b$WT)

hist(Q9_b$SP, breaks=20)
hist(Q9_b$WT, breaks=20)
