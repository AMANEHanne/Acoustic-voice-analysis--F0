library(data.table)

# Define the directory path
directory_path <- "C:\\Users\\Hanane AMRANE\\Documents\\Experiment\\Results"

# Get the list of files in the directory
file_list <- list.files(directory_path, pattern = "*.Table", full.names = TRUE)

# Initialize an empty data.table to store the combined data
combined_data <- data.table()

# Read and combine the data from each file
for (file in file_list) {
  # Read the data from the file
  data <- fread(file)
  
  # Append the data to the combined_data data.table
  combined_data <- rbind(combined_data, data)
}

# Save the combined data as a CSV file
write.csv(combined_data, file = "C:\\Users\\Hanane AMRANE\\Documents\\Experiment\\Results\\combined_data.csv", row.names = FALSE)

# Continue with the rest of the analysis using the combined_data data.table
# Filter the Low stimulus group for condition -4
low_data_filtered <- combined_data %>%
  filter(grepl("Low.*-4", stimulus))

# Filter the Average stimulus group for condition -4
nor_data_filtered <- combined_data %>%
  filter(grepl("Nor.*-4", stimulus))

# Define the response categories
positive_responses <- c("STRONGLY AGREE", "AGREE", "SOMEWHAT AGREE")
negative_responses <- c("STRONGLY DISAGREE", "DISAGREE", "SOMEWHAT DISAGREE")
neutral_response <- "NEUTRAL"

# Calculate the counts of positive, negative, and neutral responses for each group
low_positive_count <- sum(low_data_filtered$response %in% positive_responses)
low_negative_count <- sum(low_data_filtered$response %in% negative_responses)
low_neutral_count <- sum(low_data_filtered$response == neutral_response)

nor_positive_count <- sum(nor_data_filtered$response %in% positive_responses)
nor_negative_count <- sum(nor_data_filtered$response %in% negative_responses)
nor_neutral_count <- sum(nor_data_filtered$response == neutral_response)

# Create a data frame for response counts
response_counts <- data.frame(
  Group = c("Positive", "Neutral", "Negative"),
  Low = c(low_positive_count, low_neutral_count, low_negative_count),
  Average = c(nor_positive_count, nor_neutral_count, nor_negative_count)
)

# Reshape the data frame for plotting
response_counts <- tidyr::gather(response_counts, Response, Count, -Group)

# Create the bar plot
ggplot(response_counts, aes(x = Group, y = Count, fill = Response)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Stimulus Group", y = "Response Count", fill = "Response") +
  ggtitle("Comparison of Positive, Negative, and Neutral Responses\nbetween Low and Average Stimulus Groups (Condition -4)") +
  theme_minimal()
# Print the counts
cat("Low Positive Count:", low_positive_count, "\n")
cat("Low Neutral Count:", low_neutral_count, "\n")
cat("Low Negative Count:", low_negative_count, "\n\n")
cat("Average Positive Count:", nor_positive_count, "\n")
cat("Average Neutral Count:", nor_neutral_count, "\n")
cat("Average Negative Count:", nor_negative_count, "\n")
