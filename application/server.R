
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
    data <- hes_edu  
    ggplot(sample(), aes(x = as.numeric(input$y-axis), y = "hesitant")) +
      geom_point(mapping = aes(x = as.numeric(input$y-axis), y = hesitant, colour = hesitant)) +
      geom_smooth(mapping = aes(x = as.numeric(input$y-axis), y = hesitant, colour = hesitant)) +
      labs(
        x = "Pupil Spending Per Capita by State", # x-axis label (with units!)
        color = "h"
      ) 
})

  output$locationDropdown <- renderPrint({
    selectInput(
      inputId = 'y-axis',
      label = 'State Data',
      choices = c('hesitant', 'pupil_spending', 'grad_rate')
    )
  })
  
  function(input, output) {
    output$value <- renderPrint({ input$select })
  }
})