library(shinyWidgets)
library(shiny)

ui <- fluidPage(
  titlePanel("The Presidential Launch Codes"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Be careful.  Interacting with this shiny app could cause the world to implode."),
      
      actionBttn("fancy_action", "Danger! Don't Click Me",
                 style = "jelly", color = "danger", size = "lg")
    ),
    
    mainPanel(
      imageOutput("res_fancy_action")
    )
  )
)

server <- function(input, output) {
  observeEvent(input$fancy_action, {
    
    output$res_fancy_action <- renderImage({ 
      endworld <- normalizePath(file.path('./pics',
                                          paste('endworld', '.gif', sep='')))
      
      # Return a list containing the filename
      list(src = endworld)
    }, deleteFile = F)
  })
}

shinyApp(ui = ui, server = server)