server <- function(input, output) {
  output$map <- renderLeaflet({
    observeEvent(input$update, {
      selected_areas <- input$areaSelect
      filtered_data <- data1 %>% filter(Area_name %in% selected_areas)
      
      if (nrow(filtered_data) > 0) {
        map <- leaflet(filtered_data) %>% addTiles()
        
        for (area in unique(filtered_data$Area_name)) {
          subset_data <- filtered_data[filtered_data$Area_name == area, ]
          
          map <- map %>%
            addCircleMarkers(
              data = subset_data,
              lng = ~Lon, lat = ~Lat,
              popup = ~paste(Crm_cd_desc, "<br>", Location),
              radius = 4,
              fillColor = colors[[area]], fillOpacity = 0.8,
              group = area
            )
        }
        
        map
      } else {
        print("No data available for the selected area(s).")
      }
    })
  })
}
