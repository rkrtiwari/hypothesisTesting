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
  
  output$plot2 <- renderPlot({
    boxplot(extra ~ group, data = sleep, col="green", xlab="Drug Type", ylab = "Increase in Sleep Hours")
  })
  
  output$plot3 <- renderPlot({
    g1 <- sleep[sleep$group==1,]
    g1$group <- as.numeric(g1$group)
    g2 <- sleep[sleep$group==2,]
    g2$group <- as.numeric(g2$group)
    plot(as.numeric(sleep$group), sleep$extra, type = "p", cex = 2, xlim=c(0.5,2.5),
         xlab="Drug Type", ylab = "Increase in Sleep Hours", pch = 16, 
         col = "blue", xaxt = "n")
    axis(side =1, at = c(1,2))
    for (i in 1:nrow(g1)){
      segments(g1$group[i], g1$extra[i], g2$group[i], g2$extra[i], col = "blue")
    }
  })
  
}