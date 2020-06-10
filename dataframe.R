a<-1
class(a)

a<-1.7L
class(a)

a<-134
class(a)

a<-1:10
a

a<-seq(1,20)
a

a<-seq(1,10,2)
a

1+2i  #Complex data types
x<-1+2i
x
Re(x) #Real Part
Im(x)  #Imaginary Part

x<-'LETTERS'[1:6]
x

x<-as.logical(1)
x


a<-c(1,2,3,4,5,'s')
a
is.vector(a)
a[c(1,5)]

a<-matrix(c(1,2,3,4,5,6),nrow = 1)
a

x<-[c(1,4),5]
rownames(x)<-c('row1','row2','row3','row4')
colnames(x)<-c('col1','col2','col3','col4')
x


Df<-data.frame(Id=c(1,2,3,4),name=c('a','b','c','d'),marks=c(20,24,25,7))
Df
Df2<-data.frame(Id=c(5,6,7,8),name=c('j','k','l','m'),marks=c(12,32,13,17))
Df2
Df[,1]
Df$name
cbind(Df,Df2)
rbind(Df,Df2)


k<-c("Blue","Green","Yellow","White","Red")
class(k)
k

l<-c(1,2,3,4,5)
class(l)
l
factor_l()<-factor(l)
factor_l
class(factor_l)

ls()
ls(pattern = 'var')