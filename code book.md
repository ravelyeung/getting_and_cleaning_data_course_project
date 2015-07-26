## Getting and Cleaning Data - Course Project: Cook Book

This file is described the variables I used in run_analysis.R.

### Variables Overview:
 * **filename**: contains the file download from the link 
 * **fileURL**: contains the link <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
 * **activity**: contains the data read from "UCI HAR Dataset/activity_labels.txt" (Links the class labels with their activity name:
   1 WALKING
   2 WALKING_UPSTAIRS
   3 WALKING_DOWNSTAIRS
   4 SITTING
   5 STANDING
   6 LAYING
 * **feature**: contains the data read from "UCI HAR Dataset/features.txt" (List of all 561 features.)
 * **subject_train**: contains the data read from "UCI HAR Dataset/train/subject_train.txt" (Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.)
 * **data_train**: contains the data read from 'UCI HAR Dataset/train/X_train.txt' (Training set.)
 * **label_train**: contains the data read from 'UCI HAR Dataset/train/y_train.txt' (Training labels.)
 * **subject_test**: contains the data read from 'UCI HAR Dataset/test/subject_test.txt'
 * **data_test**: contains the data read from 'UCI HAR Dataset/test/x_test.txt' (Test set.)
 * **label_test**: contains the data read from 'UCI HAR Dataset/test/y_test.txt' (Test labels.)
 * **data_train_and_test**: contains the data binded together from **data_train** & **data_test** by rows
 * **label_train_and_test**: contains the data binded together from **label_train** & **label_test** by rows
 * **subject_train_and_test**: contains the data binded together from **subject_train** & **subject_test** by rows 
 * **indicator**: to indicate the features about mean and standard deviation
 * **activity_label**: to temporatory store the activity names
 * **data_done**: the variable contains used to contain the result of part 1~4
 * **subject_length**: to indicate the amount of subjects
 * **activity_length**: to indicate the amount of activities
 * **column_length**: to count how many mean and standard deviation features here
 * **data_done_2** the variable contains used to contain the final result
 * **row**: temp. variable
 * **i**: temp. variable
 * **j**: temp. variable
 * **bool1**: temp. indicator variable
 * **bool2**: temp. indicator variable
