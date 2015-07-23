# R code

The script `run_analysis.R` performs the 5 steps described in the course project's definition.

* Step 0: a test is performed on working directory. If folder `UCI HAR Dataset` already exists, set it as workind directory. Otherwise download data and extract .zip file into working directory.

* Step 1: sensor variables, labels, and subjects data are respectively load into R and merged for training and test sets using `rbind()` function. These data sets are then merged into a single global data set using `cbind()` function. Useless objects (single data files) are then removed to save memory.

* Step 2: columns with the mean and standard deviation measures are identified according the file `features.txt`.

* Step 3: extract activity names and IDs from the file `activity_labels.txt` and replace activity IDs in the dataset by correponding labels.

* Step 4: name data set columns according `features.txt` file and selected features at step 2, and correct subjects and activities column names.

* Step 5: generate the tidy dataset with all the average measures for each subject and activity type. The output file is called `averages_data.txt` and contains 180 rows (30 subjects * 6 activities) and all the 68 variables.

# Variables

* `x_train`, `y_train`, `subject_train` contain the training data from the downloaded files.
* `x_test`, `y_test`, and `subject_test` contain the test data from the downloaded files.
* `df` is the main data frame resulting after merging respectively `x`, `y`, and `subject` datasets from train and test folders.
* `features` contains the correct names for the sensor data, which are used to select mean and std columns and correctly rename `df` columns.
* `activities` contains the correct names for the activities performed by subjects, which are used to replace numeric values with correct labels. 
* `dfAv` contains the relevant averages which will be later stored in the `tidy_data_set.txt` file. `ddply()` from the plyr package is used to apply `colMeans()`.