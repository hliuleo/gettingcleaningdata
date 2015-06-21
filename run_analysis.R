library(plyr)

run_analysis <- function() {
        # Merges the training and the test sets to create one data set.
        XTrain <- read.table('train/X_train.txt')
        XTest <- read.table('test/X_test.txt')
        YTrain <- read.table('train/y_train.txt')
        YTest <- read.table('test/y_test.txt')
        XMerged <- rbind(XTrain, XTest)
        YMerged <- rbind(YTrain, YTest)[, 1]
        
        # Extracts only the measurements on the mean and standard deviation for each measurement. 
        varNames <- read.table('features.txt')[, 2]
        names(XMerged) <- varNames
        matches <- grep("(mean|std)\\(\\)", names(XMerged))
        Mean_Std_Data <- XMerged[, matches]
        
        # Uses descriptive activity names to name the activities in the data set
        activityName <- read.table('activity_labels.txt',
                                   colClasses=c('integer', 'character'))[, 2]
        activities <- activityName[YMerged]
        
        # Appropriately labels the data set with descriptive variable names. 
        names(Mean_Std_Data) <- gsub("-", "", names(Mean_Std_Data))
        names(Mean_Std_Data) <- gsub("^t", "Time", names(Mean_Std_Data))
        names(Mean_Std_Data) <- gsub("^f", "Frequency", names(Mean_Std_Data))
        names(Mean_Std_Data) <- gsub("mean\\(\\)", "Mean", names(Mean_Std_Data))
        names(Mean_Std_Data) <- gsub("std\\(\\)", "StdDev", names(Mean_Std_Data))
        names(Mean_Std_Data) <- gsub("BodyBody", "Body", names(Mean_Std_Data))
        
        # Create a second, independent tidy data set with the average of each variable for each activity and each subject.
        subjectTrain <- read.table("train/subject_train.txt")
        subjectTest  <- read.table("test/subject_test.txt")
        subjects <- rbind(subjectTrain, subjectTest)[, 1]
        tidyData <- cbind(Subject=subjects, Activity=activities, Mean_Std_Data)
        ColMeans <- function(data) {colMeans(data[, -c(1, 2)])}
        Mean_tidyData <- ddply(tidyData, .(Subject, Activity), ColMeans)
        names(Mean_tidyData)[-c(1,2)] <- paste0("Average_", names(Mean_tidyData)[-c(1,2)])
        write.table(Mean_tidyData, "Means.txt", row.names = FALSE)
}