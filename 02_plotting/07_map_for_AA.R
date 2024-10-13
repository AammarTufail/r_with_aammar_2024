# library
library(GWalkR)
library(readxl)
df <- read_excel("./data/data_for_map_AA.xlsx")

# use plotly to draw map
library(plotly)
# Load required libraries
library(plotly)

# Assuming df is already defined with your data
# Adjust the colorscale to show discrete colors for each value from 1 to 6
fig <- plot_ly(
  data = df, 
  type = 'choropleth', 
  locations = df$Country,
  locationmode = 'country names',
  z = df$papers,
  colorscale = list(
    c(0, "orange"),  # Color for 1
    c(0.2, "yellow"), # Color for 2
    c(0.4, "green"), # Color for 3
    c(0.6, "cyan"),  # Color for 4
    c(0.8, "magenta"),  # Color for 5
    c(1, "red")       # Color for 6
  ),
  colorbar = list(
    title = 'Number of Papers',
    tickvals = c(1, 2, 3, 4, 5, 6),
    ticktext = c("1", "2", "3", "4", "5", "6")
  )
)

# Additional map layout settings
fig <- fig %>% layout(
  title = 'Number of Papers by Country',
  geo = list(
    showframe = FALSE,
    projection = list(type = 'natural earth')
  )
)

# Show plot
fig
fig %>% plotly::export(file = "./plots/high_res_plot.png", width = 2400, height = 1800)

