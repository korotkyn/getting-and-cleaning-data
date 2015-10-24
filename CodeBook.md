# CodeBook.md

## run_analysis.R script do the following: 

* Downloads data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Unzips the file
* Creates 'TidyData' folder for results
* Loads 'features.txt' for columns(using getdata function)
* Loads and appends train dataset 'X_train.txt', 'y_train.txt', 'subject_train.txt' (using getdata function)
* 'X_train' contains the data using the feature data set as columns
* 'y_train' contains the activity labels
* 'subject_train' contains ids
* Loads and appends test dataset 'X_test.txt', 'y_test.txt', 'subject_test.txt' (using getdata function) 
* 'X_test' contains the data using the feature data set as columns
* 'y_test' contains the activity labels
* 'subject_test' contains ids
* Merges train and test data
* Rearrange the data by 'id'
* Loads 'activity_labels.txt'
* Changes the data activity row to use the activity labels
* Saves the mean and std into 'TidyData\mean_and_std.csv'(using write.csv) and 'TidyData\mean_and_std.txt'(using write.table functions)
* Saves the tidy dataset into 'TidyData\tidy_dataset.csv' and 'TidyData\tidy_dataset.txt'

## using 'run_analysis.R'

For using this script as one command to get the result you need

* put scirpt in your work directory with Samsung data("UCI HAR Dataset.zip") in it
* Run the command  - Source(paste(getwd(),'/run_analysis.R', sep=''))
* Run the command getTidyData()

## mean_and_std.csv(txt) dataset

contains 1 0300 (with a header row) rows and 82 columns (enumeration column + 81 variables) in csv format

'data.frame':	10299 obs. of  81 variables:

* 'id'
* 'activity'
* 'tBodyAcc.std...X'
* 'tBodyAcc.std...Y'
* 'tBodyAcc.std...Z'
* 'tGravityAcc.std...X'
* 'tGravityAcc.std...Y'
* 'tGravityAcc.std...Z'
* 'tBodyAccJerk.std...X'
* 'tBodyAccJerk.std...Y'
* 'tBodyAccJerk.std...Z'
* 'tBodyGyro.std...X'
* 'tBodyGyro.std...Y'
* 'tBodyGyro.std...Z'
* 'tBodyGyroJerk.std...X'
* 'tBodyGyroJerk.std...Y'
* 'tBodyGyroJerk.std...Z'
* 'tBodyAccMag.std..'
* 'tGravityAccMag.std..'
* 'tBodyAccJerkMag.std..'
* 'tBodyGyroMag.std..'
* 'tBodyGyroJerkMag.std..'
* 'fBodyAcc.std...X'
* 'fBodyAcc.std...Y'
* 'fBodyAcc.std...Z'
* 'fBodyAccJerk.std...X'
* 'fBodyAccJerk.std...Y'
* 'fBodyAccJerk.std...Z'
* 'fBodyGyro.std...X'
* 'fBodyGyro.std...Y'
* 'fBodyGyro.std...Z'
* 'fBodyAccMag.std..'
* 'fBodyBodyAccJerkMag.std..'
* 'fBodyBodyGyroMag.std..'
* 'fBodyBodyGyroJerkMag.std..'
* 'tBodyAcc.mean...X'
* 'tBodyAcc.mean...Y'
* 'tBodyAcc.mean...Z'
* 'tGravityAcc.mean...X'
* 'tGravityAcc.mean...Y'
* 'tGravityAcc.mean...Z'
* 'tBodyAccJerk.mean...X'
* 'tBodyAccJerk.mean...Y'
* 'tBodyAccJerk.mean...Z'
* 'tBodyGyro.mean...X'
* 'tBodyGyro.mean...Y'
* 'tBodyGyro.mean...Z'
* 'tBodyGyroJerk.mean...X'
* 'tBodyGyroJerk.mean...Y'
* 'tBodyGyroJerk.mean...Z'
* 'tBodyAccMag.mean..'
* 'tGravityAccMag.mean..'
* 'tBodyAccJerkMag.mean..'
* 'tBodyGyroMag.mean..'
* 'tBodyGyroJerkMag.mean..'
* 'fBodyAcc.mean...X'
* 'fBodyAcc.mean...Y'
* 'fBodyAcc.mean...Z'
* 'fBodyAcc.meanFreq...X'
* 'fBodyAcc.meanFreq...Y'
* 'fBodyAcc.meanFreq...Z'
* 'fBodyAccJerk.mean...X'
* 'fBodyAccJerk.mean...Y'
* 'fBodyAccJerk.mean...Z'
* 'fBodyAccJerk.meanFreq...X'
* 'fBodyAccJerk.meanFreq...Y'
* 'fBodyAccJerk.meanFreq...Z'
* 'fBodyGyro.mean...X'
* 'fBodyGyro.mean...Y'
* 'fBodyGyro.mean...Z'
* 'fBodyGyro.meanFreq...X'
* 'fBodyGyro.meanFreq...Y'
* 'fBodyGyro.meanFreq...Z'
* 'fBodyAccMag.mean..'
* 'fBodyAccMag.meanFreq..'
* 'fBodyBodyAccJerkMag.mean..'
* 'fBodyBodyAccJerkMag.meanFreq..'
* 'fBodyBodyGyroMag.mean..'
* 'fBodyBodyGyroMag.meanFreq..'
* 'fBodyBodyGyroJerkMag.mean..'
* 'fBodyBodyGyroJerkMag.meanFreq..'


## tidy_dataset.csv(txt) dataset

contains 181 rows (with header) and 82 columns (enumeration column + 81 variables) in csv format

'data.frame':	180 obs. of  81 variables:

* 'id'
* 'activity'
* 'tBodyAcc.std...X_mean'
* 'tBodyAcc.std...Y_mean'
* 'tBodyAcc.std...Z_mean'
* 'tGravityAcc.std...X_mean'
* 'tGravityAcc.std...Y_mean'
* 'tGravityAcc.std...Z_mean'
* 'tBodyAccJerk.std...X_mean'
* 'tBodyAccJerk.std...Y_mean'
* 'tBodyAccJerk.std...Z_mean'
* 'tBodyGyro.std...X_mean'
* 'tBodyGyro.std...Y_mean'
* 'tBodyGyro.std...Z_mean'
* 'tBodyGyroJerk.std...X_mean'
* 'tBodyGyroJerk.std...Y_mean'
* 'tBodyGyroJerk.std...Z_mean'
* 'tBodyAccMag.std.._mean'
* 'tGravityAccMag.std.._mean'
* 'tBodyAccJerkMag.std.._mean'
* 'tBodyGyroMag.std.._mean'
* 'tBodyGyroJerkMag.std.._mean'
* 'fBodyAcc.std...X_mean'
* 'fBodyAcc.std...Y_mean'
* 'fBodyAcc.std...Z_mean'
* 'fBodyAccJerk.std...X_mean'
* 'fBodyAccJerk.std...Y_mean'
* 'fBodyAccJerk.std...Z_mean'
* 'fBodyGyro.std...X_mean'
* 'fBodyGyro.std...Y_mean'
* 'fBodyGyro.std...Z_mean'
* 'fBodyAccMag.std.._mean'
* 'fBodyBodyAccJerkMag.std.._mean'
* 'fBodyBodyGyroMag.std.._mean'
* 'fBodyBodyGyroJerkMag.std.._mean'
* 'tBodyAcc.mean...X_mean'
* 'tBodyAcc.mean...Y_mean'
* 'tBodyAcc.mean...Z_mean'
* 'tGravityAcc.mean...X_mean'
* 'tGravityAcc.mean...Y_mean'
* 'tGravityAcc.mean...Z_mean'
* 'tBodyAccJerk.mean...X_mean'
* 'tBodyAccJerk.mean...Y_mean'
* 'tBodyAccJerk.mean...Z_mean'
* 'tBodyGyro.mean...X_mean'
* 'tBodyGyro.mean...Y_mean'
* 'tBodyGyro.mean...Z_mean'
* 'tBodyGyroJerk.mean...X_mean'
* 'tBodyGyroJerk.mean...Y_mean'
* 'tBodyGyroJerk.mean...Z_mean'
* 'tBodyAccMag.mean.._mean'
* 'tGravityAccMag.mean.._mean'
* 'tBodyAccJerkMag.mean.._mean'
* 'tBodyGyroMag.mean.._mean'
* 'tBodyGyroJerkMag.mean.._mean'
* 'fBodyAcc.mean...X_mean'
* 'fBodyAcc.mean...Y_mean'
* 'fBodyAcc.mean...Z_mean'
* 'fBodyAcc.meanFreq...X_mean'
* 'fBodyAcc.meanFreq...Y_mean'
* 'fBodyAcc.meanFreq...Z_mean'
* 'fBodyAccJerk.mean...X_mean'
* 'fBodyAccJerk.mean...Y_mean'
* 'fBodyAccJerk.mean...Z_mean'
* 'fBodyAccJerk.meanFreq...X_mean'
* 'fBodyAccJerk.meanFreq...Y_mean'
* 'fBodyAccJerk.meanFreq...Z_mean'
* 'fBodyGyro.mean...X_mean'
* 'fBodyGyro.mean...Y_mean'
* 'fBodyGyro.mean...Z_mean'
* 'fBodyGyro.meanFreq...X_mean'
* 'fBodyGyro.meanFreq...Y_mean'
* 'fBodyGyro.meanFreq...Z_mean'
* 'fBodyAccMag.mean.._mean'
* 'fBodyAccMag.meanFreq.._mean'
* 'fBodyBodyAccJerkMag.mean.._mean'
* 'fBodyBodyAccJerkMag.meanFreq.._mean'
* 'fBodyBodyGyroMag.mean.._mean'
* 'fBodyBodyGyroMag.meanFreq.._mean'
* 'fBodyBodyGyroJerkMag.mean.._mean'
* 'fBodyBodyGyroJerkMag.meanFreq.._mean'
