library(shiny)

ui <- fluidPage(
  fluidRow(

    fluidRow(
      column(6, numericInput( 'mean', "Mean: ", value = 2, min = -10, max = 10)),
      column(6, numericInput( 'sd', "SD: ", value = 1, min = 1, max = 5))
    ),
    
    fluidRow(
      column(12, plotOutput("plot1"))
    )
  )
  
)

