
# First, we must read the .txt files into our Environment
# assuming that the "UCI HAR Dataset" is existing in the working directory,

features <- read.table("./UCI HAR Dataset/features.txt")
f_name <- features[,2]
f_names <- as.character(f_name)

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = f_names)
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt", col.names = "Activity")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = f_names)
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt", col.names = "Activity")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")

# now lets merge the training and the test sets to create one data set.
X_all <- rbind(X_train, X_test)
Y_all <- rbind(Y_train, Y_test)
subject_all <- rbind(subject_train, subject_test)
rdata <- cbind(subject_all, Y_all, X_all)

# Now, we'll load the "dplyr" package which is useful making tidy data sets.
# If not installed, this script will install and load it instead of you.
if("dplyr" %in% rownames(installed.packages()) == FALSE) {install.packages("dplyr")}
library(dplyr)

# Changing rdata so that it's more easy to read
DT <- tbl_df(rdata)

# Extracts only the measurements on the mean and standard deviation for each measurement. 
DT2 <- select(DT, contains("mean"), contains("std"), -contains("meanFreq"), -contains("gravityMean"), -contains("AccMean"), Subject:Activity)

# appropriately labeling the data set with descriptive variable names. 
labels <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
for(i in 1:6){
  DT2$Activity <-gsub(i, labels[i], DT2$Activity)
}

# from the dataset just created, we'll create independent tidy data set with the average of each variable for each activity and each subject.
DT2$Subject <- factor(DT2$Subject)
DT2$Activity <- factor(DT2$Activity)
DT <- aggregate(DT2[,1:66], by = list(DT2$Subject, DT2$Activity), FUN = "mean")
colnames(DT)[1:2] <- c("Subject", "Activity")

# now let's clean the environment except DT
rm(list = c("DT2","f_name","f_names","features","i","labels","rdata","subject_all","subject_test","subject_train","X_all","X_test","X_train","Y_all","Y_test","Y_train"))

# Making the final tidy data set into .txt file
write.table(DT, file="./tidydata.txt", row.names=FALSE)

## FINISHED!
## when reading "tidydata.txt", don't forget to assign "header=TRUE"
