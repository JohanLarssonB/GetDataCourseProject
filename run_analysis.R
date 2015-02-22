## Load libraries
install.packages("dplyr")
library(dplyr)

## Download and unzip file into working directory
# Create a temporary file
temp <- tempfile()
# Download ZIP archive into temporary file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,temp)
unzip(temp)
# Delete the temp file
unlink(temp)

## Load data
# Load activity labels and feature data 
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
features_info <- read.table("UCI HAR Dataset/features_info.txt")

# Load test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")

# Load train data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")

## Merge test and train data
activity <- rbind(y_train, y_test)
measurements <- cbind(rbind(subject_train, subject_test), activity, rbind(x_train, x_test)) 

# Modify column names for measurements - replace characters "()-$," with "_"
measurement_names <- as.character(features[,2])
measurement_names <- gsub("\\(","_", measurement_names)
measurement_names <- gsub("\\)","_", measurement_names)
measurement_names <- gsub("[-$,]","_", measurement_names)
# Remove tripple and double "_" and ending "_"
measurement_names <- gsub("___","_", measurement_names)
measurement_names <- gsub("__","_", measurement_names)
measurement_names <- gsub("_$","", measurement_names)
# Set column names
colnames(measurements) <- c("subject", "activity", measurement_names)
 
# Keep  only columns with names containing "mean", "Mean" and "std" 
keywords <- c("subject", "activity", "mean", "std")
colindex <- apply(t(sapply(keywords, grepl, colnames(measurements), ignore.case=TRUE)), 2, any)
measurements <- measurements[, colindex]

## Take mean per subject and activity
measurements_mean <- measurements %>% group_by(subject, activity) %>% summarise_each(funs(mean))

## Tidy up table
# Replace acitivity with activity labels
measurements_mean <- merge(measurements_mean, activity_labels, by.x="activity", by.y= "V1")
# Rearrange columns, change column names and sort by subject and activity
measurements_mean <- cbind(measurements_mean[, "subject"], measurements_mean[,"V2"], measurements_mean[,3:88])
names(measurements_mean)[1:2]<- c("subject","activity")
measurements_mean <- arrange(measurements_mean, subject, activity)

## Save tidy data
write.table(measurements_mean, "tidydata.txt", row.name=FALSE)
