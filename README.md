# Shiny-dataviz
Visualization on some of the popular TV series "Game of Thrones" data, using R Shiny.

The shiny app is available at the following link: https://medelmaimouni.shinyapps.io/dataviz/

As part of a data visualization project, we were asked to work on data from the Game of Thrones series, in order to create an interactive dashboard to explore some data related to the series.

 The series having known a great success, (it is qualified as one of the best of the history by some) it contains 8 seasons and approximately a hundred characters. Hence the great mass of data present and the complexity of extracting it. We have chosen to consider only (Jon Snow, Tyrion Lannsiter, Daenerys Taragryen, Sansa Stark, Cersei Lannister, Arya Stark) as main characters, indeed, the readability of the graphs led us to choose this working hypothesis. We have divided our work in the following way:
 
 - A GOT tab: In this tab we wanted to see how long each character appears above a threshold that we will set in a season that we will choose. We took advantage of Shiny's reactivity to have a dynamic interface. In other words at a fixed threshold, if we change a season the graphs are displayed according to the chosen season: For example if we set a threshold of 50 min and the season in 1, we will have the characters who appeared more than 50 min in the season 1, once we change a parameter (threshold or season), a calculation is done in back-end to adjust the graph to display again

- A GOT2 tab: In this tab we tried to return more complex results than in the first tab. The term complex is appropriate because we had to take into account all the interactions between the characters. We made it so that the user can choose a character (Jon Snow, Tyrion Lannsiter, Daenerys Taragryen, Sansa Stark, Cersei Lannister, Arya Stark) and then automatically get a list of all the characters with which he has interacted for more than 50 minutes (we set the threshold to simplify the program).
