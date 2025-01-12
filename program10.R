library(dplyr)

# Data frame creation
df <- data.frame(
  EMPID = c(101, 102, 103, 104, 105),
  Name = c("John", "Peter", "Bob", "Linda", "Elizabeth"),
  Age = c(25, 30, 35, 40, 45),
  Salary = c(50000, 60000, 45000, 70000, 55000),
  Department = c("HR", "IT", "Finance", "Production", "QualityControl")
)

# Filter data: Age > 25
filtered_data <- filter(df, Age > 25)

# Select columns: EMPID, Name, Salary
selected_columns <- select(df, EMPID, Name, Salary)

# Mutate data: Add Salary_Adjusted column
mutated_data <- mutate(df, Salary_Adjusted = Salary * 1.1)

# Group by Department and summarize
grouped_data <- group_by(df, Department)
summarized_data <- summarize(grouped_data, Avg_salary = mean(Salary), Max_Age = max(Age))

# Arrange by Age and descending Salary
arranged_data <- arrange(df, Age, desc(Salary))

# Data frame for joining
df2 <- data.frame(
  EMPID = c(103, 104, 105),
  Bonus = c(2000, 3000, 5000)
)

# Left join on EMPID
joined_data <- left_join(df, df2, by = "EMPID")

# Print results
print("Filtered Data:")
print(filtered_data)

print("Selected Columns:")
print(selected_columns)

print("Mutated Data:")
print(mutated_data)

print("Summarized Data:")
print(summarized_data)

print("Arranged Data:")
print(arranged_data)

print("Joined Data:")
print(joined_data)
