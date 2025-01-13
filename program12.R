library(readxl)
library(dplyr)
library(ggplot2)

IPL_data <- read.csv("C:/Users/ujsty/Downloads/data.csv")
View(IPL_data)

str(IPL_data)
summary(IPL_data)

summary(IPL_data[, c("win_by_runs", "win_by_wickets")])


Total_matches <- nrow(IPL_data)
cat("The total number of matches in the dataset is", Total_matches, "\n")


n_teams <- length(unique(c(IPL_data$team1, IPL_data$team2)))
cat("The number of unique teams that have participated in IPL matches is", n_teams, "\n")

Unique_teams <- unique(c(IPL_data$team1, IPL_data$team2, IPL_data$winner))
cat("The number of unique teams that have participated in IPL matches is", length(Unique_teams), "\n")
cat("The unique teams are:", paste(Unique_teams, collapse = ", "), "\n")
Matches_won_by_team <- table(IPL_data$winner)
cat("The number of matches won by each team is:\n")
print(Matches_won_by_team)

avg_runs <- mean(IPL_data$win_by_runs, na.rm = TRUE)
cat("The average total runs scored in matches:", round(avg_runs, 2), "\n")

avg_wickets <- mean(IPL_data$win_by_wickets, na.rm = TRUE)
cat("The average total wickets taken in the matches:", round(avg_wickets, 2), "\n")

most_freq_venue <- names(sort(table(IPL_data$venue), decreasing = TRUE)[1])
cat("The most frequently used venue for matches is:", most_freq_venue, "\n")

matches_won_data <- as.data.frame(Matches_won_by_team)
matches_won_data$Team <- rownames(matches_won_data)

barplot(
  Matches_won_by_team,
  main = "Number of Matches Won by Each Team",
  xlab = "Team",
  ylab = "Wins",
  col = rainbow(n_teams),
  las = 2, # Rotate x-axis labels
  cex.names = 0.8 # Reduce label size
)
