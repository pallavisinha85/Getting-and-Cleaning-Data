# Introduction
This markdown file describes the raw data, its variables and transformations applied to generate the tidy data set.

# Raw Data
Detailed information on raw data can be found in the README for UCI HAR data set available at [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The following files have been used to generate the tidy data set:

File Name               | File Description
----------------------- | ----------------------
features.txt            | List of all features
activity_labels.txt     | Links the class labels with their activity name
test/X_test.txt         | Test set
test/y_test.txt         | Test labels
test/subject_test.txt   | Each row identifies the subject who performed the activity for each window sample in the test set. Its range is from 1 to 30.
train/X_train.txt       | Training set
train/y_train.txt       | Training labels
train/subject_train.txt | Each row identifies the subject who performed the activity for each window sample in the training set. Its range is from 1 to 30.

# Data Transformations
The following transformations have been applied on raw data to generate the tidy data set.

1. Combined test data files test/subject_test.txt, test/y_test.txt and test/X_test.txt column-wise
2. Combined training data files train/subject_train.txt, train/y_train.txt and train/X_train.txt column-wise
3. Combined test and training data sets row-wise to form the complete raw data set
4. Labelled the raw data set with descriptive variable names: 

    - *subject* represents the subject who performed the activity for each window sample (range from 1 to 30)
    - *activity* represents the physical activity performed for each window sample (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
    - All remaining variables represent features described in features_info.txt available in the UCI HAR data set.
5. Extracted only mean and standard deviation measurements i.e. feature names containing *mean* or *std* from the raw data set in step 4
6. Replaced activity codes in the *activity* column with descriptive names from activity_labels.txt
7. Melted the raw data set to long format with *subject* and *activity* as **id** variables and all other columns as measure columns
8. Casted the resulting data table to calculate mean value of each variable for each subject and activity

The result of step 8 above forms the tidy data set.