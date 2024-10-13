install.packages("waterfalls")
library(waterfalls)

# Example data
data <- data.frame(
  category = c("Start", "Revenue", "Costs", "Taxes", "Profit", "End"),
  value = c(1000, 500, -300, -100, 200, 1300) # The last value will be calculated as the sum
)


# Plot the waterfall chart
waterfall(values = data$value, labels = data$category)
