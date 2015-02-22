library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Example plot"),
  sidebarPanel(
    sliderInput('intercept', 'Adjust the intercept',value = 115, min = 100, max = 115, step = 0.05,),      
    sliderInput('slope', 'Adjust the slope',value = 0, min = 0, max = 2, step = 0.01,)
  ),
  mainPanel(
    plotOutput('newPlot'),
    plotOutput('resPlot')
  )
))
