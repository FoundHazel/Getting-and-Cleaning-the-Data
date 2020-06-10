---
title: "README"
author: "Sarah"
date: "6/10/2020"
output: html_document
---

### Getting and Cleaning Data: Course Project (Week 4)
This is reposity is a Hazel submission for a project in Coursera entitled, 
"Getting and Cleaning the Data." This project submission entails the
instructions on how to tidy, organize and run data anslyses for the Human 
Activity dataset. 

## Dataset
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Files

- CodeBook.md is a code book that describes the: varaibles, data, and 
instructions on how to appropriately clean and tidy the data
- run_analysis(3).R performs specific data functions that follow the 5-steps 
outlined in the course project's instructions:
    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each 
measurement.
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names.
    5. From the data set in step 4, creates a second, independent tidy data set with 
the average of each variable for each activity and each subject.

- FinalData.txt is the exported final data after following all instructions 
from assignment above. 