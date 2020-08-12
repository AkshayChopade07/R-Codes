wbcd<-read.csv("C:/Users/Immortal/Documents/R/wbcd_new.csv")
# table of diagnosis
prop.table(table(wbcd$diagnosis))*100
# recode diagnosis as a factor
wbcd$diagnosis <- factor(wbcd$diagnosis, levels = c("B", "M"),
                         labels = c("Benign", "Malignant"))
# create training and test data
wbcd_train <- wbcd[1:469, ]
wbcd_test <- wbcd[470:569, ]

# create labels for training and test data

wbcd_train_labels <- wbcd[1:469, 1]
wbcd_test_labels <- wbcd[470:569, 1]

#---- Training a model on the data ----

# load the "class" library
install.packages("class")
library(class)

wbcd_test_pred <- knn(train = wbcd_train[,-1], 
                      test = wbcd_test[,-1],
                      cl = wbcd_train_labels, k=30)
##--------Evaluating model performance ----
# Create the cross tabulation of predicted vs. actual
table(wbcd_test_labels,wbcd_test_pred)

