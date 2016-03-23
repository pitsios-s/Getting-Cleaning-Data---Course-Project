# Code Book

### Source Data
A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Attribute Information
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### Transformations
After we read the training and testing dataset, we combine them in order to create a bigger one.
After that, we keep only those measurements that include means and standard deviations, as weel as the subject's id and the type of the activity.

The attributes that we finally have, are the following:

`subject`
`activity`
`tBodyAcc-mean()-X`
`tBodyAcc-mean()-Y`
`tBodyAcc-mean()-Z`
`tBodyAcc-std()-X`
`tBodyAcc-std()-Y`
`tBodyAcc-std()-Z`
`tGravityAcc-mean()-X`
`tGravityAcc-mean()-Y`
`tGravityAcc-mean()-Z`
`tGravityAcc-std()-X`
`tGravityAcc-std()-Y`
`tGravityAcc-std()-Z`
`tBodyAccJerk-mean()-X`
`tBodyAccJerk-mean()-Y`
`tBodyAccJerk-mean()-Z`
`tBodyAccJerk-std()-X`
`tBodyAccJerk-std()-Y`
`tBodyAccJerk-std()-Z`
`tBodyGyro-mean()-X`
`tBodyGyro-mean()-Y`
`tBodyGyro-mean()-Z`
`tBodyGyro-std()-X`
`tBodyGyro-std()-Y`
`tBodyGyro-std()-Z`
`tBodyGyroJerk-mean()-X`
`tBodyGyroJerk-mean()-Y`
`tBodyGyroJerk-mean()-Z`
`tBodyGyroJerk-std()-X`
`tBodyGyroJerk-std()-Y`
`tBodyGyroJerk-std()-Z`
`tBodyAccMag-mean()`
`tBodyAccMag-std()`
`tGravityAccMag-mean()`
`tGravityAccMag-std()`
`tBodyAccJerkMag-mean()`
`tBodyAccJerkMag-std()`
`tBodyGyroMag-mean()`
`tBodyGyroMag-std()`
`tBodyGyroJerkMag-mean()`
`tBodyGyroJerkMag-std()`
`fBodyAcc-mean()-X`
`fBodyAcc-mean()-Y`
`fBodyAcc-mean()-Z`
`fBodyAcc-std()-X`
`fBodyAcc-std()-Y`
`fBodyAcc-std()-Z`
`fBodyAccJerk-mean()-X`
`fBodyAccJerk-mean()-Y`
`fBodyAccJerk-mean()-Z`
`fBodyAccJerk-std()-X`
`fBodyAccJerk-std()-Y`
`fBodyAccJerk-std()-Z`
`fBodyGyro-mean()-X`
`fBodyGyro-mean()-Y`
`fBodyGyro-mean()-Z`
`fBodyGyro-std()-X`
`fBodyGyro-std()-Y`
`fBodyGyro-std()-Z`
`fBodyAccMag-mean()`
`fBodyAccMag-std()`
`fBodyBodyAccJerkMag-mean()`
`fBodyBodyAccJerkMag-std()`
`fBodyBodyGyroMag-mean()`
`fBodyBodyGyroMag-std()`
`fBodyBodyGyroJerkMag-mean()`
`fBodyBodyGyroJerkMag-std()`

### Tidy Dataset
Finally, we create a new dataset that contains the means of all the numeric variables of the merged dataset, grouped by the subject's id and the actvity type. This dataset is saved as `tidy.txt`.