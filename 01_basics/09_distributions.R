# library packages -----
library(tidyverse)
library(readxl)
df <- read_excel("data/titanic.xlsx")
View(df)

# draw a histogram
hist(df$age)

# draw a histogram with ggplot2 having 10 bins
ggplot(df, aes(x = age)) + geom_histogram(bins = 20) +
  theme_classic()

mean(df$age, na.rm = TRUE)
median(df$age, na.rm = TRUE)


A <- c(2, 3, 4, 5, 6, 7, 8, 9, 10, 20, 21, 34,100,500)
median(A)

## Data Distributions ------
# Normal Distribution
hist(df$age)
shapiro.test(df$age)
hist(df$fare)
shapiro.test(df$fare)
ggplot(df, aes(x = age)) + geom_histogram(bins = 50) 
ggplot(df, aes(x = fare)) + geom_histogram(bins = 50) 

# null hypothesis of shapiro wilk test
# H0: data is normally distributed if P > 0.05, 95% confidence level
# H1: data is not normally distributed if P < 0.05, 95% confidence level


# do a shapiro wilk test on age and print the results based on values using print fucntion
x <- df$age
if (shapiro.test(x)$p.value > 0.05) {
  print("Data is normally distributed")
} else {
  print("Data is not normally distributed")
}

# kurtosis and skewness
# assignment find skewness and kurtosis of age and fare

# density plot of age
ggplot(df, aes(x = age)) + geom_density() + theme_classic()

# Why can't we do the same with categorical data
ggplot(df, aes(x = class)) + geom_histogram() + theme_classic()
hist(df$class)

# count plot of class using ggplot2
ggplot(df, aes(x = class)) + geom_bar()

ggplot(df, aes(x = class, y = age)) + geom_bar(stat = "identity")
?geom_bar

# calculate mean and SD of age and then make a plot with sex
df %>% 
  group_by(sex) %>% 
  summarise(mean_age = mean(age, na.rm = TRUE), sd_age = sd(age, na.rm = TRUE))

df %>% 
  filter(sex == "female") %>%
  ggplot(aes(x = age)) + geom_histogram(bins = 50) + theme_classic()



means <-  df %>% 
  group_by(sex) %>% 
  summarise(mean_age = mean(age, na.rm = TRUE), sd_age = sd(age, na.rm = TRUE)) 

ggplot(means, aes(x = sex, y = mean_age)) + geom_bar(stat = "identity") + theme_classic()



# find kurtosis of age
install.packages("moments")
library(moments)
kurtosis(df$age, na.rm = TRUE)
skewness(df$age, na.rm = TRUE)
#fare
kurtosis(df$fare, na.rm = TRUE)
skewness(df$fare, na.rm = TRUE)




