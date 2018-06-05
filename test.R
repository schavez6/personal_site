if(require(shiny)){
  library(wordcloud2)
  # Global variables can go here
  n <- 1
  
  library(tidytext)
  library(tidyverse)
  library(stringr)
  library(ggplot2)
  library(reshape2)
  library(wordcloud2)
  library(memoise)
  library(tm)
  
  #Read in the presidents data file 
  #Check data structure to make sure speech column is character and the party column is factor 
  
  pres <- read.csv("presidents.csv")
  pres$X <- NULL
  
  #There are some white space in the inaugural speech. Trim the white space in the speech column (use str_squish to trim whitespace inside a string; str_trim only trims start and end of a string)
  
  pres$speech <- str_squish(pres$speech)
  
  #Convert the speech data into Tidy Data format, one-token-per-document-per-row   
  
  combined_speeches <- pres %>% unnest_tokens(word, speech)
  
  #print the head of the unnested data
  
  print(head(combined_speeches))
  
  #Count the most common words and notice that prior to removing stop-words, the most common words are things like "the", "a", etc... 
  
  #note: most common words are "the", "of", "and" "to", etc.
  combined_speeches %>% count(word, sort=T)
  
  #Remove the stop-words in our speech data, notice the decrease in number of rows.
  
  data(stop_words)
  #number of rows goes from 35,764 to 13,111 rows
  combined_speeches <- combined_speeches %>% anti_join(stop_words)
  
  #After removing stop words, now use count to find most common words in the inaugural data
  
  combined_speeches %>% count(word, sort=T) #most common words, collapsing across presidents, are "government", "people", "0097", "world", "country", etc.
  
  #What's up with the string 0097? It may have something to do with the way the speeches were coded (U+0097 in Unicode Character refers to 'END OF GUARDED AREA'). So let's remove "0097" from our analysis by creating a custom stop-word for "0097" and apply this to the data.
  
  #Checking to see if there are other numeric "words"
  combined_speeches %>% arrange(word) %>% count(word)
  
  #Adding all numeric "words" to the custom stop words, not just 0097.
  custom_stop_words <- bind_rows(data_frame(word=c("0085","0092","0093","0094","0097"), 
                                            lexicon=c("custom")), 
                                 stop_words)
  custom_stop_words
  
  #now lets see the top words again and make sure "0097" is not present anymore.
  
  combined_speeches <- combined_speeches %>% anti_join(custom_stop_words)
  combined_speeches %>% count(word, sort=T) #most common words, collapsing across presidents, are "government", "people", "world", "country", "public", etc.
  
  custom_stop_words <- bind_rows(data_frame(word=c("0085","0092","0093","0094","0097", 
                                                   "america","american","america's","americans"), 
                                            lexicon=c("custom")), 
                                 stop_words)
  custom_stop_words
  combined_speeches <- combined_speeches %>% anti_join(custom_stop_words)
  
  wordclouds <- combined_speeches %>% group_by(party) %>% 
    count(word)
  
  parties <<- list("republican" = "repub",
                   "democrat" = "demo")
  
  # Define the UI
  ui <- bootstrapPage(
    selectInput("selection", "Choose a party:",
                choices=parties),
    numericInput('size', 'Size of wordcloud', 
                 n),
    wordcloud2Output('wordcloud2')
  )
  
  
  # Define the server code
  server <- function(input, output) {
    output$wordcloud2 <- renderWordcloud2({
      # wordcloud2(demoFreqC, size=input$size)
      wordcloud2(data = filter(wordclouds, party==input$selection, n>1), size=input$size)
    })
  }
  # Return a Shiny app object
  # Sys.setlocale("LC_CTYPE","chs") #if you use Chinese character
  ## Do not Run!
  shinyApp(ui = ui, server = server)
}