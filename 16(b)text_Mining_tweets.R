#For Text Mining assignment

#ONE:
#  1) Extract tweets for any user (try choosing a user who has more tweets
#  2) Perform sentimental analysis on the tweets extracted from the above

#devtools::install_github("jrowen/twitteR", ref = "oauth_httr_1_0")
library("twitteR")
#install.packages("ROAuth")
library("ROAuth")

cred <- OAuthFactory$new(consumerKey='FXTquJNbgDG2dH81XYVqNZFAb', # Consumer Key (API Key)
                         consumerSecret='3y0ALNFzJ8JKyxzFd0ba9FWSUpNSWhPisEIZOB6WCTtcGvP6SO', #Consumer Secret (API Secret)
                         requestURL='https://api.twitter.com/oauth/request_token',
                         accessURL='https://api.twitter.com/oauth/access_token',
                         authURL='https://api.twitter.com/oauth/authorize')
#cred$handshake(cainfo="cacert.pem")
save(cred, file="twitter authentication.Rdata")

load("twitter authentication.Rdata")

#install.packages("base64enc")
library(base64enc)

#install.packages("httpuv")
library(httpuv)

setup_twitter_oauth("FXTquJNbgDG2dH81XYVqNZFAb", # Consumer Key (API Key)
                    "3y0ALNFzJ8JKyxzFd0ba9FWSUpNSWhPisEIZOB6WCTtcGvP6SO", #Consumer Secret (API Secret)
                    "529590041-qOXLd769cQEUTbXg3iRqCd33pC1K6xoORrGOMJDh",  # Access Token
                    "WlqZJwXFQzf64IuojkbKh1jdT5cnSY8U44pqmz6Sc1d4A")  #Access Token Secret

#registerTwitterOAuth(cred)

Tweets <- userTimeline('TheRock', n = 1000,includeRts = T)
TweetsDF <- twListToDF(Tweets)
dim(TweetsDF)
View(TweetsDF)

write.csv(TweetsDF, "Tweets.csv",row.names = F)

getwd()
# 
handleTweets <- searchTwitter('DataScience', n = 10000)
# handleTweetsDF <- twListToDF(handleTweets)
# dim(handleTweetsDF)
# View(handleTweetsDF)
# #handleTweetsMessages <- unique(handleTweetsDF$text)
# #handleTweetsMessages <- as.data.frame(handleTweetsMessages)
# #write.csv(handleTweetsDF, "TefalHandleTweets.csv")
# 
library(rtweet)


################################################################################################################


# Sentiment Analysis for tweets:


# install.packages("syuzhet")

# Read File 
fbdata <- read.csv(file.choose(), header = TRUE)
tweets <- as.character(fbdata$text)
class(tweets)

# Obtain Sentiment scores 
s <- get_nrc_sentiment(tweets)

head(s)

tweets[4]

# "@prpltnkr Hi there. You can learn how to report a #Page that's 
# pretending to be you in our Help Center: https://t.co/n1CJLpv30Z. -KN
# the above tweet has value 1 for anger, value 1 for Negative 
# and value 2 for positive which reinstates that it has a mixture of 
# all three emotions in the above statement.
get_nrc_sentiment('pretending')

# barplot 

barplot(colSums(s), las = 2.5, col = rainbow(10),
        ylab = 'Count',main= 'Sentiment scores for Facebook Tweets')



