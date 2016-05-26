library(shiny)

ui <- fluidPage(
  fluidRow(

    fluidRow(
      column(4, numericInput( 'mean', "Mean: ", value = 2, min = -10, max = 10)),
      column(4, numericInput( 'sd', "SD: ", value = 1, min = 1, max = 5)),
      column(4, numericInput( 'x' , "x Value:", value = 0, min = -10, max = 10))
    ),
    
    fluidRow(
      column(12, plotOutput("plot1"))
    ),
    
    fluidRow(
      column(12, textOutput("pvalue")),
      column(12, p('use the following formula to get the pvalue:')),
      column(12, textOutput("formula1"))
    )
  )
  
)

