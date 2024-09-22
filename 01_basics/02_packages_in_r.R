# 1. install packages in R ----
install.packages("readxl")
library(readxl)
require(readxl)
detach("package:readxl", unload=TRUE)

#tidyverse
install.packages("tidyverse")
library(tidyverse)

# 2. Set repositories ----
setRepositories()

# install packages from CRAN repo
install.packages("readxl", repos = "https://cran.r-project.org")


# 3. Load Dataset in R from excel ----
# library readxl
library(readxl)
df <- read_excel("data/titanic.xlsx")
View(df)

# 4. Load the default dataset in R ----
data()
data(iris)
data(CO2)
data(BOD)
data(JohnsonJohnson)
data(Loblolly)
data(USArrests)
data(ChickWeight)
require(graphics)
coplot(weight ~ Time | Chick, data = ChickWeight,
       type = "b", show.given = FALSE)
## 5. Write data in R to excel ----
# Save the data into a csv file
write.csv(iris, "data/iris.csv")
# save in xlsx file
library(writexl)
?writexl
write_xlsx(iris, "data/iris.xlsx")
write_xlsx(BOD, "data/BOD.xlsx")
