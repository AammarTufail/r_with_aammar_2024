####----- Plotly for interactive plots -----####
install.packages("plotly")
library(plotly)
library(tidyverse)
library(readxl)
# Load the data
df <- read_excel("data/titanic.xlsx")
colnames(df) 

# scatter plot
plot_ly(df, x = ~age, y = ~fare, color = ~sex, type = "scatter", mode = "markers")
plot_ly(df, x = ~age, y = ~fare, color = ~sex, type = "scatter", mode = "markers",
        size = ~fare
)
# line plot
plot_ly(df, x = ~pclass, y = ~embarked, color = ~sex, type = "scatter", mode = "lines")

# bar plot
plot_ly(df, x = ~pclass, y = ~fare, color = ~sex, type = "bar")

#histogram
plot_ly(df, x = ~age, type = "histogram")

#boxplot
plot_ly(df, x = ~pclass, y = ~fare,color=~who, type = "box")


# heatmap
plot_ly(df, x = ~class, y = ~embark_town, z = ~age, type = "heatmap")

# pie chart
plot_ly(df, labels = ~class, type = "pie")

#bubble chart
plot_ly(df, x = ~age, y = ~fare, color = ~sex, type = "scatter", mode = "markers",
        size = ~fare * 2
)

# violin plot
plot_ly(df, x = ~pclass, y = ~age, type = "violin")

# 3D scatter plot
plot_ly(df, x = ~age, y = ~fare, z = ~pclass, color = ~sex, type = "scatter3d", mode = "markers")


