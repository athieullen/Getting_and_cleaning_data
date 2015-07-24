CodeBook 
========

This file provides information about the layout of the data sets, the variables, their definitions,
and units of measurement.

It also contains any transformations or work that was performed to clean up the data.


# Description of R objects

* `trainX`, `trainY`, `trainSub` contain the training data from the downloaded files.
* `testX`, `testY`, and `testSub` contain the test data from the downloaded files.
* `df` is the main data frame resulting after merging respectively `X`, `Y`, and `Sub` datasets from train and test folders.
It is made of the raw data extracted from the downloaded files.
* `Feat` contains the correct names for the sensor data, which are used to select mean and std columns and correctly rename `df` columns.
* `Acts` contains the correct names for the activities performed by subjects, which are used to replace numeric values with correct labels. 
* `dfAv` contains the averages of sensor variables stored in `df`, which will be later stored in the **tidy_data_set.txt** file.
`ddply()` from the package `plyr` is used to apply the function `colMeans()` on each variable of data set `df`, by subject and activities.

# Original features

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals _tAcc-XYZ_ and _tGyro-XYZ_.

"-XYZ" is used to denote 3-axial signals in the X, Y and Z directions.

These time domain signals (prefix "t" to denote time) were captured at a constant rate of 50 Hz.

Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.

Similarly, the acceleration signal was then separated into body and gravity acceleration signals (_tBodyAcc-XYZ_ and _tGravityAcc-XYZ_) 
using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (_tBodyAccJerk-XYZ_ and _tBodyGyroJerk-XYZ_).
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (_tBodyAccMag_, _tGravityAccMag_, _tBodyAccJerkMag_, _tBodyGyroMag_, _tBodyGyroJerkMag_). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing _fBodyAcc-XYZ_, _fBodyAccJerk-XYZ_, _fBodyGyro-XYZ_, _fBodyAccJerkMag_, 
_fBodyGyroMag_, _fBodyGyroJerkMag_. (Note the "f" to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:

* _tBodyAcc-XYZ_
* _tGravityAcc-XYZ_
* _tBodyAccJerk-XYZ_
* _tBodyGyro-XYZ_
* _tBodyGyroJerk-XYZ_
* _tBodyAccMag_
* _tGravityAccMag_
* _tBodyAccJerkMag_
* _tBodyGyroMag_
* _tBodyGyroJerkMag_
* _fBodyAcc-XYZ_
* _fBodyAccJerk-XYZ_
* _fBodyGyro-XYZ_
* _fBodyAccMag_
* _fBodyAccJerkMag_
* _fBodyGyroMag_
* _fBodyGyroJerkMag_

The set of variables that were estimated from these signals and kept in the data frame `df` are: 

* _mean()_: Mean value
* _std()_: Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the _angle()_ variable:

* _gravityMean_
* _tBodyAccMean_
* _tBodyAccJerkMean_
* _tBodyGyroMean_
* _tBodyGyroJerkMean_

# Transformations performed

Each original measurement is related to a subject and an activity originally expressed in separate files as an integer numeric value.

A transformation is performed to add two more features to the main dataset `df`: 

* `Subject` represents the ID of the subject who performed the activity for each window sample, expressed as an integer value from 1 to 30.
* `Activity` is the ID, expressed as a character string", of the activity performed by each subject and associated with each measurement. 6 different activities are present here.

The output of the R script is a second dataset called `dfAv`, stored in a .txt file called **tidy_data_set.txt**.
Variables stored in the data frame `dfAv` and in  output consists in the previous original features, averaged by Subject and Activity values.


