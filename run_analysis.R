### Getting and Cleaning Data course project


### Step 0: Set working directory and check whether required files are present.  If not, print error message.
setwd("~/School/Coursera/Getting and Cleaning Data/Project")

if (!file.exists("features.txt") | !file.exists("activity_labels.txt") | !file.exists("X_test.txt") | !file.exists("subject_test.txt") | !file.exists("y_test.txt") | !file.exists("X_train.txt") | !file.exists("subject_train.txt") | !file.exists("y_train.txt")){
  print("Error: The requred files are missing")
} else {

  ### Step 1. Merge the training and the test sets to create one data set.  

  ## Read the test files. Set the variable names in file x to those in features.txt, the variable name in the subject file to "subject", 
  ## and the variable name in the y file to "activity". Merge the files into a single "test" file.
  cols<-read.table("features.txt")
  test.x<-read.fwf(file="X_test.txt", widths=rep.int(16,561), header = FALSE, skip = 0, col.names=as.character(cols$V2),buffersize=100)
  test.subject<-read.fwf(file="subject_test.txt", widths=2, header = FALSE, skip = 0, col.names=c("subject"))
  test.y<-read.fwf(file="y_test.txt", widths=1, header = FALSE, skip = 0, col.names=c("activity"))
  test<-cbind(test.subject,test.y,test.x)

  ## Read the training files. Set the variable names in file x to those in features.txt, the variable name in the subject file to "subject", 
  ## and the variable name in the y file to "activity". Merge the files into a single "train" file.
  train.x<-read.fwf(file="X_train.txt", widths=rep.int(16,561), header = FALSE, skip = 0, col.names=as.character(cols$V2),buffersize=100)
  train.subject<-read.fwf(file="subject_train.txt", widths=2, header = FALSE, skip = 0, col.names=c("subject"))
  train.y<-read.fwf(file="y_train.txt", widths=1, header = FALSE, skip = 0, col.names=c("activity"))
  train<-cbind(train.subject,train.y,train.x)

  ## Merge the test and train datasets into a single dataset called "both"
  both<-rbind(test,train)


  ### Step 2: Extract only the measurements on the mean and standard deviation for each measurement. 

  ## Take only variables containing ".mean." or ".std." in their names (assuming that only the .mean() and .std() variables 
  ## are required and not other variables containing "mean" such as .meanFreq(), gravityMean, etc.)
  subset<-both[,c(1,2,grep(pattern=".+\\.(mean|std)\\.+", x=names(both), ignore.case = TRUE))]


  ### Step 3: Uses descriptive activity names to name the activities in the data set.

  ## Read the activity labels from activity_labels.txt. Merge with data using the activity number.
  ## Name the activity variable "activity" and drop the numeric activity variable.
  activities<-read.table("activity_labels.txt")
  subset2<-merge(activities,subset,by.x="V1",by.y="activity",all=TRUE)
  subset<-subset2[,-1]
  colnames(subset)[1]<-"activity"


  ### Step 4: Appropriately label the data set with descriptive variable names - done in Step 1.


  ### Step 5: From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

  ## Calculated the means for each activity and subject
  tidy.data<-aggregate(subset[,3:(dim(subset)[2]-2)], by=list(subset[,1],subset[,2]), mean)
  ## Name the activity variable "activity" and the subject variable "subject"
  colnames(tidy.data)[1:2]<-c("activity","subject")
  ## Output tidy dataset
  write.table(tidy.data, file = "./tidy_data.txt", sep = " ", row.names = FALSE)
}

## Output variable names to help in writing the codebook
write.table(names(tidy.data), file="CodeBook.md", sep="\n", row.names=FALSE)