# Data Science\Getting and Cleaning Data - Course Project

This is the course project for the Getting and Cleaning Data Coursera course.
The R script, `run_analysis.R`, does the following:

* Downloads raw data and unzip in the working directory
* Creates folder for results
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of
   each variable for each activity and each subject.
* Saves results into destination folder
 
For using this script as one command to get the result you need

* put scirpt in your work directory with Samsung data("UCI HAR Dataset.zip") in it
* Run the command  - Source(paste(getwd(),'/run_analysis.R', sep=''))
* Run the command getTidyData()
