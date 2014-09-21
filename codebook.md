Introduction

=========================


One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.


The goal of this progect was to prepare tidy data that can be used for later analysis.

R script "run_analysis.R" does the following. 
1. Merges the training and the test sets to create one data set. 
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set 
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Raw data :
Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
Triaxial Angular velocity from the gyroscope.
A 561-feature vector with time and frequency domain variables.
Its activity label.
An identifier of the subject who carried out the experiment.

Processed data : 
average of the measurements on the mean and standard deviation for each measurement are reported on the data sets. respectively for each activity and each subject.



Variables
=====================

Subject
==================
Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

Activity
=================
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING
Features



Only the mean value (mean) and standard deviation (std) are reported on the data sets.

 [1] "tBodyAcc.mean...X"           "tBodyAcc.mean...Y"           "tBodyAcc.mean...Z"          
 [4] "tGravityAcc.mean...X"        "tGravityAcc.mean...Y"        "tGravityAcc.mean...Z"       
 [7] "tBodyAccJerk.mean...X"       "tBodyAccJerk.mean...Y"       "tBodyAccJerk.mean...Z"      
[10] "tBodyGyro.mean...X"          "tBodyGyro.mean...Y"          "tBodyGyro.mean...Z"         
[13] "tBodyGyroJerk.mean...X"      "tBodyGyroJerk.mean...Y"      "tBodyGyroJerk.mean...Z"     
[16] "tBodyAccMag.mean.."          "tGravityAccMag.mean.."       "tBodyAccJerkMag.mean.."     
[19] "tBodyGyroMag.mean.."         "tBodyGyroJerkMag.mean.."     "fBodyAcc.mean...X"          
[22] "fBodyAcc.mean...Y"           "fBodyAcc.mean...Z"           "fBodyAccJerk.mean...X"      
[25] "fBodyAccJerk.mean...Y"       "fBodyAccJerk.mean...Z"       "fBodyGyro.mean...X"         
[28] "fBodyGyro.mean...Y"          "fBodyGyro.mean...Z"          "fBodyAccMag.mean.."         
[31] "fBodyBodyAccJerkMag.mean.."  "fBodyBodyGyroMag.mean.."     "fBodyBodyGyroJerkMag.mean.."
[34] "tBodyAcc.std...X"            "tBodyAcc.std...Y"            "tBodyAcc.std...Z"           
[37] "tGravityAcc.std...X"         "tGravityAcc.std...Y"         "tGravityAcc.std...Z"        
[40] "tBodyAccJerk.std...X"        "tBodyAccJerk.std...Y"        "tBodyAccJerk.std...Z"       
[43] "tBodyGyro.std...X"           "tBodyGyro.std...Y"           "tBodyGyro.std...Z"          
[46] "tBodyGyroJerk.std...X"       "tBodyGyroJerk.std...Y"       "tBodyGyroJerk.std...Z"      
[49] "tBodyAccMag.std.."           "tGravityAccMag.std.."        "tBodyAccJerkMag.std.."      
[52] "tBodyGyroMag.std.."          "tBodyGyroJerkMag.std.."      "fBodyAcc.std...X"           
[55] "fBodyAcc.std...Y"            "fBodyAcc.std...Z"            "fBodyAccJerk.std...X"       
[58] "fBodyAccJerk.std...Y"        "fBodyAccJerk.std...Z"        "fBodyGyro.std...X"          
[61] "fBodyGyro.std...Y"           "fBodyGyro.std...Z"           "fBodyAccMag.std.."          
[64] "fBodyBodyAccJerkMag.std.."   "fBodyBodyGyroMag.std.."      "fBodyBodyGyroJerkMag.std.." 


The script run_analysis.R
===========
"run_analysis" is a code that can be run as long as the Samsung data is in your working directory. 
The output should be the tidy data set you "tidydata.txt".

It merges the training and test sets to create one data set, 
replaces activity values in the dataset with descriptive activity names, 
extracts only the measurements (features) on the mean and standard deviation for each measurement, 
appropriately labels the columns with descriptive names, 
creates a second, independent tidy dataset with an average of each variable for each each activity and each subject.
In other words, same type of measurements for a particular subject and activity are averaged into one value and the tidy data set contains these mean values only. 
The processed tidy data set is also exported as .txt file.

