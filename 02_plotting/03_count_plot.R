## libraries
library(tidyverse)
library(readxl)
# load data
df <- read_excel("data/GHGs.xlsx")

p1 <- df %>%
  group_by(crop.type) %>%
  summarise(counts = n()) %>% 
  ggplot(aes(crop.type, counts, fill = crop.type)) + geom_bar(stat = "identity") +
  xlab("Crop Type") + ylab("Number of Observations") + 
  theme_classic() +
  theme(text = element_text(size = 14),
        axis.text.x = element_text(angle = 45, hjust = 1))+
  # scale_fill_brewer(palette="Paired") +
  scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9", "#2415ce", "blue", "green", "orange"));p1
  
ggsave("plots/01_plot.png", plot = p1, scale=1, height = 8, width = 6, dpi = 300)
install.packages("svglite")
library(svglite)
ggsave("plots/01_plot.svg", plot = p1, scale=1, height = 8, width = 6, dpi = 300)

  