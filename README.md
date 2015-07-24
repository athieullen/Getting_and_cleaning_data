Getting and Cleaning Data Course Project 24/07/2015
===================================================

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

* A test is first performed to detect if the data are already available. It consists in searching a folder called
'UCI HAR Dataset' in the working directory defined by the function `getwd()`.
If this folder is not available, data are downloaded from URL, unzipped, and stored in the actual working directory.

## Data

Data used for this project comes from the _Human Activity Recognition database_ built from the recordings of 30 subjects
performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
It can be downloaded [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).