fluidPage(
  # Application title
  titlePanel("Word Clouds of Speeches by Major Political Parties"),
  
  sidebarLayout(
    # Sidebar with a slider and selection inputs
    sidebarPanel(
      selectInput("selection", "Choose a party:",
                  choices = parties),
      actionButton("update", "Change"),
      hr()
      #sliderInput("freq",
      #            "Minimum Word Frequency:",
      #            min = 1,  max = 50, value = 2),
      #selectInput("color", "Choose a text color:",
      #            choices = wordlecolor),
      #selectInput("shape", "Choose a shape for your wordle:",
      #            choices = shapes)
    ),
    
    # Show Word Cloud
    mainPanel(
      wordcloud2Output("wordle")
    )
  )
)