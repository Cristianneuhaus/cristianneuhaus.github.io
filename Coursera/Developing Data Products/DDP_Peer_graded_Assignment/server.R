shinyServer(function(input, output) {

   output$interactivePlot <- renderPlotly({
      if(input$source_select == "mtcars"){
         p <- plot_ly(mtcars, x = ~mpg, y = ~wt, type = "scatter", mode = "markers")
      }
      if(input$source_select == "iris"){
         p <- plot_ly(iris, x = ~Species, y = ~Sepal.Length, type = "box")
      }
      if(input$source_select == "airmiles"){
         p <- plot_ly(x = ~time(airmiles), y = ~airmiles, type = "scatter", mode = "lines")
      }
      print(p)
   })
   output$staticPlot <- renderPlot({
      if(input$source_select == "mtcars"){
         p <- plot(mtcars$mpg, mtcars$wt, xlab = "Miles Per Gallon(mpg)", 
                   ylab = "Weight (1000 lbs)", bty = "n")
      }
      if(input$source_select == "iris"){
         p <- plot(iris$Species, iris$Sepal.Length, xlab = "Species", 
                   ylab = "Length", bty = "n", pch = 16)
      }
      if(input$source_select == "airmiles"){
         p <- plot(airmiles)
      }
      print(p)
   })
   output$table1 <- DT::renderDataTable({
      #DT::datatable(diamonds2[, input$show_vars, drop = FALSE])
      if(input$source_select2 == "mtcars"){
         #x <- DT::datatable(mtcars, options = list(orderClasses = TRUE))
         x <- data.frame(mtcars)
      }
      if(input$source_select2 == "iris"){
         #x <- DT::datatable(iris, options = list(paging = FALSE))
         x <- data.frame(iris)
      }
      if(input$source_select2 == "airmiles"){
         x <- data.frame("year" = start(airmiles):end(airmiles), "val"=airmiles[1:((end(airmiles)[1]-start(airmiles)[1])+1)])
      }
      ifelse(input$dataHead=="yes",return(head(x)),return(x))
   })
}
)

