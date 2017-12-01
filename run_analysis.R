# This script produces a tidy data set from the UCI Human Activity Recognition 
# Using Smartphones Data Set. 
# The output is a tidy set created as TidyHARData.txt in the current working 
# directory.

# Read list of features 
features <- read.table(".\\UCI HAR Dataset\\features.txt", stringsAsFactors = FALSE)

# Read activity labels
activityLabels <- read.table(".\\UCI HAR Dataset\\activity_labels.txt", stringsAsFactors = FALSE)

# Read test data
testData <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt", stringsAsFactors = FALSE)
testLabels <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt", stringsAsFactors = FALSE)
testSubject <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt", stringsAsFactors = FALSE)
combinedTestData <- cbind(testSubject, testLabels, testData)

# Read training data
trainData <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt", stringsAsFactors = FALSE)
trainLabels <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt", stringsAsFactors = FALSE)
trainSubject <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt", stringsAsFactors = FALSE)
combinedTrainData <- cbind(trainSubject, trainLabels, trainData)

# Merge test and training data
mergedHARData <- rbind(combinedTestData, combinedTrainData)

# Label the data set with descriptive variable names
colnames(mergedHARData) <- c("subject", "activity", features[,2])

# Extract only measurements on the mean and standard deviation for each measurement
requiredColumns <- c("subject", "activity", grep("mean|std", features[,2], value = TRUE))
extractedData <- setDT(mergedHARData[,requiredColumns])

# Assign descriptive names to activities in the data set
extractedData$activity <- factor(extractedData$activity, levels = activityLabels[,1], labels = activityLabels[,2])

# Create an independent tidy data set with the average of each variable for each activity and each subject
moltenHARData <- melt(extractedData, id.vars = c("subject", "activity"), measure.vars = colnames(extractedData)[-c(1,2)], variable.name = "measuredVariable")
tidyHARData <- dcast(moltenHARData, subject + activity ~ measuredVariable,mean)

# Write the tidy data set to a text file in the current directory
write.table(tidyHARData, file = "TidyHARData.txt", quote = FALSE, row.names = FALSE)
ifelse(file.exists(".\\TidyHARData.txt"), print("Tidy data set generated successfully as TidyHARData.txt"), print("Failed to generate tidy data set."))