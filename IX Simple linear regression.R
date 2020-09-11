#1) Calories_consumed-> predict weight gained using calories consumed
#2) Delivery_time -> Predict delivery time using sorting time 
#3) Emp_data -> Build a prediction model for Churn_out_rate 
#4) Salary_hike -> Build a prediction model for Salary_hike
#Do the necessary transformations for input variables for getting better R^2 value for the model prepared.

#1) Calories_consumed-> predict weight gained using calories consumed

#import data
Calories_consumed <- read.csv("D:/folders/ExcelR/Assignments/Simple Linear Regression/calories_consumed.csv") 

#Summary of Import Data
summary(Calories_consumed)

# Variance and Standard deviation of Calories.Consumed column
var(Calories_consumed$Calories.Consumed)
sd(Calories_consumed$Calories.Consumed)

#Variance and Standard deviation of Weight.gained..grams. column
var(Calories_consumed$Weight.gained..grams.)
sd(Calories_consumed$Weight.gained..grams.)

#Creating Linear Model for weight gain
WeightGainModel <- lm(Weight.gained..grams. ~ Calories.Consumed, data = Calories_consumed)
summary(WeightGainModel)

plot(Calories_consumed)

#Hence the P-value is less than 0.05. So X varibale is significance 
#and also Multiple R-Square value is 0.8968. 
#That's mean this model will predict the output 89.68% time correct
########################################################################################################################################################

#2) Delivery_time -> Predict delivery time using sorting time

#import data
delivery_time <- read.csv("D:/folders/ExcelR/Assignments/Simple Linear Regression/delivery_time.csv") 
summary(delivery_time)

# Variance and Standard deviation of Delivery.Time column
var(delivery_time$Delivery.Time)
sd(delivery_time$Delivery.Time)

# Variance and Standard deviation of Sorting.Time column
var(delivery_time$Sorting.Time)
sd(delivery_time$Sorting.Time)

#Creating Linear Model for delivery time
deliverTimeModel <- lm(Delivery.Time ~ Sorting.Time, data = delivery_time)
summary(deliverTimeModel)

plot(deliverTimeModel)

#Hence the P-value is less than 0.05. 
#So X varibale is significance and also Multiple R-Square value is 0.6823. 
#That's mean this model will predict the output 68.23% time correct

#For Increasing R squared value
#Using mvinfluence in Linear Model to find the point which are creating problems

library(mvinfluence)
library(car)
influenceIndexPlot(deliverTimeModel)

#deleting outliers

deliverTimeModel <- lm(Delivery.Time ~ Sorting.Time, data = delivery_time[c(-5,-9,-21),])
summary(deliverTimeModel)

plot(deliverTimeModel)

#After removing 3 points Multiple R-Square value is increased to 0.8332. 
#That's mean this model will predict the output 83.32% time correct
###############################################################################################################

#3) Emp_data -> Build a prediction model for Churn_out_rate

#import data
Emp_data<- read.csv("D:/folders/ExcelR/Assignments/Simple Linear Regression/emp_data.csv") 
summary(Emp_data)

#Variance and Standard deviation of Salary_hike column
var(Emp_data$Salary_hike)
sd(Emp_data$Salary_hike)

# Variance and Standard deviation of Churn_out_rate column
var(Emp_data$Churn_out_rate)
sd(Emp_data$Churn_out_rate)

#Creating Linear Model for Churn_out_rate
Churn_out_rate_Model <- lm(Churn_out_rate ~ Salary_hike, data = Emp_data)
summary(Churn_out_rate_Model)

plot(Churn_out_rate_Model)

#Hence the P-value is less than 0.05. So X varibale is significance and also Multiple R-Square value is 0.8312
#That's mean this model will predict the output 83.12% time correct.

##############################################################################################################

#4) Salary_hike -> Build a prediction model for Salary_hike

#import data
Salary_hike <- read.csv("D:/folders/ExcelR/Assignments/Simple Linear Regression/Salary_Data.csv")
summary(Salary_hike)

# Variance and Standard deviation of Salary_hike column
var(Salary_hike$YearsExperience)
sd(Salary_hike$YearsExperience)

# Variance and Standard deviation of Churn_out_rate column
var(Salary_hike$Salary)
sd(Salary_hike$Salary)

#Creating Linear Model for Salary_hike
Salary_hike_Model <- lm(Salary ~ YearsExperience, data = Salary_hike)
summary(Salary_hike_Model)

plot(Salary_hike_Model)

#Hence the P-value is less than 0.05. So X varibale is significance and also Multiple R-Square value is 0.957
#That's mean this model will predict the output 95.7% time correct
















