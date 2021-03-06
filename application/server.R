#load libraries
library(tidyverse)
library(ggplot2)
library(dplyr)
library (plotly)


## Data 
hes_edu <- read.csv("data/hesitancy_and_education.csv")

shinyserver <- (function(input, output) {
  
  #make a df with user readable column names for table in shiny app
  user_data_table <- hes_edu %>% 
    select(State = state, 
           'Hesitant %' = hesitant,
           'Strongly Hesitant %' = strongly_hesitant,
           'Graduation Rate' = grad_rate, 
           '$ Per Pupil' = pupil_spending,
           )
  
  
  #x axis (education) input for scatterplot
  output$x_axis <- renderPrint({
    selectInput(
      inputId = 'x_axis',
      label = 'State Data',
      choices = c('Spending Per Pupil' = 'pupil_spending', 'Graduation Rate' = 'grad_rate'),
      selected = 'pupil_spending'
    )
  })
  
  #y axis (vaccine hesitancy) input for scatterplot
  output$y_axis <- renderPrint({
    selectInput(
      inputId = 'y_axis',
      label = 'Hesitancy Level (% by State)',
      choices = c('Hesitant' = 'hesitant', 'Strongly Hesitant' = 'strongly_hesitant'),
      selected = 'hesitant'
    )
  })
  
  #make a scatterplot taking x and y axis as inputs
  output$scatterplot <- renderPlot({
    ggplot(hes_edu, aes_string(x = input$x_axis, y = input$y_axis), fill = 'black') +
      geom_point() +
        #make it use the loess method to get rid of warnings
        geom_smooth(method = "loess")
  })
  
  # creating a map using plotly
  output$mapPlot <- renderPlotly({
    
    #plotly requires state abbreviations, adding that data column
    new_data <- hes_edu %>%
      mutate(uppercase = str_to_title(state)) %>%
      mutate(abbrevs = state.abb[match(uppercase, state.name)])
    
    #using plotly's US Map, making sure only US is shown, and adding the data 
    #to be displayed, and the color for the gradient
    fig <- plot_geo(new_data, locationmode = 'USA-states') %>%
      add_trace(
        z = ~get(input$map_var),
        locations = ~abbrevs,
        color = ~get(input$map_var),
        colors = 'Purples'
      ) %>%
      layout(
        title = 'Map of HS Grad Rate/Vaccine Hesitancy',
        geo = list(scope = 'usa')
      )
    
    return(fig)
  })
  #allowing the user to input data to choose the data shown on map
  output$map_var <- renderPrint({
    selectInput(
      inputId = 'map_var',
      label = 'State Data',
      choices = c('Spending Per Pupil' = 'pupil_spending', 'Graduation Rate' = 'grad_rate')
    )
  })

  #data table using specific readable df
  output$table <- renderDataTable(user_data_table)

      choices = c('pupil_spending', 'grad_rate')
    
  })
<<<<<<< HEAD
  

=======
>>>>>>> 333099a8acd6aacc0d4a55bc7cb8be703123b2b6
