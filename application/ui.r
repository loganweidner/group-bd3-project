library(shiny)

shinyUI(
  fluidPage(
    titlePanel("Relationship between hesitancy and pupil spending per capita"),
    sidebarLayout(
      sidebarPanel(
        uiOutput('locationDropdown')
      ),
      mainPanel(
        plotOutput("scatterplot")
      )
    )
  ))