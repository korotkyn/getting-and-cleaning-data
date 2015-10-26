#############################################################################
#  run_analysis.R - script which is don as a result for the project course  #
#  Data Science # Getting and Cleaning Data                                 #
#  done by Mykola Korotkyy©, 24 Oct 2015                                    #
#############################################################################
#
# Project task
#
# The purpose of this project is to demonstrate your ability to collect, work with,
# and clean a data set. The goal is to prepare tidy data that can be used for later analysis.
# You will be graded by your peers on a series of yes/no questions related to the project.
# You will be required to submit:
#
# 1) a tidy data set as described below,
# 2) a link to a Github repository with your script for performing the analysis, and
# 3) a code book that describes the variables, the data, and any transformations or work
#    that you performed to clean up the data called CodeBook.md.
#
# You should also include a README.md in the repo with your scripts.
# This repo explains how all of the scripts work and how they are connected.
#
# One of the most exciting areas in all of data science right now is wearable computing - see
# for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop
# the most advanced algorithms to attract new users. The data linked to from the course
# website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
# A full description is available at the site where the data was obtained:
#
#        http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#
# Here are the data for the project:
#
#        https://d396qusza40orc.cloudfront.net/getData%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
# You should create one R script called run_analysis.R that does the following.
#
#
#  End of Task
#
#############################################################################

### This script is done for use on Mac OS

## Function which can be used just to launch and get result as on command
## using:
## Source(run_analysis.R)
## getTidyData()
getTidyData <- function (){

        # function works in your curent work directory
        print("Pls, wait until see the message - Work done!")
        #download data
        library(httr)
        file.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        file.dest <- "UCI HAR Dataset.zip"
        if(!file.exists(file.dest)){
        	print("downloading data")
        	download.file(file.url, file.dest, method="curl")
        }

        #unzip raw data and create folders
        rawDataFolder <- "UCI HAR Dataset"
        if(!file.exists(rawDataFolder)){
        	print("unzipping file")
        	unzip(file.dest, list = FALSE, overwrite = TRUE)
        }
        resultsFolder <- "TidyData"
        if(!file.exists(resultsFolder)){
        	print("creating TidyData folder")
        	dir.create(resultsFolder)
        }


        #Function for read txt file and convert into data.frame
        getTable <- function (filename,cols = NULL){
        	print(paste("Getting table:", filename))
        	f <- paste(rawDataFolder,filename,sep="/")
        	data <- data.frame()
        	if(is.null(cols)){
        		data <- read.table(f,sep="",stringsAsFactors=F)
        	} else {
        		data <- read.table(f,sep="",stringsAsFactors=F, col.names= cols)
        	}
        	data
        }

        #Run and check getTable
        features <- getTable("features.txt")
        #View(features)

        #Function: read data, build and return dataset (using getTable function)
        getData <- function(type, features){
        	print(paste("Getting data", type))
        	subject_data <- getTable(paste(type,"/","subject_",type,".txt",sep=""),"id")
        	y_data <- getTable(paste(type,"/","y_",type,".txt",sep=""),"activity")
        	x_data <- getTable(paste(type,"/","X_",type,".txt",sep=""),features$V2)
        	return (cbind(subject_data,y_data,x_data))
        }

        #run and check getData function
        train <- getData("train", features)
        #View(train) #if you want to see the result

        test <- getData("test", features)
        #View(test) #if you want to see the result

        #Function: saving result data into result folder
        saveResult <- function (data,name){
        	file <- paste(resultsFolder, "/", name,".csv" ,sep="")
                #you will see this message during saving
        	print(paste("saving results", name, "into file",file))
        	write.csv(data,file)
        	file <- paste(resultsFolder, "/", name,".txt" ,sep="")
        	#you will see this message during saving
        	print(paste("saving results", name, "into file",file))
        	write.table(data,file, row.names = F)
        }

        #############################
        ### Resulting  activities ###

        # 1) Merges the training and the test sets to create one data set.
        # Using plyr package
        library(plyr)
        #merge train and test datasets
        data <- rbind(train, test)

        #arrange by id
        data <- arrange(data, id)
        #View(data) #if you want to see the result


        # 2) Extracts only the measurements on the mean and standard deviation for each measurement.
        mean_and_std <- data[,c(1,2,grep("std", colnames(data)), grep("mean", colnames(data)))]
        #View(mean_and_std)
        #Saving results
        saveResult(mean_and_std,"mean_and_std")

        # 3) Uses descriptive activity names to name the activities in the data set
        activity_labels <- getTable("activity_labels.txt")
        #View(activity_labels)


        # 4) Appropriately labels the data set with descriptive variable names
        # (creating factor)
        data$activity <- factor(data$activity, levels=activity_labels$V1, labels=activity_labels$V2)

        # 5) From the data set in step 4, creates a second, independent tidy data set with the average of
        #    each variable for each activity and each subject(using ddply function)
        tidy_dataset <- ddply(mean_and_std, .(id, activity), .fun=function(x){ colMeans(x[,-c(1:2)]) })
        tidy_dataset <- mutate(tidy_dataset,activity = activity_labels[activity,2])

        colnames(tidy_dataset)[-c(1:2)] <- paste(colnames(tidy_dataset)[-c(1:2)], "_mean", sep="")
        View(tidy_dataset)
        #Saving results
        saveResult(tidy_dataset,"tidy_dataset")
        print("Work done. Good luck!")
        ## The end of the script
}