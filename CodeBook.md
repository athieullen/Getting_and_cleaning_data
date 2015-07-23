# R code
===========

The script `run_analysis.R` performs the 5 steps described in the course project's definition.

* Step 0: a test is performed on working directory. If folder `UCI HAR Dataset` already exists, set it as workind directory. Otherwise download data and extract .zip file into working directory.

* Step 1: sensor variables, labels, and subjects data are respectively load into R and merged for training and test sets using `rbind()` function. These data sets are then merged into a single global data set using `cbind()` function. Useless objects (single data files) are then removed to save memory.

* Step 2: columns with the mean and standard deviation measures are identified according the file `features.txt`.

* Step 3: extract activity names and IDs from the file `activity_labels.txt` and replace activity IDs in the dataset by correponding labels.

* Step 4: name data set columns according `features.txt` file and selected features at step 2, and correct subjects and activities column names.

* Step 5: generate the tidy dataset with all the average measures for each subject and activity type. The output file is called `tidy_data_set.txt` and contains 180 rows (30 subjects * 6 activities) and all the 68 variables.

# R objects
===========

* `trainX`, `trainY`, `trainSub` contain the training data from the downloaded files.
* `testX`, `testY`, and `testSub` contain the test data from the downloaded files.
* `df` is the main data frame resulting after merging respectively `X`, `Y`, and `Sub` datasets from train and test folders.
* `Feat` contains the correct names for the sensor data, which are used to select mean and std columns and correctly rename `df` columns.
* `Acts` contains the correct names for the activities performed by subjects, which are used to replace numeric values with correct labels. 
* `dfAv` contains the averages of sensor variables stored in `df`, which will be later stored in the `tidy_data_set.txt` file. `ddply()` from the plyr package is used to apply `colMeans()`.

# Original variables
===========

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix "t" to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:
"-XYZ" is used to denote 3-axial signals in the X, Y and Z directions.

*tBodyAcc-XYZ
*tGravityAcc-XYZ
*tBodyAccJerk-XYZ
*tBodyGyro-XYZ
*tBodyGyroJerk-XYZ
*tBodyAccMag
*tGravityAccMag
*tBodyAccJerkMag
*tBodyGyroMag
*tBodyGyroJerkMag
*fBodyAcc-XYZ
*fBodyAccJerk-XYZ
*fBodyGyro-XYZ
*fBodyAccMag
*fBodyAccJerkMag
*fBodyGyroMag
*fBodyGyroJerkMag

The set of variables that were estimated from these signals and kept in the data frame `df` are: 
*mean(): Mean value
*std(): Standard deviation

The other variables are:
* `Subject` represents the ID of the subject who performed the activity for each window sample, expressed as an integer value from 1 to 30.
* `Activity` is the ID, expressed as a character string", of the activity performed by each subject and associated with each measurement. 6 different activities are present here.

# Output variables
===========

Variables stored in the data frame `dfAv` and in `tidy_data_set.txt` output consists in the previous original features, averaged by Subject and Activity values.
