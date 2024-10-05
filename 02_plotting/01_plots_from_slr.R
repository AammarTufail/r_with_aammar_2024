# Install packages for quick analysis -----
# install.packages("tidyverse")
install.packages("GWalkR")
install.packages("esquisse")
install.packages("explore")
# library or require packages
library(tidyverse)
library(GWalkR)
library(esquisse)
library(explore)
library(readxl)
# Load data -----
df_ghgs <- read_excel("data/GHGs.xlsx")

# Explore data -----
gwalkr(df_ghgs)
esquisser(viewer = "browser")
explore(df_ghgs)