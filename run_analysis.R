## 0. Preparations
filename <- "getdata_dataset.zip"
## download the file
if (!file.exists(filename)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
    download.file(fileURL, filename, mode="wb")
}
## NOTICE: mode="wb" is important, or you will get the warning message: In unzip(filename): internal error in 'unz' code

## unzip the file
if (!file.exists("UCI HAR Dataset")) {
    unzip(filename) 
}

## Read the data we need. In the read data part, I use the "if" & "exists" function
## to check if the data is already read or not. That is, to reduce the time for reading
## data, particularly when there are a huge numbers of data. 
if (!exists("activity")){
    activity <- read.table("UCI HAR Dataset/activity_labels.txt")
}## 'activity_labels.txt': Links the class labels with their activity name.
if (!exists("feature")){
    feature <- read.table("UCI HAR Dataset/features.txt")
}## 'features.txt': List of all features.

## read the data in train folder
if (!exists("subject_train")){
    subject_train = read.table("UCI HAR Dataset/train/subject_train.txt")
}## 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
if (!exists("data_train")){
    data_train= read.table('UCI HAR Dataset/train/X_train.txt')
}## 'train/X_train.txt': Training set.
if (!exists("label_train")){
    label_train= read.table('UCI HAR Dataset/train/y_train.txt')
}## 'train/y_train.txt': Training labels.

## read the data in test folder
if (!exists("subject_test")){
    subject_test = read.table('UCI HAR Dataset/test/subject_test.txt')
}
if (!exists("data_test")){
    data_test= read.table('UCI HAR Dataset/test/x_test.txt')
}## 'test/X_test.txt': Test set.
if (!exists("label_test")){
    label_test= read.table('UCI HAR Dataset/test/y_test.txt')
}## 'test/y_test.txt': Test labels.

## 1. Merges the training and the test sets to create one data set.
if (!exists("data_train_and_test")){
    data_train_and_test <- rbind(data_train, data_test)
}
if (!exists("label_train_and_test")){
    label_train_and_test <- rbind(label_train, label_test)
}
names(label_train_and_test) <- "activities"
if (!exists("subject_train_and_test")){
    subject_train_and_test <- rbind(subject_train, subject_test)
}
names(subject_train_and_test) <- "subjects"

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
indicator <- grep("mean\\(\\)|std\\(\\)", feature[, 2])
data_train_and_test <- data_train_and_test[, indicator]
names(data_train_and_test) <- gsub("\\(\\)", "", feature[indicator, 2])

## 3. Uses descriptive activity names to name the activities in the data set.
activity_label <- activity[label_train_and_test[, 1], 2]
label_train_and_test[, 1] <- activity_label

## 4. Appropriately labels the data set with descriptive activity names. 
data_done <- cbind(subject_train_and_test, label_train_and_test, data_train_and_test)
write.table(data_done, "data_done_1.txt")

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
subject_length <- max(subject_train_and_test)
activity_length <- dim(activity)[1]
column_length <- dim(data_done)[2]
data_done_2 <- matrix(NA, nrow=subject_length*activity_length, ncol=column_length) 
data_done_2 <- as.data.frame(data_done_2)
colnames(data_done_2) <- colnames(data_done)
row <- 1
for(i in 1:subject_length) {
    for(j in 1:activity_length) {
        data_done_2[row, 1] <- sort(unique(subject_train_and_test)[, 1])[i]
        data_done_2[row, 2] <- activity[j, 2]
        bool1 <- i == data_done$subjects
        bool2 <- activity[j, 2] == data_done$activities
        data_done_2[row, 3:column_length] <- colMeans(data_done[bool1&bool2, 3:column_length])
        row <- row + 1
    }
}
write.table(data_done_2, "data_done_2.txt", row.name=FALSE)