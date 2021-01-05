library(shiny)
library(tm)

# Restore bi-grams and tri-grams - from nGrams.RMD code
bigramMatrixFreq <- readRDS("bigramMatrixFreq.rds")
trigramMatrixFreq <- readRDS("trigramMatrixFreq.rds")

clean_corpus <- function (dataSet) {
  dataSet <- gsub(pattern="(f|ht)tp(s?)://(.*)[.][a-z]+", replace=" ", dataSet) # remove URL
  dataSet <- gsub(pattern="@[^\\s]+", replace=" ", dataSet) # remove URL
  dataSet <- gsub(pattern="\\b[A-Z a-z 0-9._ - ]*[@](.*?)[.]{1,3} \\b", replace=" ", dataSet) # remove URL
  dataSet <- iconv(dataSet, "latin1", "ASCII", sub = "") # remove non-English words
  dataSet <- gsub(pattern="\\W", replace=" ", dataSet) # remove punctuation
  dataSet <- gsub(pattern="\\d", replace=" ", dataSet) # remove digits/numbers
  dataSet <- tolower(dataSet) # transform to lower case
  dataSet <- removeWords(dataSet, stopwords("english")) # remove stop words
  dataSet <- gsub(pattern="\\b[A-z]\\b{1}", replace=" ", dataSet) # remove single chars
  dataSet <- stripWhitespace(dataSet) # remove white spaces
  if (substring(dataSet, 1, 1) ==" "){dataSet <- substring(dataSet, 2)} # remove white spaces in first char
  if (stri_stats_latex(dataSet)[4]==0){dataSet <- "* no words after cleaning it *"}
  return(dataSet)
}

lastWords <- function(input) {
  #input <- " open to that and lot of"
  i <- stri_stats_latex(input)[4]
  ifelse(stri_stats_latex(input)[4] > 1,
    return(paste(word(input, i-1),word(input, i))),
    return(word(input, i))
  )
}

# Predict the next worlds
predictWords <- function(input) {
  word_to_predict <- lastWords(clean_corpus(input))
  i <- stri_stats_latex(word_to_predict)[4] # number of chars
  ifelse(i == 1,
         temp_string <- bigramMatrixFreq[grep(paste("^",word_to_predict, sep=""), bigramMatrixFreq[,1]),],
         temp_string <- trigramMatrixFreq[grep(paste("^",word_to_predict, sep=""), trigramMatrixFreq[,1]),]
  )
  i <- stri_stats_latex(temp_string$term[1])[4] # number of chars
  # check if it find something
  ifelse(i > 0,
         temp_string <- paste(word(temp_string$term[1], i), " (", 
                              round(temp_string$count[1]/sum(temp_string$count)*100,2),
                              "% confident)",
                              sep = ""), 
         temp_string <- "word not found"
  )
  return(temp_string)
}

shinyServer(
  function(input, output) {
    #observeEvent(input$reset, reset("inputText"))
    # Clean the input text using function clean_corpus above
    output$cleanedInputText <- renderText({
      clean_corpus(input$inputText)
    })
    
    # Predict next char using function predictWords above
    output$predictedWords <- renderText({
      predictWords(input$inputText)
    })
  })