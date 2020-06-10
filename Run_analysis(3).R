#Instruction 1: Merge training and test data into one data set
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(subject, x, y)
Merged_Data

#Extra only the mean and std of each measurement
TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))
TidyData

#Use the descriptve activity names to name each of the activities in the data set
TidyData$code <- activities[TidyData$code, 2]

#labelt the data set with varialbe names
names(TidyData)[2] = "activity"
names(TidyData) <- gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData) <- gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData) <- gsub("BodyBody", "Body", names(TidyData))
names(TidyData) <- gsub("Mag", "Magnitude", names(TidyData))
names(TidyData) <- gsub("^t", "time", names(TidyData))
names(TidyData) <- gsub("^f", "Frequency", names(TidyData))
names(TidyData)<- gsub("tBody", "TimeBody", names(TidyData))
names(TidyData) <- gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)    
names(TidyData) <- gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("angle", "Angle", names(TidyData))
names(TidyData) <- gsub("gravity", "Gravity", names(TidyData))

#From the relabeled data, create a second independent tidy data set with avg of each variable for each activity and each subject
FinalData <- TidyData %>%
    group_by(subject, activity)%>%
    summarise_all(funs(mean))
#create the new table
write.table(FinalData, "FinalData.txt", row.names = FALSE)
#visualize the new table
str(FinalData)
FinalData
