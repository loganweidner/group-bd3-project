
library(tidyverse)
library(ggplot2)
library(dplyr)

## Data 
hes_edu <- read.csv("data/hesitancy_and_education.csv")

shinyserver <- (function(input, output) {
  sample <- reactive({
    hes_edu
  })

  output$scatterplot <- renderPlot({
    print(sample())
    ggplot(sample(), aes_string(x = input$x_axis, y = 'hesitant'), fill = 'black') + 
      geom_point() +
      geom_smooth() 
    })

  output$x_axis <- renderPrint({
    selectInput(
      inputId = 'x_axis',
      label = 'State Data',
      choices = c('pupil_spending', 'grad_rate')
    )
  })
  
#  function(input, output) {
#    output$value <- renderPrint({ input$select })
#  }
})