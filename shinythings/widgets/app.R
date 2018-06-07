library(shinyWidgets)
library(shiny)

# Define UI ----
ui <- fluidPage(
  
  titlePanel("A Bunch of Widgets"),
  
  fluidRow(
    
    column(3,
           h3("Button Widgets"),
           actionButton("action", "Action"),
           br(),
           br(), 
           br(),
           submitButton("Submit"), 
           br(),
           br(),
           br(),
           actionBttn("fancy action", "Danger! Don't Click Me",
                      style = "jelly", color = "danger", size = "lg"),
           br(),
           br(),
           br(),
           actionGroupButtons(
             inputIds = c("btn1", "btn2", "btn3"), 
             labels = list("Action 1", "Action 2", tags$span(icon("gear"), "Action 3")), 
             status = "primary"),
           br(),
           br(),
           br(),
           downloadBttn("download button", "Click to Download"), 
           br(),
           br(),
           br(),
           prettyRadioButtons(inputId = "radio4", label = "Click me!",
                              choices = c("Click me !", "Me !", "Or me !"),
                              outline = TRUE,
                              plain = TRUE, icon = icon("thumbs-up"))),
    
    column(3,
           h3("Checkbox Widgets"),
           checkboxInput("checkbox", "Choice A", value = TRUE), 
           br(),
           br(),
           checkboxGroupInput("checkGroup", "Checkbox group", 
                              choices = list("Choice 1" = 1, 
                                             "Choice 2" = 2, 
                                             "Choice 3" = 3), selected = 1),
           br(),
           br(),
           prettyCheckbox(inputId = "checkbox2",
                          label = "Click me!", thick = TRUE,
                          animation = "pulse", status = "info", 
                          fill = T, shape = "round", bigger = T),
           br(),
           br(),
           prettyCheckboxGroup(inputId = "checkgroup5",
                               label = "Click me!", icon = icon("check"),
                               choices = c("Click me !", "Me !", "Or me !"),
                               animation = "rotate", status = "default"),
           br(),
           br(),
           h4("pretty sweet checkbox"),
           prettyToggle(inputId = "toggle4",
                        label_on = "Yes!",
                        label_off = "No..", outline = TRUE,
                        plain = TRUE, icon_on = icon("thumbs-up"), 
                        icon_off = icon("thumbs-down"))),
    
    column(3, 
           h3("Date/Calendar Widgets"),
           airDatepickerInput(inputId = "default",
                              label = "Choose a date:"),
           br(),
           airDatepickerInput(inputId = "range",
                              label = "Select range of dates:",
                              range = TRUE, value = c(Sys.Date()-7, Sys.Date())),
           br(),
           airDatepickerInput(inputId = "multiple times",
                              label = "Indicate 3 times you're free to meet:",
                              timepicker = T,
                              placeholder = "meeting times",
                              multiple = 3, separator = " ; ", 
                              clearButton = TRUE),
           airDatepickerInput(inputId = "inline",
                              label = "Inline:",
                              inline = TRUE))
  ),
  
  fluidRow(
    
    column(3,
           fileInput("file", h3("File input"))),
    
    column(3, 
           h3("Help text"),
           helpText("Note: help text isn't a true widget,", 
                    "but it provides an easy way to add text to",
                    "accompany other widgets.")),
    
    column(3, 
           numericInput("num", 
                        h3("Numeric input"), 
                        value = 1))   
  ),
  
  fluidRow(
    
    column(3,
           radioButtons("radio", h3("Radio buttons"),
                        choices = list("Choice 1" = 1, "Choice 2" = 2,
                                       "Choice 3" = 3),selected = 1)),
    
    column(3,
           selectInput("select", h3("Select box"), 
                       choices = list("Choice 1" = 1, "Choice 2" = 2,
                                      "Choice 3" = 3), selected = 1)),
    
    column(3, 
           sliderInput("slider1", h3("Sliders"),
                       min = 0, max = 100, value = 50),
           sliderInput("slider2", "",
                       min = 0, max = 100, value = c(25, 75))
    ),
    
    column(3, 
           textInput("text", h3("Text input"), 
                     value = "Enter text..."))   
  )
  
)

# Define server logic ----
server <- function(input, output) {
  
}

# Run the app ----
shinyApp(ui = ui, server = server)