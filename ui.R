library(shiny)
library(ggplot2)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Diamonds App"),
  
  # sidebarPanel contains the inputs 
  sidebarLayout(
    sidebarPanel(
       sliderInput("sliderDepth", "What is the depth?", 43, 79, value = 60),
       checkboxInput("show_title", "Show/Hide Title"),
       submitButton("Submit")
    ),
    
    # mainPanel shows the outputs
    mainPanel(
       plotOutput("plot1"),
       h3("Predicted price From Model 1:"),
       textOutput("pred1")
    )
  )
))
