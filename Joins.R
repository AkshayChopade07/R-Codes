df1= data.frame(customerId=c(1:6),product=c("Oven","Television","Fridge","Cupboard","Cylinder","Washing machine"))
df1

x<-matrix(rnorm(30),nrow=5,ncol=6)
x
apply(x,1,sum)
apply(x,2,sum)

#lapply
a<-matrix(1:9,3,3)
a
b<-matrix(4:15,4,3)
b
c<-matrix(8:10,3,2)
c
mylist<-list(a,b,c)
mylist
class(mylist)
lapply(mylist,mean)


mapply(sum,c(1,2,3),c(4,5,6),c(7,8,9))
m1=matrix(c(1,2,3,4))
m2=matrix(c(5,6,7,8))
mapply(sum,m1,m2)


data()
attach(iris)
View(iris)
tapply(Sepal.Length,Species,mean)
tapply(Sepal.Width,Species,median)


#get working directory
getwd()

data=read.csv("")

library(readxl)

install.packages("dplyr")
library(dplyr)
data()
data(mtcars)
View(mtcars)


#Distinct
distinct(mtcars["cyl"])
distinct(mtcars[c("cyl","gear")])


#NA

c(1,2,3,NA,NULL)
sum(10,20,NA)
mean(c(2,2,2,2,NA),na.rm=T)
sum(10,20,NA)
sum(10,20,NA,na.rm=T)


#Rowsums
data("iris")
View(iris)
rowSums(iris[,-5])
