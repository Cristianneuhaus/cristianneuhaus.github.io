This folther contain two tasks from Coursera Data Science Capstone. Task 6 and Task 7.

# Task 6 - Data Product
The goal of this exercise is to create a product to highlight the prediction algorithm that you have built and to provide an interface that can be accessed by others via a Shiny app..

Tasks to accomplish

Create a data product to show off your prediction algorithm You should create a Shiny app that accepts an n-gram and predicts the next word.
Questions to consider

What are the most interesting ways you could show off your algorithm?
Are there any data visualizations you think might be helpful (look at the Swiftkey data dashboard if you have it loaded on your phone)?
How should you document the use of your data product (separately from how you created it) so that others can rapidly deploy your algorithm?
Tips, tricks, and hints

Consider the size of the predictive model you have developed. You may have to sacrifice some accuracy to have a fast enough/small enough model to load into Shiny. 

# Task 7 - Slide Deck
The goal of this exercise is to "pitch" your data product to your boss or an investor. The slide deck is constrained to be 5 slides or less and should: (1) explain how your model works, (2) describe its predictive performance quantitatively and (3) show off the app and how it works. 

Tasks to accomplish

Create a slide deck promoting your product. Write 5 slides using RStudio Presenter explaining your product and why it is awesome!
Questions to consider

How can you briefly explain how your predictive model works?
How can you succinctly quantitatively summarize the performance of your prediction algorithm?
How can you show the user how the product works?
Tips, tricks, and hints

The Rstudio presentation information is available here (https://support.rstudio.com/hc/en-us/articles/200486468-Authoring-R-Presentations). 

# Files details:
 - nGrams.RMD - Provide the data to the Shiny App. It download the data, clean it and prepare two files. bigramMatrixFreq and trigramMatrixreq
 - ui.R - user iterface for Shiny App.
 - server.R - For Shiny App.
 - bigramMatrixFreq.rds - that contain the 2-grams, provided by nGrams.RMD
 - trigramMatrixFreq - that contain the 3-grams, provided by nGrams.RMD
