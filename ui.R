library(shiny)
library(leaflet)
library(rgdal)
library(sp)

shinyUI(fluidPage(
  titlePanel("London Boroughs"),
  checkboxInput("boroughs", "Boroughs", value = FALSE), 
  leafletOutput('myMap', height = 800, width = 1200)
))