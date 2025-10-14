
data <- c(20, 22, NA, 25, 30, NA)
cat("Original:", data, "\n")

# Mean Imputation

# Step 1: calculate mean without NA values
mean_value <- mean(data, na.rm = TRUE)

# Step 2: check where data has NA
missing_flags <- is.na(data)

# Step 3: replace NA with mean, keep other values as is
mean_imputed <- ifelse(missing_flags, mean_value, data)

# Print result
print(mean_imputed)
a
# Median Imputation

# Step 1: calculate median without NA values
median_value <- median(data, na.rm = TRUE)

# Step 2: check where data has NA
missing_flags <- is.na(data)

# Step 3: replace NA with median, keep other values as is
median_imputed <- ifelse(missing_flags, median_value, data)

# Print result
print(median_imputed)

# Mode Imputation
data <- c(20, 22, NA, 25, 30, NA)
mode_value <- as.numeric(names(sort(table(data), decreasing=TRUE)[1]))
mode_imputed <- ifelse(is.na(data), mode_value, data)
#is.na(data)

data.frame(Original=data,
           Mean_Imputed=mean_imputed,
           Median_Imputed=median_imputed,
           Mode_Imputed=mode_imputed)



#Z Score

# Example dataset: create a numeric vector of ages
ages <- c(20, 25, 30, 35, 40, 50, 60)

# Mean and Standard Deviation
# Example data
ages <- c(20, 25, 30, 35, 40, 50, 60)

# Step 1: calculate mean and standard deviation
mean_age <- mean(ages)
std_age  <- sd(ages)   # sample std dev (like in statistics)
# if you want population std dev, use: sqrt(mean((ages - mean_age)^2))

# Step 2: calculate Z-scores manually
z_scores <- (ages - mean_age) / std_age

# Step 3: print results
cat("Mean:", mean_age, " Std Dev:", std_age, "\n")
cat("Z-scores:", z_scores, "\n")

# Step 4 (alternative): use built-in function
z_scores_builtin <- scale(ages)
cat("Z-scores with scale():", z_scores_builtin, "\n")

#Decimal scaling

# Example dataset: ages
ages <- c(20, 25, 30, 35, 40, 50, 60, 150)

# Step 1: Find the maximum absolute value
max_val <- max(abs(ages))

# Step 2: Determine n (number of digits in max_val)
n <- nchar(as.character(max_val))

# Step 3: Apply decimal scaling normalization
decimal_scaled <- ages / (10^n)

# Print results
cat("Original ages:", ages, "\n")
cat("Decimal scaled ages:", decimal_scaled, "\n")

#Normal Distribution
mean_age <- 36.8
std_age <- 12

range_68 <- c(mean_age - std_age, mean_age + std_age)
range_95 <- c(mean_age - 2*std_age, mean_age + 2*std_age)
range_997 <- c(mean_age - 3*std_age, mean_age + 3*std_age)

cat("68% of data:", range_68, "\n")
cat("95% of data:", range_95, "\n")
cat("99.7% of data:", range_997, "\n")

## Discretization Methods
#Manual (Distribution Analysis)

ages <- c(5, 12, 18, 25, 40, 70)

categories <- cut(ages,
                  breaks = c(0, 12, 19, 59, Inf),
                  labels = c("Child", "Teen", "Adult", "Senior"))

data.frame(Age = ages, Category = categories)


##binning

#Binning: Equal-Width
scores <- c(10, 20, 35, 50, 70, 90)
bins_equal_width <- cut(scores, breaks=3)
data.frame(Scores=scores, Bin=bins_equal_width)

##Binning: Equal-Depth
bins_equal_depth <- cut(scores, breaks=quantile(scores, probs=seq(0,1, by=0.33)), include.lowest=TRUE)
data.frame(Scores=scores, Bin=bins_equal_depth)

