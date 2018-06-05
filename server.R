library(shiny)
library(wordcloud2)

shinyServer(function(input, output, session) {
  # Define a reactive expression for the document term matrix
  speechwords <- reactive({
    # Change when the "update" button is pressed...
    input$update
    # ...but not for anything else
    isolate({
      withProgress({
        setProgress(message = "Processing speeches...")
        getData(input$selection)
      })
    })
  })
  
  
  # Make the wordcloud drawing predictable during a session
  
  wordcloud2Output <- function(wordle, width="100%", height="400px") {
    htmlwidgets::shinyWidgetOutput(wordle, "wordcloud2", width, height, package = "wordcloud2")
  }
    
  renderWordcloud2 <- function(mycloud, env = parent.frame(), quoted=F) {
    if (!quoted) {mycloud <- wordcloud2(data=speechwords,
                          figPath = ifelse(input$selection=="republican", "pics/republican_symbol.png", "pics/democratic_symbol.png"),
                          color = ifelse(input$selection=="republican", "red", "blue"), 
                          backgroundColor = "black")}
    htmlwidgets::shinyRenderWidget(mycloud, wordcloud2Output, env, quoted=T)
  }
})  