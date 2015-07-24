Getting and Cleaning Data Course Project
========================================

This is a guide for the Getting and Cleaning data Course Project, from the course "Getting and Cleaning data"
available in Coursera.

## Files included

* This readme file.

* The R script file **run_analysis.R** that contains all the code for the required tasks. This was developped and tested 
with R version 3.2.1 (2015-06-18) and RStudio version 0.99.441 on a Windows 7 64-bits platform.

* The data set **tidy\_data\_set.txt**. This is the output of the script **run_analysis.R**, required in the step 5
of the Course Project.

* The file **CodeBook.md** that provides information about the layout of the data set, the variables and their
definitions, any units of measurement.
It also contains any transformations or work that was performed to clean up the data.


## Instructions

* The R script can be launch simply by opening the file using R, or any IDE like RStudio.

* The script requires the R package `plyr` to be installed to perform step 5.

* A test is first performed to detect if the data are already available. It consists in searching into the working 
directory defined by the function `getwd()` a folder called "_UCI HAR Dataset_".
If this folder is not available, data are downloaded from URL, unzipped, and stored in the actual working directory.

## Description of R code

The script **run_analysis.R** is structured in 6 different steps.

* Step 0: a test is performed on working directory. If folder "_UCI HAR Dataset_" already exists, set it as working directory.
Otherwise download data and extract .zip file into actual working directory.

* Step 1: sensor variables, labels, and subjects data are respectively load into R and merged for training and test sets 
using `rbind()` function. These data sets are then merged into a single global data set using `cbind()` function.
Useless objects (single data files) are then removed to save memory.

* Step 2: columns with the mean and standard deviation measures are identified according the file **features.txt**.

* Step 3: extract activity names and IDs from the file **activity_labels.txt** and replace activity IDs in the dataset 
by correponding labels.

* Step 4: name data set columns according **features.txt** file and selected features at step 2, and correct subjects and 
activities column names.

* Step 5: generate the tidy dataset with all the average measures for each subject and activity type. The output file is 
called **tidy_data_set.txt** and contains 180 rows (30 subjects * 6 activities) and all the 68 variables.

## Data

Data used for this project comes from the _Human Activity Recognition database_ built from the recordings of 30 subjects
performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
It can be downloaded [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).