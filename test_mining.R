# Install
install.packages("tm")  # for text mining
install.packages(c("SnowballC","textstem")) # for text stemming
install.packages("wordcloud") # word-cloud generator 
install.packages("RColorBrewer") # color palettes

library('tm')
library("SnowballC")
library("wordcloud")
library("RColorBrewer")
library('textstem')
# Importing apple reviews data
x <- as.character(amazon_reviews)
x <- iconv(x, "UTF-8") #Unicode Transformation Format. The '8' means it uses 8-bit blocks to represent a character
# Load the data as a corpus
x <- Corpus(VectorSource(x))
inspect(x[1])

# Convert the text to lower case
x1 <- tm_map(x, tolower)
inspect(x1[1])
# Remove numbers
x1 <- tm_map(x1, removeNumbers)
# Remove punctuations
x1 <- tm_map(x1, removePunctuation)

# Remove english common stopwords
x1 <- tm_map(x1, removeWords, stopwords('english'))

