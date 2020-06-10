---
title: "CodeBook.md"
author: "Sarah"
date: "6/10/2020"
output: html_document
---

The Run_analysis(3).R script performs the tidying and organization of a zip file
of data. An additional 5 steps are required by course project's critiera.

1. **Download the dataset**
    - Download dataset and save folder "UCI HAR Dataset"

2. **Assign each data to variables** 
    - features <- feature.txt: 561 rows, 2 columns
    *The features for this database come from accelerometer and gyroscope raw*
    *signals*

    - activities <- activity_labels.txt: 6 rows, 2 columns
    *List of activities performed when the measurements were taken and its codes
    (labels)*

    - subject_test <- test/subject_test.txt: 2947 rows, 1 column
    *contains test data of 9 out of 30 test subjects observed*
    
    - x_test <- test/X_test.txt: 2947 rows, 561 columns
    *contains recorded features of test data*
    
    - y_test <- test/y_test.txt: 2947 rows, 561 columns
    *contains recorded test data of ativities code labels*
    
    - subject_train <- test/subject_train.txt: 7352 rows, 1 column 
    *contains train data of 21 of 30 subjects being observed*
    
    - x_train <- test/X_train.txt: 7352 rows, 561 columns
    *contains recorded features of training data*
    
    - y_train <- test/y_train.txt: 7352 rows, 1 column
    *contains train data of activities coded label data* 
    
3. **Merge the training and testing data sets to create one large data set**
    - x(10299 rows, 561 columns) is created by merging x_train and x_test using 
    **rbind()** function
    - y(10299 rows, 561 columns) is created by merging y_train and y_test using 
    **rbind()** function
    - Subject(10299 rows, 1 column) is created by merging subject_train and 
    subject_test using **rbind()** function
    - Merged_Data(10299 rows, 563 columns) is created by merging Subject, Y and
    X using **cbind()** function 

4. **Extract only the measurements for meand and standard deviation for each 
    measurement**
    - TidyData(102999 rows, 88 columsn) is created by subsetting Merged_Data, 
    selecting only columns: subject, code, and the measurements on the mean and
    standard deviation (std) for each measurement 

5. **Uses descriptive activity names to name the activities within data set**
    - Entire numbers in code column of the TidyData replaced with corresponding
    activity taken from second column of the activities variable

6. **Appropriately label the data set with descriptive varialbe names**
    - code column in TidyData is renamed to activities
    - Acc in solumns renamed Accelerometer
    - Gyro in columns renamed Gyroscope
    - BodyBody in columns renamed Body
    - Mag in columns renamed Magnitude
    - All start with character f in columns renamed Frequency
    - All start with character t in columns renamed Time

7. **From the data set in 4, creates a second, independent tidy data set with 
    average of each variable for each activity and each subject**
    - FinalData(180 rows, 88 columns) created by summarizing TidyData and taking
    the means of each variable for each activity and each subject, after being
    groupped by subject and activity
    - Export FinalData to a FinalData.txt file. 
    