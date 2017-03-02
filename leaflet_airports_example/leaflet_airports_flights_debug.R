rm(list=ls())
require("leaflet")
require("dplyr")
Name <- c("London Heathrow Airport", "RAF Northolt")
IATA <- c("LHR", "NHT")
Lat <- c(as.numeric(51.4706), as.numeric(51.5530014038))
Long <- c(as.numeric(-0.461941), as.numeric(-0.418166995049))
total_departures <- c(527, 0)
airports_df <- data.frame(Name, IATA, Lat, Long, total_departures, stringsAsFactors = FALSE)
str(airports_df)
airports_map_circles <- leaflet() %>% addTiles() %>% 
  addCircleMarkers(data = airports_df, popup = ~paste(Name, " - ", pmax(sqrt(total_departures), 10), sep = ""), label = ~IATA, clusterOptions = markerClusterOptions(), color = "purple", radius = ~pmax(sqrt(total_departures), 10)) 
airports_map_circles
