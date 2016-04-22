#
#setwd("~/GitHub/CapstoneProject")

# to do: remove swear words and make a larger set

PredictionModel <- function(phrase) {
  
  # load libraries
  library(tm)
  
  # load the model
  load("pridictionModel.rda")
  
  if(phrase == '') return("Caution: Please enter a phrase")
  
  # clean up
  phrase <- trimws(phrase)
  phrase <- tolower(phrase)
  phrase <- stripWhitespace(phrase)
  phrase <- removePunctuation(phrase)
  phrase <- removeNumbers(phrase)
  
  # split into words and find the last 4
  phrase <- strsplit(phrase,split=" ")[[1]]
  
  w1 <- NULL
  w2 <- NULL
  w3 <- NULL

  if (length(phrase) >= 3){
    phrase  <- phrase[(length(phrase) - 2):length(phrase)]
    index <- 3
    w1 <- phrase[index-2]
    w2 <- phrase[index-1]
  } else {
    index <- length(phrase)
    w2 <- phrase[index-1]
  }
  w3 <- phrase[index]
  
  # predict results
  x4 <- subset(ngram.four, first == w1 & second == w2 & third == w3)
  x3 <- subset(ngram.tri, first == w2 & second == w3)
  x2 <- subset(ngram.bi, first == w3)
  x1 <- ngram.uni[1:3,]
  
  topResults <- function(df){
    results <- df[1:3,c("freq","nextWord")]
    results <- na.omit(results)
    return(results)
  }
  
  total <- rbind(topResults(x4), topResults(x3), topResults(x2), topResults(x1)) 
  total <- total[!duplicated(total$nextWord),]
  total[1:3,c("nextWord")]

  #unlist(total[1:3,c("nextWord")])
  #total[1:3,c("nextWord")]
  
}
