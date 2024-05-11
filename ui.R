ui <- fluidPage(
  selectInput("areaSelect", "Select Area:", choices = available_areas, multiple = TRUE),
  actionButton("update", "Update Map"),
  leafletOutput("map")
)