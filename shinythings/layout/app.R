library(shiny)

ui <- fluidPage(
  titlePanel(em("my italicized title", align = "center")),
  
  sidebarLayout(position = "left",
                sidebarPanel(strong("my bold sidebar"),
                             img(src = "https://www.thefarmersbank.net/wp-content/uploads/2018/04/2005-Penny-Uncirculated-Obverse.png", height = 100, width = 100)),
                mainPanel(
                  h1("most important output"),
                  br(),
                  p("this is a paragraph that says nothing in particular.  it's just a bunch of sentences to illustrate a point about separating text.  watch, we're going to copy and paste it below as another paragraph."),
                  p("this is a paragraph that says nothing in particular.  it's just a bunch of sentences to illustrate a point about separating text."),
                  h2("less important blue output"),
                  h3(div("here's smaller text in blue", style = "color:blue")),
                  h4(p("here's a tiny text paragraph with just", span("a few orange words,", style = "color:orange"), "if you're into that."))
                )
  )
)

# Let's see what we created

server <- function(input, output) {
  # We'll get here in a sec
}
shinyApp(ui = ui, server = server)