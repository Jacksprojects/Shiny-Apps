#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(psych)
datasets::mtcars

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$Corr <- renderPlot(pairs.panels(mtcars[, c(1,2,3,4,6,8,9)]))
    
    output$plot1 <- renderPlot(
        
        ggplot(data = mtcars, aes(x = mpg, y = wt, col = am)) +
            geom_point() +
            geom_smooth(method = "lm") +
            ggtitle("Weight vs MPG") +
            xlab("MPG") +
            ylab("Weight")
        )
    
    output$distPlot <- renderPlot({
        
        model <- lm(mpg ~ cyl + disp + hp + wt + am, data = mtcars)
        
        par(mfrow = c(2,2))
        plot(model)
        
        hp <- as.numeric(input$hp)
        wt <- as.numeric(input$weight)
        disp <- as.numeric(input$disp)
        am <- as.numeric(input$am)
        cyl <- as.numeric(input$cyl)
        
        newData <- data.frame(cyl, disp, hp, wt, am)
        
        pred <- predict(model, newdata = newData)
        
        output$pred<- renderText(pred)
    })
    
    

})
