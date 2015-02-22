library(shiny)
shinyUI(navbarPage("Regression Example",
                   tabPanel("Application",
        
        
        pageWithSidebar(
  headerPanel("Regression coeffs"),
  sidebarPanel(
    sliderInput('intercept', 'Adjust the intercept',value = 115, min = 100, max = 115, step = 0.05,),      
    sliderInput('slope', 'Adjust the slope',value = 0, min = 0, max = 2, step = 0.01,)
  ),
  mainPanel(
    plotOutput('newPlot'),
    plotOutput('resPlot'),
    htmlOutput("contactus")
  )
)),

tabPanel("Documentation", helpText(HTML("<p>This Shiny application displays a scatter plot of Population and Year from
                                        the longley dataset from R built-in datasets library. The 2 sliders
                                        enable you to adjust the intercept
                                        and slope for a regression line in the first plot and shows the mean
                                        squared error. Note that year 1947 is considered the 0 point on x axis.
                                        so the regression line crosses the 1947 at the intercept value regardless
                                        of slope.</p>
                                        
                                        <p>In the second plot the residuals are shown. You may notice that the
                                        residuals are not exactly normally distributed. This is because the population
                                        curve is not strictly linear, but closer to exponential. However, with this short
                                        time series linear regression fits quite well and for demonstration purposes I 
                                        think this was a pretty good dataset. </p>

                                         
                                        
                                        You can see the full code at <a href=\"https://github.com/malbolg/datadevproject\">
                                        https://github.com/malbolg/datadevproject</a>.</p>

                                        <p> Try to find the parameters minimizing MSE and enjoy! </p>

                                        <p> <b>SPOILER ALERT!</b> The correct parameters are 106.532 for intercept
                                        and 1.452 for slope. </p>")))
))

