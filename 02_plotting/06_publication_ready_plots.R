install.packages("ggpubr")
library(ggpubr)
library(tidyverse)

# create a dataset
specie <- c(rep("sorgho" , 3) , rep("poacee" , 3) , rep("banana" , 3) , rep("triticum" , 3) )
condition <- rep(c("normal" , "stress" , "Nitrogen") , 4)
value <- abs(rnorm(12 , 0 , 15))
data <- data.frame(specie,condition,value)

# Grouped
ggplot(data, aes(x=specie, y=value, fill=condition)) + 
  geom_bar(stat="identity", position="dodge")

### pubr plot------
ggbarplot(data, x = "specie", y = "value",
          fill = "condition",               # change fill color by cyl
          color = "white",            # Set bar border colors to white
          palette = "RdBu",            # jco journal color palett. see ?ggpar
          # sort.val = "desc",          # Sort the value in dscending order
          sort.by.groups = FALSE,     # Don't sort inside each group
          x.text.angle = 90           # Rotate vertically x axis texts
)
?ggbarplot



