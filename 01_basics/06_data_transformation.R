## 1. Packages needed for this ----
library(tidyverse)
library(readxl)
## 2. Load data ----
df <- read_excel("data/titanic.xlsx")

## 3. Data Understanding ----
# Basic R functions
View(df)
str(df)
summary(df)
#dplyr
tibble(df)
glimpse(df)

df %>% glimpse()
# find the mean of data by age using dplyr
df %>% 
  group_by(age) %>% 
  summarise(mean = mean(age, na.rm = TRUE))

# select only female from sex column in df
df_female <- df %>% filter(sex=="female")
df_male <- df %>% filter(sex=="male")


# plot the data of fare only for female using dplyr

df %>% 
  filter(sex=="male") %>% 
  # filter(fare < 10) %>%
  # filter(age < 10) %>%
  ggplot(aes(y = fare, x = age, colour = class)) + geom_point()




