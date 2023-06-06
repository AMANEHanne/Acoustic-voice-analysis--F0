# Set the file paths for the two datasets
file_path1 <- "C:/Users/Hanane AMRANE/Documents/Experiment/Results/Low_Stimulus_Group_Condition-2.csv"
file_path2 <- "C:/Users/Hanane AMRANE/Documents/Experiment/Results/Nor_Stimulus_Group_Condition-2.csv"

# Read the two datasets
data1 <- read.csv(file_path1)
data2 <- read.csv(file_path2)

# Merge the datasets
merged_data <- rbind(data1, data2)

# Save the merged data as a new CSV file
merged_file_path <- "C:/Users/Hanane AMRANE/Documents/Experiment/Results/combined_responses.csv"
write.csv(merged_data, file = merged_file_path, row.names = FALSE)
