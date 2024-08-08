titanic_data <- read.csv("Cleaned_Titanic_Dataset.csv")
# What function do you use to load a CSV file into R?
# read.csv()
#   What is the variable name you used to store the loaded dataset?
# titanic_data

View(titanic_data)
# How many rows and columns do you see in the dataset?
dim(titanic_data)
# rows: 891  columns: 12

# What are the first few entries in the Name column?
head(titanic_data)
top_n(titanic_data,3,Name)

summary(titanic_data)
# What is the average age of the passengers?
#29
#   What is the median fare paid by passengers?
#14.45
#   How many passengers are missing age information?
colSums(is.na(titanic_data))
#177 age missing

str(titanic_data)
# What data types are used for the Age and Fare columns?
class(titanic_data$Fare)
#Numeric

#   How many factor variables are there in the dataset, and which columns are they?
#2 sex & Survived
sex_fact <- factor(titanic_data$Sex)
print(class(sex_fact))
levels(sex_fact)
class(titanic_data$Sex)

#NOTE: changing the data type permanently on the dataFrame
titanic_data$Sex <- factor(titanic_data$Sex)

install.packages("dplyr")
library(dplyr)
# What command is used to install a package in R?
# install.packages("packageName")
#   How do you load a library in R once it is installed?
# library(libraryName)

# 4. Data Cleaning
#2- Handle Missing Values: Identify and handle missing values.
# Check for missing values
colSums(is.na(titanic_data))

# Example: Filling missing Age values with median
titanic_data <- titanic_data %>%
  mutate(Age = ifelse(is.na(Age), median(Age, na.rm = TRUE), Age))

# Verify that missing values have been filled
colSums(is.na(titanic_data))


  
  # How many missing values are there in the Age column before and after filling them?
  #177
  # Why might you choose to fill missing values with the median instead of the mean?
# Mean imputation can be used when the distribution of the data is normal, 
# and the missing values are random. Median imputation is appropriate when the distribution of the data is skewed.

# Example: Convert 'Survived' to factor
titanic_data <- titanic_data %>%
  mutate(Survived = as.factor(Survived),Parch = as.factor(Parch))
class(titanic_data$Parch)
levels(titanic_data$Parch)
# Save the Cleaned Data for Future Use:
write.csv(titanic_data, "Cleaned_Titanic_Data.csv", row.names = FALSE)
