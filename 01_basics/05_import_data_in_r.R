## 1. Readr package----
# install.packages("readr") # comment in to installl the package
library(readr)
?readr

df <- read_csv("data/titanic.csv")
View(df)

## 2. readxl ----
# install.packages("readxl") # comment in to installl the package
library(readxl)
df <- read_excel("data/BOD.xlsx", sheet = "bod")

## 3. writexl -----
# install.packages("writexl") # comment in to installl the package
write_xlsx(df, "data/BOD_test.xlsx")
# save csv file from df
write_csv(df, "data/BOD_test.csv")
write_tsv(df, "data/BOD_test.tsv")

## 4. Openxlsx ----
# install.packages("openxlsx", dependencies = TRUE) 
library(openxlsx)
?openxlsx
## Assignment for you to look and find how to use this package?