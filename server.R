# load libraries
library(shiny)

# load code
source("prediction_model.R")

# Define a server for the Shiny app
shinyServer(function(input, output) {

  output$text <- renderText({
    text <- PredictionModel(input$text)
    text[1]
  })
  
  output$text2 <- renderText({
    
    text2 <- PredictionModel(input$text)
    paste(text2[2], text2[3], sep = ", ")
  })
  
})