library(dplyr)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "C:/Users/Sara.Stothers/Coursera/metadata.zip")

#unzip the file and creat new directory 
unzip(zipfile = "C:/Users/Sara.Stothers/Coursera/metadata.zip", exdir = "C:/Users/Sara.Stothers/Coursera/metadata.csv")
list.files("C:/Users/Sara.Stothers/Coursera/metadata.csv")

#create a new path to access all files in the directory 
pathdata = file.path("C:/Users/Sara.Stothers/Coursera/metadata.csv", "UCI HAR Dataset")
files= list.files(pathdata, recursive = TRUE)
files

library(dplyr)
##Assign the data frames
features <- read.table("C:/Users/Sara.Stothers/Coursera/metadata.csv/UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("C:/Users/Sara.Stothers/Coursera/metadata.csv/UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test<- read.table("C:/Users/Sara.Stothers/Coursera/metadata.csv/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("C:/Users/Sara.Stothers/Coursera/metadata.csv/UCI HAR Dataset/test/X_test.txt", col.names = features$functions)                       
y_test <- read.table("C:/Users/Sara.Stothers/Coursera/metadata.csv/UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("C:/Users/Sara.Stothers/Coursera/metadata.csv/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("C:/Users/Sara.Stothers/Coursera/metadata.csv/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("C:/Users/Sara.Stothers/Coursera/metadata.csv/UCI HAR Dataset/train/y_train.txt", col.names = "code")

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
