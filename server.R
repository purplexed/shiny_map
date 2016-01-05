library(shiny)
library(leaflet)
library(rgdal)
library(sp)

boroughPoly <- readOGR("./data/LondonBoroughs.geojson", "OGRGeoJSON")
boroughPoly <- spTransform(boroughPoly, CRS("+init=epsg:4326"))

shinyServer(function(input, output) {
    map = leaflet() %>% addTiles() %>% setView(-0.12, 51.5, 10)
   
    finalMap <- reactive ({
      if(input$boroughs) return(map %>% addPolylines(data = boroughPoly, stroke = TRUE, fillColor = "blues", fill = TRUE, popup = ~name))
      else return (map)
    })

    output$myMap = renderLeaflet(finalMap())
})