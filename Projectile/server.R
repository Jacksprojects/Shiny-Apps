#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    # Render plot
    output$distPlot <- renderPlot({
        
        theta <- (input$theta)*(pi/180)
        g <- input$g
        u <- input$u
        height <- input$height
    
        x <- seq(0, 200, 0.1)
        y <- height + tan(theta) * x - (g/(2 * u^2 * cos(theta)^2)) * x^2
        
        # Convert outputs
        output$flightT <- renderText((u*sin(theta)+sqrt(((u*sin(theta))^2 + 2 * g * height)))/g)
        output$TimeMax <- renderText(u*sin(theta)/g) 
        output$initX<- renderText(u*cos(theta))
        output$initY<- renderText(u*sin(theta))
        output$Height <- renderText(height + u^2*sin(theta)^2/(2*g))
        output$Range <- renderText(u*cos(theta)*(u*sin(theta)+sqrt(((u*sin(theta))^2 + 2 * g * height)))/g)
        
        qplot(x = x, y = y) +
            xlim(0, 200) +
            ylim(0, 200) +
            xlab("Distance in Meters") +
            ylab("Height in Meters") +
            ggtitle("Parabolic Projectile Trajectory") +
            geom_point() +
            geom_smooth()
        })

   
})
