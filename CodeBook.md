# Getting and Cleaning Data Project

Repo for the submission of the course project for the Johns Hopkins Getting and Cleaning Data course.

# Overview

The project shows how to collect, merge and clean a  data set that can be used for actual subsequent analysis. You can read and find more information about the project at  
[The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

# Information about the DataSet
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person 
performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone 
(Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration
and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width
sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational
and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

# Description about the various steps in R code script

### 1. Merge the training and the test sets to create one data set. 
All the required files are imported into R for subsequent analysis. Assign the column names and merge them to one data set. 

### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
The original data set has a lot of variables/columns, but for this specific project only the column names with mean and std are to be used. The code 
extracts only the required columns.
 
### 3. Uses descriptive activity names to name the activities in the data set 
Merges data subset with the activityType dataframe to include the descriptive activity names

### 4. Appropriately labels the data set with descriptive activity names. 
Use gsub function to elaborately describe the column names.

### 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Write the output to a file named **TidyData.txt**

# R Code Script
**run_analysis.R** contains the R code script for the above described steps.


