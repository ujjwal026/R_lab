# Matrix Creation
matrix_A <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow = 3, ncol = 3, byrow = TRUE)
matrix_B <- matrix(c(9, 8, 7, 6, 5, 4, 3, 2, 1), nrow = 3, ncol = 3, byrow = TRUE)

# Matrix Manipulation
sum_matrix <- matrix_A + matrix_B
scaled_matrix <- matrix_A * 2

# Matrix Operations
transposed_A <- t(matrix_A)
product_matrix <- matrix_A %*% matrix_B

# Matrix Statistics
sum_matrix_A <- sum(matrix_A)
mean_matrix_B <- mean(matrix_B)
sd_matrix_B <- sd(matrix_B)

# Visualization
library(ggplot2)
library(reshape2)

# Heatmap of matrix_A with modified color gradient
heatmap_data <- melt(matrix_A)
heatmap_plot <- ggplot(heatmap_data, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "yellow", high = "red") +  # Modified color gradient
  labs(title = "Heatmap of Matrix A", x = "Column", y = "Row")

# Barplot of column sums of matrix_A
column_sums <- colSums(matrix_A)
col_names <- paste("Column", 1:3)
barplot_data <- data.frame(Column = col_names, Sum = column_sums)
barplot_plot <- ggplot(barplot_data, aes(x = Column, y = Sum)) +
  geom_bar(stat = "identity", fill = "purple") +
  labs(title = "Sums of Columns in Matrix A", x = "Column", y = "Sum")

# Display the visualizations
print(heatmap_plot)
print(barplot_plot)
