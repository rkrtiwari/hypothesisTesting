library(shiny)

server <- function(input, output){
  
  output$plot1 <-  renderPlot({
    x <- seq(-15,15, by = 0.1)
    y <- dnorm(x, mean = input$mean, sd = input$sd)
    xpol <- seq(input$x, 15, length=100)
    ypol <- dnorm(xpol, input$mean, input$sd)
    xpolval <- rep(0,100)
    plot(x,y, type = "l", col = "red", xlim = c(-15,15))
    abline( v = input$x, col = "blue")
    polygon( c(xpol, rev(xpol)), c(xpolval, rev(ypol)), col = "blue")
  })
  
  output$pvalue <- renderText({
    pval <- pnorm(input$x, mean = input$mean, sd = input$sd)
    paste("The probability of x value higher than", input$x, ' is ', round(1-pval, 3),
          'the area of the blue region', sep = " ")
  })
  
  output$formula1 <- renderText({
    paste('pnorm( ', input$x, ', mean = ', input$mean, ', sd = ', input$sd, ', lower.tail = FALSE)', sep = '')
  })
  
}