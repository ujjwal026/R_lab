# Load required libraries
library(forecast)

# Create a data frame with Customer IDs, Months, and Sales
sales_data <- data.frame(
  CustomerID = rep(1:5, each = 6),  # 5 customers with 6 months of data
  Month = rep(seq(as.Date("2023-01-01"), as.Date("2023-06-01"), by = "months"), 5),
  Sales = c(
    12000, 15000, 18000, 16000, 20000, 22000,  # Customer 1
    9000, 12000, 15000, 14000, 17000, 20000,   # Customer 2
    10000, 11000, 13000, 15000, 18000, 21000,  # Customer 3
    8000, 10000, 12000, 14000, 16000, 19000,   # Customer 4
    7000, 9000, 11000, 13000, 15000, 17000     # Customer 5
  )
)

# Aggregate sales data by month (sum of all customers)
monthly_sales <- aggregate(Sales ~ Month, data = sales_data, sum)

# Convert aggregated sales to time series
sales_ts <- ts(monthly_sales$Sales, frequency = 12, start = c(2023, 1))

# Print the time series
print(sales_ts)

# Fit ARIMA model
arima_model <- auto.arima(sales_ts)

# Forecast sales for the next 3 months
forecast_result <- forecast(arima_model, h = 3)

# Display forecast results
print(forecast_result)

# Plot the forecast
plot(forecast_result)
