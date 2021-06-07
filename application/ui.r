library(shiny)

shinyUI(
  ui <- navbarPage('Education and Vaccine Hesitancy', #Make Page tabs
                   tabPanel('About', #first tab, 'About' section
                            textOutput('This is where we will describe the project and data.')
                   ),
                   tabPanel('State Data', #second tab, state data represented as a map
                            titlePanel("Relationship between hesitancy and pupil spending per capita"),
                            sidebarLayout(
                              sidebarPanel(
                               uiOutput('map_var')
                              ),
                              mainPanel(
                                plotlyOutput("mapPlot")
                              )
                            )
                   ),
                   tabPanel('Graphing Relationships', #third tab, scatterplot made to show user relationship between vars
                            titlePanel("Relationship between hesitancy and pupil spending per capita"),
                            sidebarLayout(
                              sidebarPanel(
                                uiOutput('x_axis'),
                                uiOutput('y_axis')
                              ),
                              mainPanel(
                                plotOutput("scatterplot")
                              )
                            )
                   ),
                   tabPanel('Findings', #Final tab, findings data
                            textOutput('This is where we will write our conclusion and acknowledgements')
                   )
  )
)