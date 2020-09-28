library(shiny)
library(plotly)
# Choices for drop-downs
data_set <- c(
   "Mtcars" = "mtcars",
   "Iris" = "iris",
   "Airmiles" = "airmiles"
)
data("mtcars")
data("iris")
data("airmiles")

shinyUI(fluidPage(
   tabsetPanel(
      id = 'mainTab',
      tabPanel('Charts',
         h3("Shiny Application and Reproducible Pitch"),
         selectInput("source_select", "Select data source", data_set, selected = "Mtcars"),
         checkboxInput(
            inputId = 'chart_type', label = 'Plotly Chart Display', value = FALSE
         ),
         conditionalPanel(
            condition = 'input.chart_type == true',
            plotlyOutput('interactivePlot')
         ),
         conditionalPanel(
            condition = 'input.chart_type == false',
            plotOutput('staticPlot')
         )
      ),
      tabPanel('Data Set details',
         selectInput("source_select2", "Select data source", data_set, selected = "Mtcars"),
         radioButtons("dataHead", "Show Header",
            c( "Yes" = "yes", "NO" = "no")),
         tabPanel('Display Table', DT::dataTableOutput('table1'))
      ),
      tabPanel('Notes',
         h3("Peer-graded Assignment: Data Science Specialization Coursera course"),
         h3("Developing Data Products"),
         h3("Cristian Neuhaus"),      
         h3("Date: 26Sep20")
      )
   )
))