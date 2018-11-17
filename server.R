# This is a shiny app to determine diamond price based on depth.
library(shiny)
library(ggplot2)

# Define server logic
shinyServer(function(input, output){ 
        # Load data
        data("diamonds")
        model1 <- lm(price ~ depth, data = diamonds)
        
        # Create the initial output
        model1pred <- reactive({
        depthInput <- input$sliderDepth
        predict(model1, newdata = data.frame(depth = depthInput))
                        
})
        
        output$plot1 <- renderPlot({
        depthInput <- input$sliderDepth
        main <- ifelse(input$show_title, "Price of diamond predicted from depth", "")
        
        plot(diamonds$depth, diamonds$price, main = main, xlab = "Depth", ylab = "Price", pch = 16)
        abline(model1, col = "blue")
        points(depthInput, model1pred(), col = "red", pch = 16)
                        
        })

        output$pred1 <- renderText({
                model1pred()

        })
        
        
})


        
    
 
        
  

