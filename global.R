# This file is generated in order to describe our project

library(readtext)
library(readr)
note <- readtext('note.txt')
ongl1 <- readtext('got1.txt')
ongl2 <- readtext('got2.txt')

#========================= GOT 1 ====================================================================

library(readr)
library(dplyr)
library(ggplot2)


appearances = read_csv("./data/appearances.csv")
scenes = read_csv("./data/scenes.csv")
episodes = read_csv("./data/episodes.csv")

color = c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7","#00FFFF")

max_season <- function(sbs){
  
  filtred_table <- scenes %>% left_join(episodes) %>% 
  left_join(appearances) %>% filter(seasonNum == sbs) %>%
    group_by(name) %>% summarise(duree = sum(duration)) %>% 
    arrange(desc(duree)) %>% head(1)
  
  maximum = as.integer(filtred_table$duree/60)
  return(maximum)
}



plotGOT1 <- function(ss, thres){
  maximum <- max_season(ss)
  screenTimePerSeasons = appearances %>% left_join(scenes) %>% 
    left_join(episodes) %>% filter(seasonNum == ss) %>%
    group_by(name,seasonNum) %>% 
    summarise(screenTime=sum(duration)) %>% 
    arrange(desc(screenTime)) 
  screenTimeTotal = screenTimePerSeasons %>% 
    group_by(name) %>% 
    summarise(screenTimeTotal=sum(screenTime))
  mainCharacters = screenTimeTotal %>% 
    filter(screenTimeTotal>thres*60) %>% 
    arrange(screenTimeTotal) %>% 
    mutate(nameF=factor(name,levels = name))
  data = screenTimePerSeasons %>% left_join(mainCharacters) %>% filter(!is.na(nameF))

  ggplot(data)+
    geom_bar(aes(y=nameF,x=screenTime/60), fill=color[ss], stat="identity")+
    theme_bw()+
    geom_text(data=mainCharacters,aes(y=nameF,x=screenTimeTotal/60+5,label=paste(round(screenTimeTotal/60),'min')),hjust = "left")+
    scale_x_continuous("Temps d'apparition (min)",limits = c(0,maximum*1.1),expand = c(0,1))+
    ylab("")+ggtitle(paste("Temps d'apparition cumulé par personnage dans la saison", as.character(ss), sep = ' ')) + theme_bw() 
  
}

#========================= GOT 2  ====================================================================




main_char= c("Jon Snow", "Tyrion Lannister","Daenerys Targaryen","Sansa Stark","Cersei Lannister","Arya Stark")



commonTimePers <- function( mainChar ){
  commonTimeTable <- appearances %>%
    left_join(appearances, by = c("sceneId"="sceneId")) %>%
    filter(name.x != name.y) %>% 
    left_join(scenes %>% 
                select(sceneId, duration)) %>%
    filter(name.x == mainChar)  %>%
    group_by(name.x, name.y) %>% 
    summarise(commonTime=sum(duration)) %>% 
    filter(commonTime > 50*60 ) %>%
    arrange(desc(commonTime)) %>% 
    mutate(nameF=factor(name.y,levels = name.y))
  
  return(commonTimeTable)
}

plotGOT2 <- function(mainChar){
  
  commonTimeTable = commonTimePers(mainChar) 
  max_time = round(max(commonTimeTable$commonTime)/60)
  ggplot(commonTimeTable)+
    geom_bar(aes(y=nameF,x=commonTime/60), fill=color[sample(1:8, 1)],  stat="identity") + 
    theme_bw()+
    geom_text(data=commonTimeTable,
              aes(y=nameF,x=commonTime/60+3,label=paste(round(commonTime/60),'min')),hjust = "left") +
    scale_x_continuous("Temps d'apparition (min)", limits = c(0, max_time*1.1),
                       expand = c(0,1))+
    ylab("")+ggtitle(paste(paste("Les personnages qui ont apparu avec", mainChar, sep = ' '), "plus de 50 min", sep = ' '))
  
  
}


# ==================== Geospatial ======================================



