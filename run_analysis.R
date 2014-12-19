# Load the required packages
library(plyr)
library(dplyr)
library(data.table)

dataPath <- "./UCI HAR Dataset"

##Step1. Merges the training and the test sets to create one data set.

# Read the Training set, Training activities, Training subject, Test set, Test activities, Test subject files.
train_subjects <- read.table(file.path(dataPath, "train", "subject_train.txt"))
train_data <- read.table(file.path(dataPath, "train", "X_train.txt"))
train_activities <- read.table(file.path(dataPath, "train", "Y_train.txt"))

test_subjects <- read.table(file.path(dataPath, "test", "subject_test.txt"))
test_data <- read.table(file.path(dataPath, "test", "X_test.txt"))
test_activities <- read.table(file.path(dataPath, "test", "Y_test.txt")) 
 
# row bind the subjects, data and labels for train and test
subjects <- rbind(train_subjects, test_subjects)
data <- rbind(train_data, test_data)
activities <- rbind(train_activities, test_activities)

# Clean the unused variables from the Global environment
rm(train_subjects, train_data, train_activities, test_subjects, test_data, test_activities)

# Name the column names for subjects and activityLabels data frames
names(subjects) <- "subject"  
names(activities) <- "activity" 

## Step2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table(file.path(dataPath, "features.txt"), 
                       colClasses = c("numeric", "character"))
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
data <- data[ , meanStdIndices]

## Step3. Uses descriptive activity names to name the activities in the data set

activityLabels <- read.table(file.path(dataPath, "activity_labels.txt"))
names(activityLabels) <- c("index", "name")
activities <- as.data.table(activities)
# Convert activity column to factor
activities[, activity := factor(activities$activity, levels = activityLabels$index, 
                                labels = activityLabels$name, ordered = TRUE)]

## Step4. Appropriately labels the data set with descriptive activity names

names(data) <- gsub("\\(\\)", "", features[meanStdIndices, 2]) # remove "()"
names(data) <- gsub("mean", "Mean", names(data)) # capitalize M
names(data) <- gsub("std", "Std", names(data)) # capitalize S
names(data) <- gsub("-", "", names(data)) # remove "-" in column names 
mergedData <- data.table(subjects, activities, data)

## Step5. Creates a second, independent tidy data set with the average of 
## each variable for each activity and each subject. 

tidyData <- ddply(mergedData, .(subject, activity), colwise(mean))
write.table(tidyData, file = "tidydata.txt", row.name = FALSE)



