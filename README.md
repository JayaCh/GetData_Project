==================================================================
Getting and Cleaning Data - Project
Version 1.0
==================================================================


## Original Data:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Tidydata :

The following steps have been performed by the code in run_analysis.R to prepare the tidy data

1. Read the subject_train.txt, X_train.txt, Y_train.txt and subject_test.txt, X_test.txt, Y_test.txt files. Row bind the training and the test sets to create single data set, single subject ids data and single activities data.

2. Read the features.txt, and get the row indices for only measurements on the mean and standard deviation for each measurement. Using this row indices vector, subset the data set columns.

3. Read the activity_labels.txt and change the activity in the data set from numeric to factor levels using data.table functions.

4. Appropriately labels the data set with descriptive variable names by following the principles of naming tidy data variable names. Create a merged data table that contains the subject ids, activities factor levels and the sub setted data.

5. Using ddply function, from the merged data created at step 4, calculate the column wise mean for all the measured variables that are grouped by subject ids and activity. Write this tidy data to the tidydata.txt file row.name = FALSE and default seperator.


# The dataset includes the following files

- `README.md`
- `run_analysis.R`: contains the R code to clean the original data and write the tidy data to a text file
- `codebook.md`: data to indicate all the variables and summaries calculated, along with units
- 'tidydata.txt': the output text file

Notes: 
======
- The data from the tidydata.txt can be read by standard read r functions.
- The tidydata.txt contains 180 observations of 68 variables. The 180 observations are 6 distinct activity observations for all 30 subjects( 6 activities * 30 subjects = 180 observations)
- Other than subject ids and activity factor level, there are 66 variables that contain the mean of that measured variable group by subject and activity.
- The 66 distinct variables comes from mean and standard deviation of 8 variables with 3 axis values, and 9 variables with magnitudes.((8 * 3 + 9) * 2 = 66 ).
