library(shiny)

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  titlePanel("P-value calculator"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Choose a value between -5 and 5"),
    
      numericInput("num", 
                   h5("Enter a value for z"), 
                   value = 0,
                   min = -5,
                   max = 5,
                   step = 0.01)
    ),
    
    mainPanel(
      textOutput("selected_var"),
      br(),
      textOutput("p_val")
    )
  )
)
  

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  output$selected_var = renderText({ 
    paste("You have selected", input$num)
  })
  output$p_val = renderText({
    paste("The p-value is ", pnorm(input$num[1], mean=0, sd=1))
  })
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)