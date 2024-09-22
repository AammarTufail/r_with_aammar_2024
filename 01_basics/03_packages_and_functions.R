## 1. Packages for Data Loading and data writing ----
install.packages("readxl")
install.packages("readr")
install.packages("openxlsx")
install.packages("writexl")
install.packages("writexls")

## 2. Packages for Data Manipulation or Data Wrangling/Handling ----
install.packages("dplyr")
?base::Logic
?Comparison
?base::Arithmetic

install.packages("tidyverse")
library(tidyverse)

# lubridate
install.packages("lubridate")

## 3. Packages for Data Visualization ----
install.packages("ggplot2")
library(ggplot2)

# example of ggplot2
# load data
data(mpg)

# plot
ggplot(data = mpg, # data
       aes(x= manufacturer, y = cty)) + # aesthetics
  geom_point() # geometry

# plotly
install.packages("plotly")
library(plotly)
plot_ly(midwest, x = ~percollege, color = ~state, type = "box")

plot_ly(data = mpg, x = ~manufacturer, y = ~cty, type = "scatter", mode = "markers")

# gganimate
install.packages("gganimate")
library(gganimate)

## ggpubr
install.packages("ggpubr")
library(ggpubr)

# heatmaply
install.packages("heatmaply")
# d3heatmap
install.packages("d3heatmap")

#rgl
install.packages("rgl") #3D plots

#leaflet
install.packages("leaflet") #maps 

#dygraphs
install.packages("dygraphs") #time series

## 4. Packages for Color pallets ----
install.packages("RColorBrewer")
library(RColorBrewer)


## 5. Packages for statistics and Machine Learning ----

# tidymodels
install.packages("tidymodels")

# car

install.packages("car")

#lme4/nlme
install.packages("lme4")

# multcomp
install.packages("multcomp")

# vcd
install.packages("vcd") # categorical data

# survival
install.packages("survival") # survival analysis

# agricolae
install.packages("agricolae") # agricolae

# caret 
install.packages("caret") # machine learning

#randomForest
install.packages("randomForest") # random forest



## 6. Packages for Reporting ----

# rmarkdown
install.packages("rmarkdown")

#shiny
install.packages("shiny")

## 7. Packages for Systematic Review and Meta-analysis ----

#tidyverse
install.packages("tidyverse")

#meta
install.packages("meta")

#metafor
install.packages("metafor")

# dmetar
install.packages("devtools")
devtools::install_github("MathiasHarrer/dmetar")

#openxlsx
install.packages("openxlsx")



### 7.1 Additional Meta-analysis Packages----
#metagear
install.packages("BiocManager"); 
BiocManager::install("EBImage")
install.packages("metagear_0.7.tar.gz", repos = "http://cran.us.r-project.org", type = "source", dependencies = TRUE)
library(metagear)

#juicr
install.packages("XML")
install.packages("BiocManager"); 
BiocManager::install("EBImage")
install.packages("juicr_0.1.tar.gz", repos = "http://cran.us.r-project.org", type = "source", dependencies = TRUE)
library(juicr)
#switchboard
install.packages("switchboard")
