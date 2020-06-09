filter(mtcars,cyl==8,gear==5)

filter(mtcars,cyl==8&gear==6)

filter(mtcars,cyl==8| gear==5)

#Selct Column
select(mtcars,"carb",mpg:disp,"gear")

select(mtcars,"carb",mpg:disp,contains("ge"),contains("cy"))

#Exclude a particular column
select(mtcars,c(-gear,-carb))
select(mtcars,-mpg:-disp)


#Arrange
arrange(mtcars,cyl)

#mutate:Add new varibale
#Base R Approach
temp<-mtcars
temp$new_var<-temp$hp+temp$wt
str(temp)
View(temp)
