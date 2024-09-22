## 1. Packages ----
library(tidyverse)
# install.packages("nycflights13")
library(nycflights13)
flights
df <- flights

## 2. Data Handling ----
str(df)
glimpse(df)
tibble(df)
# find data shape
dim(df)
# range of year column in df
range(df$year)
range(df$month)
range(df$day)
?flights


jan_2013 <- filter(df, month == 1)

jan_2013_dply <- df %>% filter(month == 1)

# save this to csv
write_csv(jan_2013, "data/January_2013_ka_data.csv")
write.csv(df, "data/flights.csv")
#write in xlsx
library(writexl)
write_xlsx(df, "data/flights_excel.xlsx") # i will look into it and find the reason

# Assignment alert: save the data for 1st 15 days of september, and then write that into csv file.

df %>% filter(month == 1 | month==2)
df %>% filter(month == 1 & month==12)
df %>% filter(month == 10 | month==11 | month==12)

df %>%  filter(month %in% c(10,11,12))

df %>%  filter(!month %in% c(10,11,12))

df %>%  filter(month %in% c(10,11,12) & day %in% c(1:15)) %>% 
  write_csv("data/first_15_days_of_oct_nov_dec.csv")

# flights data having a delay more than 120 minutes
df %>%  filter(dep_delay > 120 | arr_delay > 120)


# Assignment Solution
# first 15 days of September
df %>% filter(month == 9 & day <= 15) 
  
df %>% filter(month == 9 & day <= 15) %>% 
  write_csv("data/first_15_days_of_sept.csv")



## 3. Missing Values ----
# check for missing values  
is.na(df)
sum(is.na(df))
# calculate the percentage of missing values
# number of rows in data
nrow(df)
sum(is.na(df)) / nrow(df) * 100
sum(is.na(df$dep_time))

# find number of missing values in each column of df
colSums(is.na(df))
#plot these missing values in each column

# df %>% is.na() %>% barplot() # takes a lot of memory
df %>%  is.na() %>% colSums() %>% barplot()
df %>%  is.na() %>% colSums() %>%  write.csv("data/missing_values.csv")



