## libraries
library(tidyverse)
library(readxl)
# load data
df <- read_excel("data/GHGs.xlsx")

# create a piechart of the GHGs$crop_type
# Assuming your data is already in a dataframe named 'data' with a column 'crop.type'

# Step 1: Create a table with the counts of each crop type
crop_counts <- table(df$crop.type)
crop_counts
nrow(df)

# Step 2: Create the pie chart
pie(
  crop_counts, 
  labels = paste(names(crop_counts), round(prop.table(crop_counts) * 100, 1), "%"), 
  col = c("#ff9999", "#66b3ff", "#99ff99", "#ffcc99", "#c2c2f0", "#ffb3e6", "#c4e17f"),
  main = "Crop Distribution"
)
# use ggplot2 to create the same piechart
df %>%
  count(crop.type)

df %>%
  count(crop.type) %>%
  ggplot(aes(x = "", y = n, fill = crop.type)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  theme_void()




