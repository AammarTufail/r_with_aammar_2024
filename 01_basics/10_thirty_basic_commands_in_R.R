# library packages -----
library(readxl)
df <- read_excel("data/titanic.xlsx")

# 1
View(df) # to view the dataframe

#2
str(df) # to see the structure of the dataframe

#3
summary(df) # to see the summary of the dataframe

#4
dim(df) # to see the dimensions of the dataframe

#5
head(df) # to see the first 6 rows of the dataframe

#6 
tail(df) # to see the last 6 rows of the dataframe

#7
nrow(df) # to see the number of rows in the dataframe

#8
ncol(df) # to see the number of columns in the dataframe

#9
colnames(df) # to see the column names of the dataframe
row.names(df) # to see the row names of the dataframe

#10
class(df$pclass) # to see the class of the dataframe
class(df$sex) # to see the class of the dataframe
sapply(df, class) # to see the class of each column in the dataframe

#11
levels(df$pclass)
# make pclass as factor
df$pclass <- as.factor(df$pclass)

#12
is.na(df) # to see the missing values in the dataframe
sum(is.na(df)) # to see the total missing values in the dataframe)
sum(is.na(df$age)) # to see the total missing values in the age column

#13
colSums(is.na(df)) # to see the missing values in each column of the dataframe

#14
duplicated(df) # to see the duplicated rows in the dataframe

#15
sum(duplicated(df)) # to see the total duplicated rows in the dataframe

#16
df_first_class <- subset(df, class == "First") # to subset the dataframe based on the condition

#17
sort(df$age) # to sort the age column in the dataframe
sort(df$pclass)
min(df$age, na.rm = TRUE) # to see the minimum value in the age column
max(df$age, na.rm = TRUE) # to see the maximum value in the age column

#18
df[order(df$age),] # to sort the dataframe based on the age column
df_ordered_pclass <- df[order(df$pclass), ]

#19
mean(df$age, na.rm = TRUE) # to see the mean of the age column

#20
median(df$age, na.rm = TRUE) # to see the median of the age column

#21
sd(df$age, na.rm = TRUE) # to see the standard deviation of the age column
se <- sd(df$age, na.rm = TRUE)/sqrt(nrow(df)) # to see the standard error of the age column

#22
quantile(df$age, na.rm = TRUE) # to see the quantiles of the age column
# inter quartile range
IQR(df$age, na.rm = TRUE)

#23
range(df$age, na.rm = TRUE) # to see the range of the age column

### Categorical Variables frequencies
#24
table(df$class) # to see the frequency of each class in the class column
table(df$sex) # to see the frequency
table(df$who) # to see the frequency
table(df$embarked) # to see the frequency

#25
length(df) # to see the length of the dataframe
length(df$sex) # to see


#26
length(unique(df$sex)) # to see the number of unique values in sex
length(unique(df$class)) # to see the number of unique values in 
length(unique(df$age))
length(unique(df$embarked))


#27
prop.table(table(df$class)) # to see the proportion of each class in the class column
# find percentage of each class
prop.table(table(df$class))*100

#28
cor(df$age, df$fare, use = "complete.obs") # to see the correlation between age and fare
cor(df$age, df$fare, use = "pairwise.complete.obs") # to see the correlation between age and fare
#29
hist(df$age) # to see the histogram of  the age column

#30 
boxplot(df$age) # to see the boxplot of the age column

plot(df)

