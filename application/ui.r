library(shiny)
library (plotly)


  ui <- navbarPage('The Impact of Education on Vaccine Hesitancy in the United
                   States', #Make Page tabs
                   
          tabPanel('About', #first tab, 'About' section
            # For intro display image
            tags$img(src="brainy.jpg", 
                    alt="Vaccine Hesitancy"),
            # Accesses fonts and colors needed for project
            tags$style(HTML("@import url('//fonts.googleapis.com/css?family=
                            Lobster|Cabin:400,700');")),
            headerPanel(
            # Title of the Project
            h1("Correlation between Vaccine Hesitancy and State Education", 
              style = "font-family: 'Verdana';
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
            a existing scale within our dataset, and state education through 
            graduation rates and per-pupil spending. To ultimately find out if 
            education is a prominent factor in the hesitancy of vaccines. "),
            # For the data description
            h4(strong("About The Dataset:"), style = "font-size:15px;"),
              helpText("For the combined dataset, we retrieved and filtered the 
                        data through the websites: Kaggle.com and worldpopulationreview.com. "),
            h5(strong("Creators:"), style = "font-size:15px;"),
              helpText("Anthony Kim, Pranav Senthilkumar, and Logan Weidner"),
          ),
            tabPanel('State Data', #second tab, state data represented as a map
              titlePanel("Interactive Map"),
                sidebarLayout(
                  sidebarPanel(
                    uiOutput('map_x_axis'),
                    tags$p("Description:"), # Description for plot
                    helpText("The interactive map shown allows users to choose 
                             a specific variable through the dropdown menu. Then
                             the given data, from the chosen variable, is 
                             reflected onto the color map. To elaborate, if a 
                             user were to choose a variable, for example Grad Rate,
                             the information from that specific column would 
                             accordingly match each state on the map. Allowing
                             users to hover their mouse over certain states to 
                             see the differences in numbers and visuals")
                  ),
                    mainPanel(
                        plotlyOutput("mapPlot"))
                      )
                   ),
            tabPanel('Graphing Relationships', #third tab, scatterplot made to show user relationship between vars
              titlePanel("Interactive Plot"),
                sidebarLayout(
                  sidebarPanel(
                    uiOutput('x_axis'),
                      uiOutput('y_axis'),
                        tags$p("Description:"), # Description for plot
                          helpText("The plot shown allows users to manually 
                          input the given State Data and Hesitancy Level. 
                          Ultimately, the graph is attempting to display 
                          different relationships with Graduation 
                          Rate and Spending per Pupil to better observe the 
                          different effects of educational and financial 
                          factors on vaccine hesitancy. As both can immensely impact the 
                          decisons everyday Americans make in terms of, for 
                          example, the act of getting vaccinated. Lastly, we 
                          should note that the Hesitancy level does not display 
                          distinguishable relationships if inputed.")
                        ),
                          mainPanel(
                          plotOutput("scatterplot")
                        )
                      )
                   ),
            tabPanel('Table', #data table of data
              dataTableOutput('table')),
                tabPanel('Findings', #Final tab, findings data
                  tags$img(src="brainy2.jpg", 
                           alt="Vaccine Hesitancy",
                           height="65%", width="80%", align="left"),
                  headerPanel(
                    # Title of the Project
                    h1("Conclusion", 
                        style = "font-family: 'Verdana';
                        font-size:25px;
                        color: #4d3a7d;")),
                    # For the line break
                    h2("_____________________________________________________"),
                    # Title of the Project
                    h3(strong("Analysis and Specific Insight:"), style = 
                                              "font-size:15px;"),
                      helpText("The most interesting findings from this project 
                               include that while the high school graduation 
                               rates by state did not seemingly have a correlation 
                               with vaccine hesitancy, there does seem to be a 
                               minor trend and a slight positive correlation 
                               between educational spending per student and 
                               vaccine hesitancy. Referencing the graphing 
                               relationships section, when we view the 
                               scatterplot, we are clearly able to tell that as 
                               spending per student increases, vaccine hesitancy 
                               decreases. However, when we view graduation rates 
                               plotted against vaccine hesitancy, we see no real 
                               trend, with a graph that oscillates back and 
                               forth."),
                  h4(strong("Broad Insight:"), style = "font-size:15px;"),
                  helpText("Broadly speaking, this provides some insight into 
                           the importance of primary and secondary education 
                           with regard to vaccine hesitancy. Students in states
                           with better-resourced schools are more likely to 
                           understand the scientific basis of the vaccine, and 
                           thus, are more likely to get vaccinated. Our data 
                           does not, however, show that states with higher 
                           high school graduation rates have lower vaccine 
                           hesitancy rates. This suggests that while investment 
                           in secondary education is a factor in vaccine 
                           hesitancy, it is far from the only factor, and other
                           factors may even have a larger impact."),
                  h5(strong("Data Quality:"), style = "font-size:15px;"),
                  helpText("While I believe that our data was trustworthy and 
                           accurate, due to the fact that the majority of the 
                           data was either taken directly from government 
                           webpages, or cross-verified using multiple sources, 
                           there may still have been structural inequities that 
                           impacted our data. For example, some of our data is 
                           the mean educational spending by state, however, 
                           students in well-funded school districts have vastly 
                           different experiences from those in underfunded 
                           schools, even if both schools are located in the same 
                           state. Further, a few particularly well-funded school 
                           districts can serve to severely inflate a mean, as a 
                           mean is not resistant to drastic outliers. All in all, 
                           while I do believe the data set is accurate, and 
                           of high quality, I think that there are some biases 
                           that must be accounted for when reviewing the data."),    
                  h6(strong("Future Insight:"), style = "font-size:15px;"),
                  helpText("For future ideas, we hope to analyze more relevant 
                  variables like family members per household and household 
                  income. Moreover, we would add more complex plots like a 3D 
                  graph or even a histogram to better observe and draw 
                  relationships with the given data. Ultimately, we would like to 
                  further our research in exploring reasons why individuals are 
                  hesitant in receiving the COVID-19 vaccine."),  
                   )
  )
  
