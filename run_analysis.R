
rm(list = ls()) ; gc()

require(plyr)

# Step 0 ------------------------------------------------------------------
# Load data from URL if not available and defin working directory

folder <- file.path(getwd(),"UCI HAR Dataset")

# Check if data folder already exists in local repo. If data are unavailable, download it
if(!file.exists(folder)){
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  temp <- tempfile()
  download.file(fileUrl,temp)
  unzip(temp, exdir = getwd())
  unlink(temp)
}

setwd(folder)

# Step 1 ------------------------------------------------------------------
# Merges the training and the test sets to create one data set

# Load dataset from train and test subdir
trainX <- read.table("train/X_train.txt")
trainY <- read.table("train/y_train.txt")
trainSub <- read.table("train/subject_train.txt")

testX <- read.table("test/X_test.txt")
testY <- read.table("test/y_test.txt")
testSub <- read.table("test/subject_test.txt")

# Merge respective train and test data sets and merged resulting data sets
df <- cbind(rbind(trainX, testX), rbind(trainSub, testSub), rbind(trainY, testY))

# Remove useless objects
rm(trainX,trainY,trainSub,testX,testY,testSub) ; gc()

# Step 2 ------------------------------------------------------------------
# Extracts only the measurements on the mean and standard deviation for each measurement 

# Load "features" file
Feat <- read.table("features.txt", stringsAsFactors = FALSE)

# Subset variables that correspond to mean and std
df <- df[,c(grep("-(mean|std)\\(\\)", Feat[,2]),tail(1:ncol(df),2))]

# Step 3 ------------------------------------------------------------------
# Uses descriptive activity names to name the activities in the data set

temp <- read.table("activity_labels.txt", stringsAsFactors = FALSE)
df[,ncol(df)] <- temp[df[,ncol(df)], 2]

# Step 4 ------------------------------------------------------------------
# Appropriately labels the data set with descriptive variable names. 

colnames(df) <- c(Feat[grep("-(mean|std)\\(\\)", Feat[,2]),2],"Subject","Activity")

# Step 5 ------------------------------------------------------------------
# From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject

dfAv <- ddply(df, .(Subject, Activity), function(x) colMeans(x[, 1:(ncol(df)-2)]))
write.table(dfAv, "tidy_data_set.txt", row.name=FALSE)


