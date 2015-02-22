library(shiny)
library(datasets)
data(longley)

# Manipulate the data to start from year 1947, otherwise the regression plot has an
# non-interpretable intercept of around -2600 and changing it manually doesn't make sense
longley$Year0 = longley$Year - 1947

showRegressLine <- 0

shinyServer(
  function(input, output) {
    output$newPlot <- renderPlot({
      plot(longley$Year0,longley$Population, ylab="Population (millions)",
           xlab="Year", xaxt="n", main="Population in US between 1947 and 1962")
      
      # Fake the x axis values to correspond to years. This has an effect on the 
      # intercept but not on slope
      axis(1, at=0:15, labels=longley$Year)
      
      intercept <- input$intercept
      slope <- input$slope
      
      # plot the user inputted regression line 
      abline(intercept, slope) 
      
      # Add some variables on text
      # intercept and slope in the end doesn't make so much sense since
      # they can be seen on the sliders
      text(1, 129, paste("intercept = ", intercept))
      text(1, 128, paste("slope = ", slope))
      
      mse <- sum((longley$Population -(longley$Year0 * slope + intercept) )^2)/16
      text(1, 127, paste("MSE = ", round(mse,3)))
      
    })
    
    output$resPlot <- renderPlot({
            intercept <- input$intercept
            slope <- input$slope
      resids <- (longley$Population -(longley$Year0 * slope + intercept) )^2
      plot(longley$Year0, resids, ylab="Residual", xlab="Year",
           main="Residuals of the fitted regression curve")
      axis(1, at=0:15, labels=longley$Year)
      
    })
    
  }
)
