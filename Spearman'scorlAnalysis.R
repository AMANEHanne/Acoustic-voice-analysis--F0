# Read the CSV file
data <- read.csv("combined_responses.csv")

# Convert the "response" column to a factor with ordered levels
data$response <- factor(data$response, ordered = TRUE)

# Calculate Spearman's correlation coefficient for each acoustic parameter
cor_shimmer <- cor(data$shimmer, as.numeric(data$response), method = "spearman")
cor_jitter <- cor(data$jitter, as.numeric(data$response), method = "spearman")
cor_HNR <- cor(data$HNR, as.numeric(data$response), method = "spearman")
cor_mean_f0 <- cor(data$mean_f0, as.numeric(data$response), method = "spearman")
cor_f0_range <- cor(data$f0_range, as.numeric(data$response), method = "spearman")

# Print the correlation coefficients
print(cor_shimmer)
print(cor_jitter)
print(cor_HNR)
print(cor_mean_f0)
print(cor_f0_range)
