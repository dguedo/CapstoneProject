#
#setwd("~/GitHub/CapstoneProject")

PredictionModel <- function(phrase) {
  
  # load libraries
  library(tm)

  # load the model
  load("pridictionModel.rda")
  
  # predict results
  result <- paste(ngram.bi[1,]$second, phrase)
   
  result
}
