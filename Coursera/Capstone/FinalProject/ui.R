library(shiny)
#library(shinyjs)

shinyUI(
  fluidPage(
    titlePanel("Text Prediction Application"),
    sidebarPanel(
      textInput("inputText", h5("Add your text here")),
      #sliderInput("numToPredict", "Numbers of words to predict:", min = 1, max = 3, value = 2),
      submitButton("SUBMIT"), br(),
      # Action button to clear entered text phrase
      #actionButton("reset", label = "Clear"),

      tags$hr(style="border-color: black;"),
      tags$b("Usage example:"),
      helpText("Entered the text phrase like as:"), tags$i("It's opening day, a national holiday, and with that let's begin: Happy New"),
      helpText("Cleaned text phrase:"), tags$i("opening day national holiday let begin happy new"),
      helpText("Predicted next words"), tags$i("year"),br(),
      tags$hr(style="border-color: black;"),
      
      # Include clarifying text ----
      tags$b("About App:"),
      helpText("Model for predicting the next word based on the previous 1, 2, or 3 words."),
      helpText("N-gram model calculated based on English Language."),
      tags$b("Extra details:"),
      helpText(""),
      tags$a(href="https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip", "Coursera-SwiftKey"),
      helpText("Link to the Coursera-SwiftKey dataset."),
      helpText("Application runs with a sample size as 1% from the 3 files, New, Blogs and Twitter."),
      tags$a(href="https://github.com/Cristianneuhaus/cristianneuhaus.github.io/tree/master/Coursera/Capstone", "github - Cristian Neuhaus"),
      helpText("Link to the source code"),
      tags$a(href="https:", "Slide Deck"),
      helpText("Link to the slide deck that shows off the app and how the model works.")
    ),
    mainPanel(
      #tabsetPanel(type = "tabs", 
        tabPanel(h4("Output"),
          h4("Your imput text cleaned:"),
          span(h4(textOutput("cleanedInputText")), style="font-weight: bold; color: #4582ec"),
          br(),
          h4("Predicted word is:"),
          span(h2(textOutput("predictedWords")), style="font-weight: bold; color: #4582ec")
        #)
    ))
))