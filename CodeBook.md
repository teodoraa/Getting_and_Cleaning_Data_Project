The raw data for this project is was obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. The raw data are collected from the accelerometers from the Samsung Galaxy S smartphone. A full description of the process performed and the measurements taken for each activity and subject are available from the website above.  

The variables in the tidy_data dataset are the means of a select subset of variables (with the same names) from the raw dataset above by activity and subject. The subjects consist of a group of 30 volunteers within an age bracket of 19-48 years, each of whom performed six activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING. 

The tidy_data dataset was created using R from the files obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones using the process described below. The corresponding R code is contained in the script run_analysis.R.

The X_test.txt, y_test.txt, and subject_test.txt were merged to create a single test file containing subject IDs, activity IDs of the activities performed by each subject, and variables corresponding the 561 measurements taken for each subject and activity. The variable names for the 561 variables were obtained from the file features.txt.  Similarly, X_train.txt, y_train.txt, and subject_train.txt were merged to create a single training dataset, containing the same variables and variable names. The training and the test datasets were then merged to create one data set. From it, only the variables corresponding to the mean and standard deviation for each measurement were extracted. The activity IDs were replaced by a variable of descriptive activity names obtained from the file activity_labels.txt. Finally, the means of each variable were computed for each activity and subject. The resulting dataset, tidy_data.txt, contains the following 68 variables for each activity and subject:

* activity
* subject
* tBodyAcc.mean...X 
* tBodyAcc.mean...Y
* tBodyAcc.mean...Z
* tBodyAcc.std...X
* tBodyAcc.std...Y
* tBodyAcc.std...Z
* tGravityAcc.mean...X
* tGravityAcc.mean...Y
* tGravityAcc.mean...Z
* tGravityAcc.std...X
* tGravityAcc.std...Y
* tGravityAcc.std...Z
* tBodyAccJerk.mean...X
* tBodyAccJerk.mean...Y
* tBodyAccJerk.mean...Z
* tBodyAccJerk.std...X
* tBodyAccJerk.std...Y
* tBodyAccJerk.std...Z
* tBodyGyro.mean...X
* tBodyGyro.mean...Y
* tBodyGyro.mean...Z
* tBodyGyro.std...X
* tBodyGyro.std...Y
* tBodyGyro.std...Z
* tBodyGyroJerk.mean...X
* tBodyGyroJerk.mean...Y
* tBodyGyroJerk.mean...Z
* tBodyGyroJerk.std...X
* tBodyGyroJerk.std...Y
* tBodyGyroJerk.std...Z
* tBodyAccMag.mean..
* tBodyAccMag.std..
* tGravityAccMag.mean..
* tGravityAccMag.std..
* tBodyAccJerkMag.mean..
* tBodyAccJerkMag.std..
* tBodyGyroMag.mean..
* tBodyGyroMag.std..
* tBodyGyroJerkMag.mean..
* tBodyGyroJerkMag.std..
* fBodyAcc.mean...X
* fBodyAcc.mean...Y
* fBodyAcc.mean...Z
* fBodyAcc.std...X
* fBodyAcc.std...Y
* fBodyAcc.std...Z
* fBodyAccJerk.mean...X
* fBodyAccJerk.mean...Y
* fBodyAccJerk.mean...Z
* fBodyAccJerk.std...X
* fBodyAccJerk.std...Y
* fBodyAccJerk.std...Z
* fBodyGyro.mean...X
* fBodyGyro.mean...Y
* fBodyGyro.mean...Z
* fBodyGyro.std...X
* fBodyGyro.std...Y
* fBodyGyro.std...Z
* fBodyAccMag.mean..
* fBodyAccMag.std..
* fBodyBodyAccJerkMag.mean..
* fBodyBodyAccJerkMag.std..
* fBodyBodyGyroMag.mean..
* fBodyBodyGyroMag.std..
