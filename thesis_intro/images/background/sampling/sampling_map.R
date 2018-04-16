
library(tidyverse)
library(leaflet)
library(rgdal)

df_site <- readRDS("C:/WQApp/WAVE/RDS/df_all_site.rds")

df_site$LocationType[df_site$LocationType == "Nutrient"] <- "Reservoir"
df_site$LocationType[df_site$LocationType == "Transect"] <- "Bacteria"

# to fix duplicated Reservoir (Nutrient locations due to multiple depths)
df_site$Site[!is.na(df_site$Station)] <- df_site$Station[!is.na(df_site$Station)]
df_site <- df_site[!duplicated(df_site[,c("Site", "LocationLat", "LocationLong", "LocationCategory")]),]

df_site <- df_site %>% select(Site, LocationLat, LocationLong, LocationType)
# levels (Categories) of Colors and Legend

map_levels <- c("Tributary",
                "Reservoir")

# Create a new column in df_site for coloring and legend purposes
df_site$LocationType[df_site$LocationType == "Bacteria"] <- "Reservoir"



df_site2 <- df_site %>% filter(!is.na(LocationType))

# Color

color_pal <- colorFactor(palette = c("firebrick", "orange1"),
                         domain = factor(map_levels, levels = map_levels),
                         ordered = TRUE)

# Map

  
  pal <- color_pal
  QWW <- readOGR("F:/Nick Zinck/Shiny Water Quality/GitHub/DCRShinyApp/gis/QuabbinWareWachusettWatersheds.shp") %>%
    spTransform(CRS("+proj=longlat +ellps=GRS80"))
  
  leaflet(data = df_site2) %>%
    # Set Long/Lat (not completely neccesary)
    setView(lng = -72.0589, lat = 42.43, zoom = 11) %>%

    # Basemap (World Imagery from ESRI)
    addProviderTiles(providers$Hydda.Base,
                     options = providerTileOptions(noWrap = TRUE)) %>%
    # Watershed Boundary
    addPolygons(data = QWW,
                layerId = QWW,
                color = "black", # "#00008B",
                weight = 2, smoothFactor = 0.5,
                opacity = 0.7, fillOpacity = .1,
                fillColor = "#00008B") %>%  # ,
    # Removed Highlighting due to BringToFront interferring with circle Markers
    #highlightOptions = highlightOptions(color = "white", 
    #weight = 2,
    #bringToFront = TRUE)) %>%
    # Site Location Markers
    addCircleMarkers(
      lng = ~LocationLong, lat = ~LocationLat,
      color = ~pal(LocationType),
      radius = 3,
      weight = 3,
      opacity = 0.8,
      fillOpacity = 0.8) %>%
    # Legend
    addLegend(
      position = "bottomleft",
      values = ~LocationType,
      pal = pal,
      opacity = 1,
      na.label = "Not Available",
      title = "")
  
