library(shiny)

server <- function(input, output){
  
  output$plot1 <-  renderPlot({
    x <- seq(-15,15, by = 0.1)
    y <- dnorm(x, mean = input$mean, sd = input$sd)
    plot(x,y, type = "l", col = "red", xlim = c(-15,15))
    abline( v = input$x, col = "blue")
  })
  
  output$pvalue <- renderText({
    pval <- pnorm(input$x, mean = input$mean, sd = input$sd)
    paste("The probability is:", round(pval, 3), sep = " ")
  })
  
}