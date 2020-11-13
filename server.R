#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

source("global.R", local = TRUE)



# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  output$plot1 <- renderPlot({
    plotGOT1(input$id1, input$thres)
  }
  )
  output$plot2 <- renderPlot({
    plotGOT2(input$id2)
  })
  

}
)
