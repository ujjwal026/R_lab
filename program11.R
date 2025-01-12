library(readr)
library(dplyr)

set.seed(42)

# Generate dummy data
customer_ids <- 1:100
purchase_amounts <- runif(100, min = 10, max = 200)
dummy_data <- data.frame(
  Customer_ID = customer_ids,
  Purchase_Amount = purchase_amounts
)

# Write data to CSV
write.csv(dummy_data, "customer_purchases.csv", row.names = FALSE)

# Read data from CSV
purchase_data <- read_csv("customer_purchases.csv")

# Calculate statistics
total_records <- nrow(purchase_data)
total_unique_customers <- n_distinct(purchase_data$Customer_ID)
mean_purchase_amount <- mean(purchase_data$Purchase_Amount)
median_purchase_amount <- median(purchase_data$Purchase_Amount)
std_dev_purchase_amount <- sd(purchase_data$Purchase_Amount)

# Print statistics
cat("Total number of records:", total_records, "\n")
cat("Total number of unique customers:", total_unique_customers, "\n")
cat("Mean purchase amount:", mean_purchase_amount, "\n")
cat("Median purchase amount:", median_purchase_amount, "\n")
cat("Standard deviation of purchase amounts:", std_dev_purchase_amount, "\n")

# Add a new column based on the median
purchase_data <- purchase_data %>%
  mutate(Segment = ifelse(Purchase_Amount < median_purchase_amount, "Low Spender", "High Spender"))

print(purchase_data)

# Plot histogram
hist(
  purchase_data$Purchase_Amount,
  main = "Distribution of Purchase Amounts",
  xlab = "Purchase Amount",
  col = "blue",
  border = "black"
)
