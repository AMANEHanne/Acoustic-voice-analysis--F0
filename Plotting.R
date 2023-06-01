library(ggplot2)
library(dplyr)

# Read the CSV file
data <- read.csv("C:/Users/Hanane AMRANE/Documents/Experiment/Results/grouped_data.csv")

# Filter the data for positive responses in the Nor and Low conditions (-2)
positive_data <- data %>%
  filter(stimulus %in% c("Nor_1-2", "Nor_2-2", "Nor_3-2", "Nor_4-2", "Nor_5-2", "Nor_6-2", "Nor_7-2",
                         "Low_1-2", "Low_2-2", "Low_3-2", "Low_4-2", "Low_5-2", "Low_6-2", "Low_7-2"),
         response %in% c("AGREE", "SOMEWHAT AGREE"))

# Create a new group variable based on the stimulus
positive_data <- positive_data %>%
  mutate(group = ifelse(grepl("Nor", stimulus), "Nor", "Low"))

# Calculate the mean count for each group
grouped_data <- positive_data %>%
  group_by(group) %>%
  summarise(mean_count = mean(count),
            sd_count = sd(count),
            se_count = sd_count / sqrt(n()))

# Define colors for the groups
colors <- c("Nor" = "lightblue", "Low" = "lightgreen")

# Plot the error bar plot with different colors for the groups
ggplot(grouped_data, aes(x = group, y = mean_count, fill = group)) +
  geom_bar(stat = "identity") +
  geom_errorbar(aes(ymin = mean_count - se_count, ymax = mean_count + se_count),
                width = 0.2, color = "black") +
  scale_fill_manual(values = colors) +
  labs(x = "Group", y = "Mean Count") +
  ggtitle("Positive Responses by Group") +
  theme_minimal()

