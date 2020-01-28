

library(shiny)

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Sine/Cosine Frequency & Amp"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
      sliderInput(inputId = "sin_freq",
                  label = "sine frequency:",
                  min = 1,
                  max = 180,
                  value = 2),
      
      sliderInput(inputId = "sin_amp",
                  label = "sine amplitude:",
                  min = 1,
                  max = 10,
                  value = 2),
      
      sliderInput(inputId = "cos_freq",
                  label = "cosine frequency:",
                  min = 1,
                  max = 180,
                  value = 2),
      
      sliderInput(inputId = "cos_amp",
                  label = "cosine amplitude:",
                  min = 1,
                  max = 10,
                  value = 2)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
    )
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$distPlot <- renderPlot({
    
    x<- seq(0, pi * input$cos_freq, 0.1)
    y<- seq(0, pi * input$cos_freq, 0.1)
    cosine<-cos(x) * input$cos_amp
    sine<-sin(y)* input$sin_amp
    plot(x,sine,type='l')
    #plot(x,cosine,type='l')
    par(col='red')
    lines(x,cosine)
  })
  
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)

