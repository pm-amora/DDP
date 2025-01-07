#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

# Load required libraries
library(shiny)
library(plotly)
library(viridis)

# Generate synthetic rainfall data
set.seed(123)  # Ensure reproducibility
rainfall <- matrix(runif(length(volcano), min = 0, max = 200), 
                   nrow = nrow(volcano), ncol = ncol(volcano))

# Define Server
server <- function(input, output) {
  output$combinedPlot <- renderPlotly({
    # Base elevation from volcano dataset
    z_base <- volcano
    
    # Apply rainfall if selected
    rainfall_clipped <- pmin(pmax(rainfall, input$rainMin), input$rainMax)  # Clip rainfall
    Amount_rain <- if (input$showRain) {
      z_base + (rainfall_clipped * input$rainScale)
    } else {
      z_base
    }
    
    # Generate x and y coordinates
    x <- seq_len(nrow(z_base))
    y <- seq_len(ncol(z_base))
    
    # Define color palette
    palette <- switch(
      input$colorPalette,
      "heat.colors" = heat.colors(100),
      "terrain.colors" = terrain.colors(100),
      "topo.colors" = topo.colors(100),
      "viridis" = viridis::viridis(100) # Viridis is already compatible with Plotly
    )
    
    # Convert the palette into Plotly-compatible colorscale
    colorscale <- lapply(seq_along(palette), function(i) {
      list((i - 1) / (length(palette) - 1), palette[i])
    })
    
    # Create 3D surface plot
    plot_ly(
      z = ~Amount_rain, x = ~x, y = ~y, type = "surface",
      colorscale = colorscale,
      opacity = input$opacity
    ) %>%
      layout(scene = list(
        camera = list(
          eye = list(x = 1.5, y = 1.5, z = input$zoom)
        ),
        xaxis = list(visible = input$showGrid),
        yaxis = list(visible = input$showGrid),
        zaxis = list(title = if (input$showRain) "Elevation + Rainfall" else "Elevation")
      ))
  })
}