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
    titlePanel("Car Mileage Prediction App"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("hp",
                        "Horsepower:",
                        min = 50,
                        max = 335,
                        value = 146),
            
            sliderInput("cyl",
                        "Number of Cylinders:",
                        min = 4,
                        max = 8,
                        step = 2,
                        value = 4),
            
            sliderInput("am",
                        "Automatic Transmission",
                        min = 0,
                        max = 1,
                        step = 1,
                        value = 0),
            
            sliderInput("weight",
                        "Vehicle Weight (Tons) :",
                        min = 1.5,
                        max = 5.5,
                        value = 3.2),
            
            sliderInput("disp",
                        "Engine Displacement (cubic inches):",
                        min = 70,
                        max = 475,
                        value = 230),
            
            h3("The predicted MPG is:"),
            h1(textOutput("pred"))
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h3("Correlation Plot of Training Dataset"),
            plotOutput("Corr"),
            
            plotOutput("plot1"),
            
            h3("Prediction Model Diagnostic"),
            plotOutput("distPlot")
            
        )
    )
))
