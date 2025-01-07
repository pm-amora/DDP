#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

# Load required libraries
library(shiny)
library(plotly)
library(viridis)

# Define UI
ui <- fluidPage(
  titlePanel("Volcano and Rainfall Visualization"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("rainScale", "Rainfall Scale:", min = 0, max = 2, value = 1, step = 0.1),
      sliderInput("zoom", "Zoom Level (Z-Axis):", min = 0.5, max = 3, value = 1, step = 0.1),
      sliderInput("rainMin", "Rainfall Minimum:", min = 0, max = 200, value = 0),
      sliderInput("rainMax", "Rainfall Maximum:", min = 0, max = 200, value = 200),
      sliderInput("opacity", "Surface Opacity:", min = 0.1, max = 1, value = 1, step = 0.1),
      selectInput("colorPalette", "Color Palette:",
                  choices = c("viridis", "heat.colors", "terrain.colors", "topo.colors")),
      checkboxInput("showRain", "Overlay Rainfall", value = TRUE),
      checkboxInput("showGrid", "Show Grid Lines", value = TRUE)
    ),
    mainPanel(
      plotlyOutput("combinedPlot")
    )
  )
)
