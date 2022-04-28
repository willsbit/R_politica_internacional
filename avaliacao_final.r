library(dplyr)
library(spData)
library(spDataLarge)
library(tmap)
library(readxl)
library(htmlwidgets)
library(magick)
library(here)
library(leaflet) 
library(ggplot2) 
library(shiny)   
library(sf)
library(raster)
library(gifski)
library(tidyverse)
library(readxl)
s
#importar dataset economia
economia <- read_excel("C:/Users/willi/Desktop/2022/Cursos/Introducao_R_Politica_Internacional/dados/economia.xls")
View(economia)

#Convoca o mapa mundi#
world <- data("World")


# arrumar nomes que nao batem nas bases de dados
fix(economia)

#Ordena pelo nome do país as duas bases#
world <- World[order(World$iso_a3),]


#Junta as bases de dados criando o objeto mapa#
mapa <- merge(world, economia, by.x="name", by.y="country", all.x=T, all.y=F)

#Cria o mapa com duas variáveis: overall_score e freedom_from_corruption

score_and_corruption <- tm_shape(mapa) +
  tm_polygons("overall_score", style = "fixed",breaks = c(0, 20, 40, 60, 80, 100), textNA = "N/A", colorNA = "white", title = "Overal score (0-100)") +
  tm_symbols(col = "black",  style="jenks", border.col = "white", size = "freedom_from_corruption", scale=0.55, title.size = "Freedom from corruption (0-100)")+
  tm_layout(legend.outside = TRUE)


#Salva mapa dinâmico em html#
tmap_save(tm = score_and_corruption, filename = "C:/Users/willi/Desktop/2022/Cursos/Introducao_R_Politica_Internacional/score_and_corruption.html", width = 1200, height = 1000)