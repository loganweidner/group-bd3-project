library(shiny)

shinyUI(
  ui <- navbarPage('Education and Vaccine Hesitancy',
           tabPanel('About',
              textOutput('This is where we will describe the project and data.')
           ),
           tabPanel('State Data'
           ),
           tabPanel('Graphing Relationships',
              titlePanel("Relationship between hesitancy and pupil spending per capita"),
              sidebarLayout(
                sidebarPanel(
                  uiOutput('x_axis')
                ),
                mainPanel(
                  plotOutput("scatterplot")
                )
              )
           ),
           tabPanel('Findings',
              textOutput('This is where we will write our conclusion and acknowledgements')
           )
        )
  # fluidPage(
  #   titlePanel("Relationship between hesitancy and pupil spending per capita"),
  #   sidebarLayout(
  #     sidebarPanel(
  #       uiOutput('x_axis')
  #     ),
  #     mainPanel(
  #       plotOutput("scatterplot")
  #     )
  #   )
  # )
)