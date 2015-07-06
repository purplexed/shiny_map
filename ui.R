library(shiny)
library(leaflet)
library(rgdal)
library(sp)

shinyUI(fluidPage(
  titlePanel("London Boundaries"),
  checkboxInput("boroughs", "Boroughs", value = FALSE),
  #checkboxInput("lsoa", "Lower Super Output Areas", value = FALSE),
  #actionButton("action", label = "Submit"),
  leafletOutput('myMap', height = 800, width = 1200)
))