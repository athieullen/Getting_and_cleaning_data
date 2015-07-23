Getting and Cleaning Data Course Project
==========================================

This is a guide for the Course Project from the course "Getting and Cleaning data" available in Coursera.
This repository hosts the R code, readme file, code book file, and data outputs required for the evaluation.

Data used for this project comes from "Human Activity Recognition" database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
It can be downloaded [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Files included

* `run_analysis.R` - the R script file that contains all the code for the required tasks. It can be launch simply by opening the file in R. Package 'plyr' is needed to perform the analysis.
A test is performed in the beginning to detect if the data are already available in local repository, and download and store it in a folder called 'UCI HAR Dataset' if it is not the case.

* `tidy_data_set.txt` - the output data set required in step 5, uploaded in the course project's form.

* `CodeBook.md` - this file contains variables description, data, and any transformations or work that was performed to clean up the data.




