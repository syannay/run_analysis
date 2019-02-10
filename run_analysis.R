library(dplyr)

## Please note the relative directory set 

## Read data from test
test_subjects <- read.table("./test/subject_test.txt")
test_x <- read.table("./test/X_test.txt")
test_y <- read.table("./test/y_test.txt")

## Read data from training
train_subjects <- read.table("./train/subject_train.txt")
train_x <- read.table("./train/X_train.txt")
train_y <- read.table("./train/y_train.txt")

## Read features, don't convert text labels to factors
feature_names <- read.table("./features.txt", as.is = TRUE)

## Read activity labels
activity_labels <- read.table("./activity_labels.txt")

colnames(activity_labels) <- c("activity_ID", "activity_label")

## Create one data set
combinedActivity <- rbind(
  cbind(train_subjects, train_x, train_y),
  cbind(test_subjects, test_x, test_y)
)

# remove not required variables
rm(train_subjects, train_x, train_y, 
   test_subjects, test_x, test_y)

# assign names to columns of combined activity
colnames(combinedActivity) <- c("subject", feature_names[, 2], "activity")

# Get the columns numbers thar are required further for calculation 
columnNumbersRequired <- grep("subject|activity|mean|std", colnames(combinedActivity))

# Get only required columns from data set
combinedActivity <- combinedActivity[, columnNumbersRequired]

# Replace activity values 1-6 with activity names as read from activity_labels
combinedActivity$activity <- factor(combinedActivity$activity, 
                                 levels = activity_labels[, 1], labels = activity_labels[, 2])
## Make clearer names
## 1. Get column names
activityColumns <- colnames(groupedBy)

## Provide more tidy names

activityColumns <- gsub("Acc", "Accelerometer", activityColumns)
activityColumns <- gsub("Mag", "Magnitude", activityColumns)
activityColumns <- gsub("Freq", "Frequency", activityColumns)
activityColumns <- gsub("^t", "time", activityColumns)
activityColumns <- gsub("^f", "frequency", activityColumns)
activityColumns <- gsub("[\\(\\)-,]", "", activityColumns)


## Group by subject and activity
groupedBy <- group_by(combinedActivity, subject, activity)

summarise_all_by_mean <- groupedBy %>% summarise_all(mean)

## Output to file tidy_data_set.txt"
write.table(summarise_all_by_mean, "tidy_data_set.txt", 
            row.names = FALSE, quote = FALSE)
