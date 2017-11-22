run_analysis <- function(){
        library(dplyr)
        filename <- "getdata_dataset.zip"
        if (!file.exists(filename)){
          fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
          download.file(fileURL, filename, mode = "wb")
        }  
        if (!file.exists("UCI HAR Dataset")) 
          unzip(filename) 
        #importing all data
        x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
        y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
        x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
        y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
        features <- read.table("UCI HAR Dataset/features.txt", sep = " ")
        colnames(features) <- c("Feature No.","FeatureName")
        activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", sep = " ")
        colnames(activity_labels) <- c("num", "act")
        subjects_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
        subjects_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
        
        #merging the train and test set to create one data set
        data <- merge(x_train, x_test, all = TRUE)
        
        #merging activities
        activities <- rbind(y_train, y_test)
        colnames(activities) <- c("Activity")
        #merging subjects
        subjects <- rbind(subjects_train,subjects_test)
        colnames(subjects) <- c("Subject")
        #assign feature labels to the data
        colnames(data) <- make.names(features$FeatureName, unique=TRUE)
        #get everything together
        dt <- cbind(subjects, activities, data)
        
        #Extract only the measurements on the mean and standard deviation for each measurement
        dt_mean_std <- dt[grep("Subject|Activity|[Mm]ean|[Ss]td",colnames(dt))]
        
        #use descriptive activity names to name the activities in the data set
        dt_mean_std <- merge(dt_mean_std, activity_labels, by.x = "Activity", by.y = "num")
        #sorting columns whilst removing the redundant column
        dt_mean_std <- select(dt_mean_std, Subject, act, 3:88)
        dt_mean_std <- rename(dt_mean_std, Activity = act)
        
        #Appropriately label the data set with descriptive variable names
        colnames(dt_mean_std) <- gsub("\\.", " ", colnames(dt_mean_std))
        colnames(dt_mean_std) <- gsub("  ", "", colnames(dt_mean_std))
        colnames(dt_mean_std) <- gsub("^f", "frequency", colnames(dt_mean_std))
        colnames(dt_mean_std) <- gsub("^t", "time", colnames(dt_mean_std))
        colnames(dt_mean_std) <- gsub("tBody", "timeBody", colnames(dt_mean_std))
        colnames(dt_mean_std) <- gsub("BodyBody", "Body", colnames(dt_mean_std))
        
        #create a second, independent tidy data set with the average of each variable for each activity and each subject
        dt2 <- tbl_df(dt_mean_std)
        dt2 <- group_by(dt2, Subject, Activity)
        dt2 <- summarise_all(dt2, funs(mean))
        write.table(dt2, file="tidy.txt", row.names=FALSE, col.names=TRUE, sep="\t", quote=FALSE)
}