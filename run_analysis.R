  ## 1. Merging TRAINING & TEST data sets
  # set working directory 
  setwd('C:\\Users\\User\\Desktop\\Getting and Cleaning Data Project\\Data\\UCI HAR Dataset')

  # load TRAINING data files required for analysis
  subjectsTrain = read.table('.\\train\\subject_train.txt',header=FALSE)
  activityTrain = read.table('.\\train\\y_train.txt',header=FALSE)
  dataTrain     = read.table('.\\train\\x_train.txt',header=FALSE)
  features     = read.table('.\\features.txt',header=FALSE)
  activityType = read.table('.\\activity_labels.txt',header=FALSE)

  # assign column names & merging all training data
  colnames(dataTrain)     = features[,2]
  colnames(activityTrain) = "activityID"
  colnames(subjectsTrain) = "Subjects"
  colnames(activityType)  = c("activityID", "activityType")

  allTraining = cbind(subjectsTrain,activityTrain, dataTrain)

  # load TEST data files required for analysis
  subjectsTest = read.table('.\\test\\subject_test.txt',header=FALSE)
  activityTest = read.table('.\\test\\y_test.txt',header=FALSE)
  dataTest     = read.table('.\\test\\x_test.txt',header=FALSE)

  # assign column names & merging all test data
  colnames(dataTest)     = features[,2]
  colnames(activityTest) = "activityID"
  colnames(subjectsTest) = "Subjects"
  
  allTest = cbind(subjectsTest,activityTest, dataTest)

  # Combine Training & Test data 
  allData = rbind(allTraining, allTest)

  ## 2. Extracts only the measurements on the mean and standard deviation for each measurement
  meanSD = grep("mean\\(\\)|std\\(\\)", features[,2],value=TRUE)
  meanSD = union(c("Subjects","activityID"), meanSD)

  reqData = subset(allData, select=meanSD)

  ## 3. Useing descriptive activity names to name the activities in the data set
  reqData = merge(reqData,activityType,by='activityID',all.x=TRUE)

  ## 4. Appropriately labeling the data set with descriptive variable names
  names(reqData)<-gsub("std()", "SD", names(reqData))
  names(reqData)<-gsub("mean()", "MEAN", names(reqData))
  names(reqData)<-gsub("^t", "time", names(reqData))
  names(reqData)<-gsub("^f", "frequency", names(reqData))
  names(reqData)<-gsub("Acc", "Accelerometer", names(reqData))
  names(reqData)<-gsub("Gyro", "Gyroscope", names(reqData))
  names(reqData)<-gsub("Mag", "Magnitude", names(reqData))
  names(reqData)<-gsub("BodyBody", "Body", names(reqData))

  ## 5. From the data set in step 4, create a second, independent tidy data set 
  write.table(reqData, './TidyData.txt',row.names=TRUE,sep='\t')
