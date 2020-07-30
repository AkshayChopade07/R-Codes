data("crime_data")
rawdf <- na.omit(crime_data)

head(rawdf)
desc_stats <- data.frame(
  Min = apply(rawdf, 2, min), # minimum
  Med = apply(rawdf, 2, median), # median
  Mean = apply(rawdf, 2, mean), # mean
  SD = apply(rawdf, 2, sd), # Standard deviation
  Max = apply(rawdf, 2, max) # Maximum
)
desc_stats <- round(desc_stats, 1)
head(desc_stats)

df <- scale(crime_data)
head(df)
set.seed(123)
km.res <- kmeans(scale(crime_data), 4, nstart = 25)
km.res

aggregate(crime_data, by=list(cluster=km.res$cluster), mean)
library("factoextra")
fviz_cluster(km.res, data = df,
             palette = c("#00AFBB","#2E9FDF", "#E7B800", "#FC4E07"),
             ggtheme = theme_minimal(),
             main = "Partitioning Clustering Plot"
)

library(cluster)
library(HSAUR)
data(pottery)
km    <- kmeans(pottery,3)
dissE <- daisy(pottery) 
dE2   <- dissE^2
sk2   <- silhouette(km$cl, dE2)
plot(sk2)