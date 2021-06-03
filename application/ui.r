library(shiny)

shinyUI(
  fluidPage(
    titlePanel("Relationship between hesitancy and pupil spending per capita"),
    sidebarLayout(
      sidebarPanel(
        uiOutput('x_axis')
      ),
      mainPanel(
        plotOutput("scatterplot"),
        plotlyOutput("mapPlot")
      )
    )
  ))