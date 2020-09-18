#Recommend a best book based on the ratings.

#Installing and loading the libraries
install.packages("recommenderlab", dependencies=TRUE)
install.packages("Matrix")
install.packages("caTools")
install.packages("plyr")
library(plyr)
library(recommenderlab)
library(Matrix)
library(caTools)
#book rating data
book_rate_data <- read.csv('C:/Users/admin/Desktop/book.csv')
#metadata about the variable
book_rate_data<-book
str(book_rate_data)
#rating distribution
hist(book_rate_data$book.rating)

#the datatype should be realRatingMatrix inorder to build recommendation engine
book_rate_data_matrix <- as(book_rate_data, 'realRatingMatrix')
book_rate_data_matrix@data

#User Based Collaborative Filtering

book_recomm_model2 <- Recommender(book_rate_data_matrix, method="UBCF")

#Predictions for all users 
recommended_items2 <- predict(book_recomm_model2, book_rate_data_matrix, n=5)
d<-as(recommended_items2, "list")
library (plyr)
df <- ldply (d, data.frame)
d
