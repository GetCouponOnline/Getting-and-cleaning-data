install.packages('dplyr')  #in case dplyr is not installed
library(dplyr) #version 4.0.5 is used originally


#Downloading and extracting data
if (!dir.exists("UCI HAR Dataset")) {
  # Downloads the needed zipped files

  data_url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  filename = "UCI HAR Dataset.zip"
  download.file(data_url, filename)
  
  unzip(filename)
  
  file.remove(filename)
}


#Loading data
message("Loading data")

read_datafile <- function(filepath){
  return (read.table(file.path("UCI HAR Dataset", filepath)))
}

# read training data
subject_train <- read_datafile("train/subject_train.txt")
x_train <- read_datafile("train/X_train.txt")
y_train <- read_datafile("train/y_train.txt")

# read test data
subject_test <- read_datafile("test/subject_test.txt")
x_test <- read_datafile("test/X_test.txt")
y_test <- read_datafile("test/y_test.txt")

#read features
features <- read_datafile("features.txt")

# read activity labels
activities <- read_datafile("activity_labels.txt")

message("Data was loaded successfully!")


# STEP1: Merges the training and the test sets to create one data set.
merged_data <- rbind(
  cbind(subject_train, x_train, y_train),
  cbind(subject_test, x_test, y_test)
)
colnames(merged_data) <- c("Subject", features[, 2], "Activity")

merged_data
# STEP2: Extracts only the measurements on the mean and standard deviation for each measurement. 
merged_data <- merged_data[, grep("mean\\(\\)|std\\(\\)|Subject|Activity", colnames(merged_data))]

merged_data$activity
# STEP3: Uses descriptive activity names to name the activities in the data set
merged_data$Activity<- factor(merged_data$Activity, levels = activities[[1]], labels = activities[[2]])

# STEP4: Appropriately labels the data set with descriptive variable names
data_cols <- colnames(merged_data)

data_cols <- gsub("[\\(\\)-]", "", data_cols)
data_cols <- gsub("^f", "FrequencyDomain", data_cols)
data_cols <- gsub("^t", "TimeDomain", data_cols)
data_cols <- gsub("Acc", "Accelerometer", data_cols)
data_cols <- gsub("Gyro", "Gyroscope", data_cols)
data_cols <- gsub("Mag", "Magnitude", data_cols)
data_cols <- gsub("Freq", "Frequency", data_cols)
data_cols <- gsub("mean", "Mean", data_cols)
data_cols <- gsub("std", "StandardDeviation", data_cols)
data_cols <- gsub("BodyBody", "Body", data_cols)

colnames(merged_data) <- data_cols


# STEP5: From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject
tidy_data <- merged_data %>%
  group_by(Subject, Activity) %>%
  summarise_all(mean) %>%
  ungroup()

tidy_data_names <- c(names(tidy_data[c(1,2)]), paste0("Average-", names(tidy_data[-c(1, 2)])))
names(tidy_data) <- tidy_data_names

tidy_data_filename="tidy_data.txt"

if(file.exists(tidy_data_filename)){
  file.remove(tidy_data_filename)
}

write.table(tidy_data, tidy_data_filename, row.names = FALSE)
