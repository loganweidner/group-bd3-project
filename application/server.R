
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
  
  #make a df with user readable column names for table in shiny app
  user_data_table <- hes_edu %>% 
    select(State = state, 
           'Hesitant %' = hesitant,
           'Strongly Hesitant %' = strongly_hesitant,
           'Graduation Rate' = grad_rate, 
           '$ Per Pupil' = pupil_spending,
           )
  
  #make a scatterplot taking x and y axis as inputs
  output$scatterplot <- renderPlot({
    ggplot(sample(), aes_string(x = input$x_axis, y = input$y_axis), fill = 'black') + 
      geom_point() +
      geom_smooth() 
    })
  
  #x axis input for scatterplot
  output$x_axis <- renderPrint({
    selectInput(
      inputId = 'x_axis',
      label = 'State Data',
      choices = c('Spending Per Pupil' = 'pupil_spending', 'Garduation Rate' = 'grad_rate')
    )
  })
  
  #y axis input for scatterplot
  output$y_axis <- renderPrint({
    selectInput(
      inputId = 'y_axis',
      label = 'Hesitancy Level',
      choices = c('Hesitant' = 'hesitant', 'Strongly Hesitant' = 'strongly_hesitant')
    )
  })
  
<<<<<<< HEAD

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
=======
  #data table using specific readable df
  output$table <- renderDataTable(user_data_table)
>>>>>>> 073aa77b0c2348090262d2939646b8c423fab3d8
})