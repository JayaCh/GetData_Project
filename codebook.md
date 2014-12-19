===========================================================
DATA DICTIONARY - TIDY DATA SET
===========================================================


### Experimental design
The experiments have been carried out with a group of 30 volunteers within an 
age bracket of 19-48 years. Each person performed six activities (WALKING, 
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer 
and gyroscope, we captured 3-axial linear acceleration and 3-axial angular 
velocity at a constant rate of 50Hz. The experiments have been video-recorded 
to label the data manually. The obtained dataset has been randomly partitioned 
into two sets, where 70% of the volunteers was selected for generating the 
training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying
noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 
50% overlap (128 readings/window). The sensor acceleration signal, which has 
gravitational and body motion components, was separated using a Butterworth 
low-pass filter into body acceleration and gravity. The gravitational force 
is assumed to have only low frequency components, therefore a filter with 
0.3 Hz cutoff frequency was used. From each window, a vector of features was 
obtained by calculating variables from the time and frequency domain.

### Raw data
To produce the tidy data set, we've started from the processed data sets 
available from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The raw data help files talk about features. A feature is a processed 
measurement. 

The relevant data files are:

1. 'features.txt': List of all features that were recorded in the 
                   X_{train|test}.txt data set.
2. 'activity_labels.txt': Links the activity labels with their activity name.
3. 'train/X_train.txt': Training set with measurements. Each column represents one 
   feature.
4. 'train/y_train.txt': Training activity labels. 
5. 'train/subject_train.txt': Each row identifies the subject who performed the 
   activity for each window sample. Its range is from 1 to 30. 
6. 'test/X_test.txt': Test set with measurements. Each column represents one 
   feature.
7. 'test/y_test.txt': Test activity labels.
8. 'test/subject_text.txt': Each row identifies the subject who performed the 
   activity for each window sample. Its range is from 1 to 30.

### Tidy data
Following clean up of data has been performed:

1. Read the subject_train.txt, X_train.txt, Y_train.txt and subject_test.txt, X_test.txt, Y_test.txt files. Row bind the training and the test sets to create single data set, single subject ids data and single activities data.

2. Read the features.txt, and get the row indices for only measurements on the mean and standard deviation for each measurement. Using this row indices vector, subset the data set columns.

3. Read the activity_labels.txt and change the activity in the data set from numeric to factor levels using data.table functions.

4. Appropriately labels the data set with descriptive variable names by following the principles of naming tidy data variable names. Create a merged data table that contains the subject ids, activities factor levels and the sub setted data.

5. Using ddply function, from the merged data created at step 4, calculate the column wise mean for all the measured variables that are grouped by subject ids and activity. Write this tidy data to the tidydata.txt file row.name = FALSE and default seperator.


### Variable names

All the features are normalised values bounded within [-1,1] and hence contain no units. In the variable names 'f' indicate frequency domain signals and 't' indicate time domain signals.

**subject**
Subject id from 1 to 30

   * subject

**activity**
Factor with 6 values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, 
STANDING, LAYING

   * activity

**BodyAcc**
The time domain acceleration data was seperated into *body and gravity acceleration 
signals*. The measurements are made along X, Y and Z axes. The tidy data set contains average of the mean (Mean) and standard deviation (Std), grouped by subject and activity. 

   * tBodyAccMeanX
   * tBodyAccMeanY
   * tBodyAccMeanZ
   * tBodyAccStdX
   * tBodyAccStdY
   * tBodyAccStdZ
   
**GravityAcc**
The time domain acceleration data was seperated into *body and gravity acceleration 
signals*. The measurements are made along X, Y and Z axes. The tidy data set contains average of the mean (Mean) and standard deviation (Std), grouped by subject and activity. 

   * tGravityAccMeanX
   * tGravityAccMeanY
   * tGravityAccMeanZ
   * tGravityAccStdX
   * tGravityAccStdY
   * tGravityAccStdZ
   
**BodyAccJerk**
To obain Jerk signals, *body linear acceleration* in the time domain is derived along the X, Y and Z axes. The tidy data set contains average of the mean (Mean) and standard deviation (Std), grouped by subject and activity. 

   * tBodyAccJerkMeanX
   * tBodyAccJerkMeanY
   * tBodyAccJerkMeanZ
   * tBodyAccJerkStdX
   * tBodyAccJerkStdY
   * tBodyAccJerkStdZ

**BodyGyro**
The measurements of *time domain gyroscope* data are made along X, Y and Z axes. The tidy data set contains average of the mean (Mean) and standard deviation (Std), grouped by subject and activity.

   * tBodyGyroMeanX
   * tBodyGyroMeanY
   * tBodyGyroMeanZ
   * tBodyGyroStdX
   * tBodyGyroStdY
   * tBodyGyroStdZ    
   
**BodyGyroJerk**
To obain Jerk signals, the *angular velocity* is derived in the time domain along the X, Y and Z axes. The tidy data set contains average of the mean (Mean) and standard deviation (Std), grouped by subject and activity.

   * tBodyGyroJerkMeanX
   * tBodyGyroJerkMeanY
   * tBodyGyroJerkMeanZ
   * tBodyGyroJerkStdX
   * tBodyGyroJerkStdY
   * tBodyGyroJerkStdZ
  
**Mag**
The *magnitude of the 3 three-dimensional signals* are calculated using the Euclidean norm. The tidy data set contains average of the mean (Mean) and standard deviation (Std), grouped by subject and activity. 

   * tBodyAccMagMean
   * tBodyAccMagStd
   * tGravityAccMagMean
   * tGravityAccMagStd
   * tBodyAccJerkMagMean
   * tBodyAccJerkMagStd
   * tBodyGyroMagMean
   * tBodyGyroMagStd
   * tBodyGyroJerkMagMean
   * tBodyGyroJerkMagStd

**f**
The next set of variables are the *frequency domain signals*, obtained by 
passing the time domain data described above through a Fast Fourier Transform 
(FFT). For a more detailed description of each of the variables, see the 
corresponding time domain variables above. 

   * fBodyAccMeanX
   * fBodyAccMeanY
   * fBodyAccMeanZ
   * fBodyAccStdX
   * fBodyAccStdY
   * fBodyAccStdZ
   * fBodyAccJerkMeanX
   * fBodyAccJerkMeanY
   * fBodyAccJerkMeanZ
   * fBodyAccJerkStdX
   * fBodyAccJerkStdY
   * fBodyAccJerkStdZ
   * fBodyGyroMeanX
   * fBodyGyroMeanY
   * fBodyGyroMeanZ
   * fBodyGyroStdX
   * fBodyGyroStdY
   * fBodyGyroStdZ
   * fBodyAccMagMean
   * fBodyAccMagStd
   * fBodyAccJerkMagMean
   * fBodyAccJerkMagStd
   * fBodyGyroMagMean
   * fBodyGyroMagStd
   * fBodyGyroJerkMagMean
   * fBodyGyroJerkMagStd