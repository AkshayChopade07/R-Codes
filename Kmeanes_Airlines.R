library(data.table)
library(readxl)
#EastWestAirlines <- read_xlsx("C:/Users/Pawan Srivastav/Desktop/Data Science/Assignment/Clustering/EastWestAirlines.xlsx", sheet = "data")
EWAdata<- EastWestAirlines
View(EastWestAirlines)
colnames(EastWestAirlines)
ncol(EastWestAirlines)
airline_kmeans <- kmeans(EWAdata,5)
str(airline_kmeans)
airline_kmeans$centers

EastWestAirlines_New <- cbind(EastWestAirlines_New, airline_kmeans$cluster)
colnames(EastWestAirlines_New)

# Aggregate

aggregate(EastWestAirlines_New[,2:12],
          by= list(EastWestAirlines_New$`airline_kmeans$cluster`), FUN = mean)
library(cluster)



# Using Clara function(Clustering for Large Applications) to find cluster

xcl <- clara(norm_airline,5) #Using Centroid
clusplot(xcl)

#using Partition Arround Medoids to find cluster

xpm <- pam(norm_airline,5) # Using Medoids
clusplot(xpm)