# Code Book
This code book summarizes the resulting data fields in `tidy.txt`.

## Identifiers
* `Subject` - No. of subject
* `Activity` - The type of activity performed when the corresponding measurements were taken

## Measurements
* `tBodyAccMeanX`
* `tBodyAccMeanY`
* `tBodyAccMeanZ`
* `tBodyAccStdX`
* `tBodyAccStdY`
* `tBodyAccStdZ`
* `tGravityAccMeanX`
* `tGravityAccMeanY`
* `tGravityAccMeanZ`
* `tGravityAccStdX`
* `tGravityAccStdY`
* `tGravityAccStdZ`
* `tBodyAccJerkMeanX`
* `tBodyAccJerkMeanY`
* `tBodyAccJerkMeanZ`
* `tBodyAccJerkStdX`
* `tBodyAccJerkStdY`
* `tBodyAccJerkStdZ`
* `tBodyGyroMeanX`
* `tBodyGyroMeanY`
* `tBodyGyroMeanZ`
* `tBodyGyroStdX`
* `tBodyGyroStdY`
* `tBodyGyroStdZ`
* `tBodyGyroJerkMeanX`
* `tBodyGyroJerkMeanY`
* `tBodyGyroJerkMeanZ`
* `tBodyGyroJerkStdX`
* `tBodyGyroJerkStdY`
* `tBodyGyroJerkStdZ`
* `tBodyAccMagMean`
* `tBodyAccMagStd`
* `tGravityAccMagMean`
* `tGravityAccMagStd`
* `tBodyAccJerkMagMean`
* `tBodyAccJerkMagStd`
* `tBodyGyroMagMean`
* `tBodyGyroMagStd`
* `tBodyGyroJerkMagMean`
* `tBodyGyroJerkMagStd`
* `fBodyAccMeanX`
* `fBodyAccMeanY`
* `fBodyAccMeanZ`
* `fBodyAccStdX`
* `fBodyAccStdY`
* `fBodyAccStdZ`
* `fBodyAccMeanFreqX`
* `fBodyAccMeanFreqY`
* `fBodyAccMeanFreqZ`
* `fBodyAccJerkMeanX`
* `fBodyAccJerkMeanY`
* `fBodyAccJerkMeanZ`
* `fBodyAccJerkStdX`
* `fBodyAccJerkStdY`
* `fBodyAccJerkStdZ`
* `fBodyAccJerkMeanFreqX`
* `fBodyAccJerkMeanFreqY`
* `fBodyAccJerkMeanFreqZ`
* `fBodyGyroMeanX`
* `fBodyGyroMeanY`
* `fBodyGyroMeanZ`
* `fBodyGyroStdX`
* `fBodyGyroStdY`
* `fBodyGyroStdZ`
* `fBodyGyroMeanFreqX`
* `fBodyGyroMeanFreqY`
* `fBodyGyroMeanFreqZ`
* `fBodyAccMagMean`
* `fBodyAccMagStd`
* `fBodyAccMagMeanFreq`
* `fBodyBodyAccJerkMagMean`
* `fBodyBodyAccJerkMagStd`
* `fBodyBodyAccJerkMagMeanFreq`
* `fBodyBodyGyroMagMean`
* `fBodyBodyGyroMagStd`
* `fBodyBodyGyroMagMeanFreq`
* `fBodyBodyGyroJerkMagMean`
* `fBodyBodyGyroJerkMagStd`
* `fBodyBodyGyroJerkMagMeanFreq`
* `angle timeBodyAccMean gravity`
* `angle timeBodyAccJerkMeangravityMean`
* `angle timeBodyGyroMean gravityMean`
* `angle timeBodyGyroJerkMean gravityMean`
* `angle X gravityMean`
* `angle Y gravityMean`
* `angle Z gravityMean` 

## Activity Labels
* `WALKING`: subject was walking during the measurements
* `WALKING_UPSTAIRS`: subject was walking up a staircase during the measurements
* `WALKING_DOWNSTAIRS`: subject was walking down a staircase during the measurements
* `SITTING`: subject was sitting during the measurements
* `STANDING`: subject was standing during the measurements
* `LAYING`: subject was laying down during the measurements

## Transformations

The following transformations were applied to the source data:

1. Merge of the training and the test sets to create one data set using merge() function.
2. also merged subjects and activities from the test and train set using rbind() function.
3. eventually combine everything together using cbind() function to a dataset called dt.
4. Extract only the measurements on the mean and standard deviation for each measurement from dt using grep() to a dataset called dt_mean_std.
5. Use descriptive activity names to name the activities in the data set by merging the activity labels with dt_mean_std.
6. sort columns whilst removing the redundant column by using select and rename from the dplyr package.
7. Appropriately label the data set with descriptive variable names using gsub() function.
8. Create a second, independent tidy data set with the average of each variable for each activity and each subject using group_by() and summarise_all()
from the dplyr package
9. Write the data set to the file "tidy.txt" using write.table().
