# Set working directory
setwd("E:/")

# Load CSV
df <- read.csv("hospital data analysis.csv")

# Install packages (sirf pehli baar)
install.packages("dplyr")
install.packages("ggplot2")

# Load libraries
library(dplyr)
library(ggplot2)

# Quick look at data
# glimpse() dplyr ke saath bhi kaam karega
glimpse(df)
summary(df)
str(df)
head(df, 20)

# Check missing values
na_summary <- df %>%
  summarise(across(everything(), ~ sum(is.na(.))))
cat("Missing values per column:\n")
print(na_summary)

# Check column types
cat("Column types:\n")
print(sapply(df, class))

# Check duplicated rows
duplicated_rows <- df %>% filter(duplicated(.))
cat("Duplicated rows:\n")
print(duplicated_rows)

# Check duplicated IDs if 'ID' column exists
if("ID" %in% names(df)){
  duplicated_ids <- df %>% filter(duplicated(ID))
  cat("Duplicated IDs:\n")
  print(duplicated_ids)
}

# Summary and boxplots for numeric columns
numeric_cols <- names(df)[sapply(df, is.numeric)]

for(col in numeric_cols){
  cat(paste("\nSummary of", col, ":\n"))
  print(summary(df[[col]]))
  
  p <- ggplot(df, aes_string(y = col)) +
    geom_boxplot(fill = "skyblue") +
    ggtitle(paste("Boxplot of", col)) +
    theme_minimal()
  print(p)
}
