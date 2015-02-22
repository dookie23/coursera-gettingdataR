# 1. Merges the training and the test sets to create one data set
# Merging
train <- read.table("/Users/dookie/Documents/data/UCIHARDataset/train/X_train.txt")
test <- read.table("/Users/dookie/Documents/data/UCIHARDataset/test/X_test.txt")
total <- rbind(train,test)

# Dimension test
dim(train)
dim(test)
dim(total)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# Assigning col names

features <- read.table("/Users/dookie/Documents/data/UCIHARDataset/features.txt", header=FALSE)
#colnames(total) <- features$V2
colnames(total) <- features$V1

# Selecting columns
library(dplyr)
ds <- tbl_df(total)
column_indexes <- grep("-mean|-std", features$V2, value = FALSE)
ds_mean_std <- select(ds, column_indexes)

# 3. Uses descriptive activity names to name the activities in the data set
train_labels <- read.table("/Users/dookie/Documents/data/UCIHARDataset/train/y_train.txt")
test_labels <- read.table("/Users/dookie/Documents/data/UCIHARDataset/test/y_test.txt")
total_labels <- rbind(train_labels,test_labels)

activity_labels <- read.table("/Users/dookie/Documents/data/UCIHARDataset/activity_labels.txt")
colnames_aux <- colnames(ds_mean_std)
ds_mean_std <- cbind(lapply(total_labels, function(x) {activity_labels$V2[x]}), ds_mean_std)
colnames(ds_mean_std) <- c("activity_name",colnames_aux)

# 4. Appropriately labels the data set with descriptive variable names. 
colnames(ds_mean_std) <- c("activity_name",as.vector(features$V2[column_indexes]))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
train_subjects <- read.table("/Users/dookie/Documents/data/UCIHARDataset/train/y_train.txt")
test_subjects <- read.table("/Users/dookie/Documents/data/UCIHARDataset/test/y_test.txt")
total_subjects <- rbind(train_subjects,test_subjects)

colnames_aux <- colnames(ds_mean_std)
ds_mean_std <- cbind(total_subjects, ds_mean_std)
colnames(ds_mean_std) <- c("subject",colnames_aux)