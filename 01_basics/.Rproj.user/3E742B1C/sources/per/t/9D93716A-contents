## 1. library packages ----
library(tidyverse)
library(readxl)
# install.packages("DescTools")
library(DescTools)
## 2. Import dataset ----
df <- read_excel("data/titanic.xlsx")

## 3. Find Missing Values ----
df %>% is.na() %>% colSums() %>% barplot() 
## percentage of missing values in each column
df %>% 
  summarise_all(~sum(is.na(.))/n())

## 4. Remove and impute Missing Values ----

df %>% 
  drop_na() %>% 
  is.na() %>% 
  colSums() %>% 
  barplot()
df_clean_1 <- df %>% drop_na()

# remove the column deck
df_clean_2 <- df %>% select(-deck) 
# remove rows with missing values in embarked
df_clean_3 <- df_clean_2 %>% drop_na(embarked)
# removed deck column
#removed rows with missing values in embarked
df_clean_4 <- df %>% drop_na(embarked) %>% select(-deck)


# impute missing values of age and replace them with mean of age
df_clean_5 <- df_clean_4 %>% 
  mutate(age = ifelse(is.na(age), mean(age, na.rm = TRUE), age))
# let's check if we still have missing values
df_clean_5 %>% is.na() %>% colSums()

## Let's do everything in one code
df_clean_final <- df %>% 
  select(-deck) %>% 
  drop_na(embarked) %>% 
  mutate(age = ifelse(is.na(age), mean(age, na.rm = TRUE), age))

## Impute and replace embarked and embarked_town with mode
df_clean_final <- df %>% 
  select(-deck) %>% 
  mutate(age = ifelse(is.na(age), mean(age, na.rm = TRUE), age),
         embarked = ifelse((is.na(embarked) | embarked == ""), Mode(embarked, na.rm = TRUE), embarked),
         embark_town = ifelse((is.na(embark_town) | embark_town == ""), Mode(embark_town, na.rm = TRUE), embark_town))

df_clean_final %>% is.na() %>% colSums()



### Advanced Imputation ----
install.packages("mice")
library(mice)

# impute missing values using mice
df_imputed <- mice(df, m = 5, maxit = 50, method = "pmm", seed = 500)







