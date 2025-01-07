# Volcano and Rainfall Visualization Shiny App

This project is a Shiny app built in R to visualize the volcano dataset combined with synthetic rainfall data. The app provides an interactive 3D plot with various customization options, enabling users to explore elevation and rainfall effects dynamically.

Features

    3D Visualization:
        A 3D surface plot of the volcano dataset representing terrain elevation.
        Option to overlay synthetic rainfall data on the terrain.

    Customizable Parameters:
        Rainfall Scale: Adjust the intensity of rainfall added to the elevation.
        Zoom Level: Control the zoom level on the Z-axis for a better perspective.
        Rainfall Range: Filter rainfall values to a specific range (e.g., minimum and maximum values).
        Surface Opacity: Change the transparency of the surface plot.
        Color Palette: Choose from various color schemes (viridis, heat.colors, terrain.colors, topo.colors).
        Grid Visibility: Toggle grid lines on the X and Y axes.

    Dynamic Updates:
        The plot updates instantly based on user inputs in the sidebar panel.

Requirements
R Packages

The app requires the following R packages:

    shiny: For building the user interface and server logic.
    plotly: For rendering the interactive 3D surface plot.
    viridis: For color palettes.

install.packages(c("shiny", "plotly", "viridis"))

How to Run the App

    Copy the code from the provided Shiny app file into an R script (e.g., app.R).
    Open RStudio or an R environment and set your working directory to the location of app.R.
    Run the app using:

    shiny::runApp("app.R")

Author

This project was created for the Developing Data Products course on Coursera.
