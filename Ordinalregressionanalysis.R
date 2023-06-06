# Set the file path for the combined_responses_1.csv file
file_path <- "C:/Users/Hanane AMRANE/Documents/Experiment/Results/combined_responses_1.csv"

# Read the combined_responses_1.csv file
data <- read.csv(file_path)

# Convert the response variable to a factor
data$response <- factor(data$response)

# Specify starting values for the model coefficients
start_values <- c(0, 0, 0, 0, 0)

# Perform ordinal regression analysis with shimmer
model <- polr(response ~ mean_f0 + f0_range + shimmer + jitter + HNR, data = data, method = "probit", start = start_values)
summary(model)
