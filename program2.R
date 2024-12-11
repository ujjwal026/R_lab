# Constants
num_students <-5
num_courses <- 5

# Grading scale function
assign_grade <- function(average_marks) {
  if (average_marks >= 90) {
    return("A")
  } else if (average_marks >= 80) {
    return("B")
  } else if (average_marks >= 70) {
    return("C")
  } else if (average_marks >= 60) {
    return("D")
  } else {
    return("F")
  }
}

# List to store student information
students <- list()

for (i in 1:num_students) {
  # Input student's name
  student_name <- readline(prompt = paste("Enter the name of student", i, ": "))
  
  # Input marks for each course
  marks <- numeric(num_courses)
  for (j in 1:num_courses) {
    marks[j] <- as.numeric(readline(prompt = paste("Enter marks for course", j, "for", student_name, ": ")))
  }
  
  # Calculate total and average marks
  total_marks <- sum(marks)
  average_marks <- total_marks / num_courses
  
  # Determine grade
  grade <- assign_grade(average_marks)
  
  # Store student information
  students[[i]] <- list(
    Name = student_name,
    Marks = marks,
    Total = total_marks,
    Average = average_marks,
    Grade = grade
  )
}

# Display student information
for (student in students) {
  cat("\nStudent Name:", student$Name, "\n")
  cat("Marks:", paste(student$Marks, collapse = ", "), "\n")
  cat("Total Marks:", student$Total, "\n")
  cat("Average Marks:", round(student$Average, 2), "\n")
  cat("Grade:", student$Grade, "\n")
}
