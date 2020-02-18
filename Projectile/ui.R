#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Projectile Simulator"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("theta",
                        "Launch Angle in Degrees:",
                        min = 0,
                        max = 90,
                        step = 1,
                        value = 45),
            
            sliderInput("g",
                        "Acceleration due to Gravity:",
                        min = 0,
                        max = 30,
                        value = 10),
            
            sliderInput("u",
                        "Initial Velocity:",
                        min = 0,
                        max = 100,
                        value = 70),
            
            sliderInput("height",
                        "Initial Height:",
                        min = 0,
                        max = 150,
                        value = 0),
            
            h4("Flight time"),
            textOutput("flightT"),
            
            h4("Range"),
            textOutput("Range"),
            
            h4("Maximum Height"),
            textOutput("Height"),
            
            h4("Time to Reach Maximum Height"),
            textOutput("TimeMax"),
            
            h4("Initial Velocity"),
            h6("X Component"),
            textOutput("initX"),
            
            h6("Y Component"),
            textOutput("initY")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot"),
            plotOutput("velocityPlot")
            
        )
    )
))
