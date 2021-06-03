
library(tidyverse)
library(ggplot2)
library(dplyr)
library (plotly)

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
  

  output$mapPlot <- renderPlotly({
    new_data <- hes_edu %>%
    mutate(uppercase = str_to_title(state)) %>%
      mutate(abbrevs = state.abb[match(uppercase, state.name)])
    
    fig <- plot_geo(new_data, locationmode = 'USA-states') %>%
      add_trace(
        z = ~grad_rate,
        locations = ~abbrevs,
        color = ~grad_rate,
        colors = 'Purples'
      ) %>%
      layout(
        title = 'Map of HS Grad Rate/Vaccine Hesitancy',
        geo = list(scope = 'usa')
      )
    
    return(fig)
  })
  
  
  
  
#  function(input, output) {
#    output$value <- renderPrint({ input$select })
#  }
})