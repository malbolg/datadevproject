library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Example plot"),
  sidebarPanel(
    sliderInput('intercept', 'Guess the intercept',value = 106, min = 100, max = 110, step = 0.05,),      
    sliderInput('slope', 'Guess the slope',value = 1.4, min = 0, max = 2, step = 0.01,)
  ),
  mainPanel(
    plotOutput('newPlot'),
    plotOutput('resPlot')
  )
))
