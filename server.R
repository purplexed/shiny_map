library(shiny)
library(leaflet)
library(rgdal)
library(sp)

boroughPoly <- readOGR("./data/LondonBoroughs.geojson", "OGRGeoJSON")
boroughPoly <- spTransform(boroughPoly, CRS("+init=epsg:4326"))
#lsoaPoly <- readOGR("./data/LSOA_2011.geojson", "OGRGeoJSON")
#lsoaPoly <- spTransform(lsoaPoly, CRS("+init=epsg:4326"))

shinyServer(function(input, output) {
    map = leaflet() %>% addTiles() %>% setView(-0.12, 51.5, 10)
    
#     borInput <- reactive({
#       perm.vector <- as.vector(input$boroughs)
#       perm.vector
#     }) 
    
    #lsoaInput <- reactive({
    #  perm.vector <- as.vector(input$lsoa)
    #  perm.vector
    #})
    
    finalMap <- reactive ({
      #if(!input$boroughs & !input$lsoa) return (map)
      #if(input$lsoa & input$boroughs) return (map %>% addPolylines(data = lsoaPoly, color = "red")
      #                                        %>% addPolylines(data = boroughPoly, color = "blue"))
      if(input$boroughs) return(map %>% addPolylines(data = boroughPoly, stroke = TRUE, fillColor = "blues", fill = TRUE, popup = ~name))
      else return (map)
      #if(input$lsoa) return(map %>% addPolylines(data = lsoaPoly, color = "red"))
    })
    
    #map %>% addPolylines(data = boroughPoly, color = "blue")
    
    #%>% addPolylines(data = boroughPoly, color = "red")
    output$myMap = renderLeaflet(finalMap())
    
    #output$value <- renderPrint({ input$checkGroup })
})
