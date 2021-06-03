library(shiny)

  ui <- navbarPage('Education and Vaccine Hesitancy', #Make Page tabs
                   tabPanel('About', #first tab, 'About' section
                            tags$img(src="brainy.jpg", 
                                     alt="Vaccine Hesitancy"),
                            # Accesses fonts and colors needed for project
                            tags$style(HTML(" 
        @import url('//fonts.googleapis.com/css?family=Lobster|Cabin:400,700');
    ")
                            ),
                            headerPanel(
                              # Title of the Project
                              h1("Correlation between Vaccine Hesitancy and State Education", 
                                 style = "font-family: 'Lobster';
                    font-size:25px;
                      color: #4d3a7d;")),
                            # For the line break
                            h2("_____________________________________________________"),
                            # For the project description and title
                      h3(strong("About The Project:"), style = "font-size:15px;"),
                            helpText( "The COVID-19 Pandemic, due to the unexpected chaos and 
            confusion, has caused doubts between the American public and the 
            U.S. government/companies. From the mask mandate to the ideologies 
            formed against the CCP, the notions around COVID-19 has impacted the 
            choices daily Americans make in terms of medical health. Moreover, 
            the recent opinions formed against the newly introduced vaccines 
            have caused a great amount of controversy. Keep in mind however that 
            some communities don't have access to certain forms of technological 
            communication and education which can drastically influence the 
            opinions formed about the COVID-19 vaccines. So in this project, 
            we will be observing the relationships between vaccine hesitancy, 
            a existing scale within our dataset,and state education through 
            graduation rates and per-pupil spending. To ultimately find out if 
            education is a prominent factor in the hesitancy of vaccines. "),
                            # For the data description
                            h4(strong("About The Dataset:"), style = "font-size:15px;"),
                            helpText("For the combined dataset, we retrieved and filtered the 
                        data through the websites: Kaggle.com and worldpopulationreview.com. "),
                            h5(strong("Creators:"), style = "font-size:15px;"),
                            helpText("Anthony Kim, Pranav, and Logan"),
                   ),
                   
                   
                   
                   
                   
                   tabPanel('State Data', #second tab, state data represented as a map
                            titlePanel("Relationship between hesitancy and pupil spending per capita"),
                            sidebarLayout(
                              sidebarPanel(
                                uiOutput('map_map_x_axis')),
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
                                uiOutput('y_axis'),
                                tags$p("Description:"), # Description for plot
                                helpText("The plot shown allows users to manually input the given
                  State Data and Hesitancy Level. Ultimately, the graph is 
                  attempting to display different relationships with Graduation 
                  Rate and Spending per Pupil to better observe the different 
                  effects of educational and financial inequality. As both 
                  factors can immensely impact the decisons everyday Americans
                  make in terms of, for example, vaccine hesitancy. 
                  However we should note that the Hesitancy level does not 
                  display distinguishable relationships if inputed.")
                              ),
                              mainPanel(
                                plotOutput("scatterplot")
                              )
                            )
                   ),
                   
                   
                   
                   
                   
                   
                   tabPanel('Table', #data table of data
                            dataTableOutput('table')
                   ),
                   tabPanel('Findings', #Final tab, findings data
                            tags$img(src="brainy2.jpg", 
                                     alt="Vaccine Hesitancy",
                                     height="65%", width="80%", align="left"),
                            headerPanel(
                              # Title of the Project
                              h1("Conclusion", 
                                 style = "font-family: 'Lobster';
                  font-size:25px;
                    color: #4d3a7d;")),
                            # For the line break
                            h2("_____________________________________________________"),
                            # Title of the Project
                            h3(strong("Analysis:"), style = "font-size:15px;"),
                            helpText("stuff")
                   )
  )
  
