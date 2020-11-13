#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


# Define UI for application that draws a histogram
shinyUI(
    navbarPage(title = 'Projet Data Visualisation',
    tabPanel(title = 'Note des choix',   
             fluidRow(
        column(5, tags$img(src = 'logo.jpg'), offset = 8),
        column(2, tags$strong(tags$ol('Mohamed EL MAIMOUNI', 'Youssef EL HICHOU', 'Mohamed Amine Frej','Othmane Belbchir')))
        
        
    ),
    fluidRow(column(11, tags$p(note$text), offset = 0)
             ),
    fluidRow(column(11, tags$p(ongl1$text), offset = 0)),
     
    fluidRow(column(11, tags$p(ongl2$text), offset = 0))
    ),
    
    tabPanel( title = "GOT",
              fixedRow(column(12, tags$p("Choisir une saison et fixer un seuil minimum de temps 
                                         d'apparition"), offset = 0)),
              sliderInput(inputId = 'id1', label = 'Saison', 
                                         min = 1, max  = 8, value = 1),
              
              sliderInput(inputId = 'thres', label = 'Seuil', 
                          min = 20, max  = 80, value = 50),
              plotOutput('plot1')
              
              
              ),
    
    
    tabPanel( title = 'GOT 2 ', 
              fixedRow(column(12, tags$p("Chosir le personnage avec qui vous voulez voir
                                         qui a apparu plus de 50 min"), offset = 0)),
              
              selectInput(inputId = "id2", label = "Chosir un personnage",
                                    choices = main_char ),
              plotOutput('plot2')
              
              ),
    
    
    tabPanel( title = 'GOT 3', 'Une cartographie en fonction des personnages est 
              en cours de développement')
)
)