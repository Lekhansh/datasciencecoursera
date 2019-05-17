##################### Set up #################################################
if (!dir.exists("Data")) {
    dir.create("Data")
}
file.url <-
    "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file.name <- "dataset.zip"
download.file(url = file.url, destfile = paste("Data/", file.name))
setwd("Data")
unzip(" dataset.zip")
if (!file.exists("UCI HAR Dataset")) {
    print("Files could not be unzipped, please do manually")
}
else
    print("Files successfuly unzipped")

packages_required <-
    list("dplyr", "tidyverse", "reshape2", "stringr")
lapply(packages_required, require, character.only = TRUE)
###################### Task number 1: Merge the training and task sets #########
train <- read.table(file = "Data/UCI HAR Dataset/train/X_train.txt")
# Applying feature labels as column names
feature_labels <-
    read.table(file = "Data/UCI HAR Dataset/features.txt")
feature_labels <- feature_labels$V2
colnames(train) <- feature_labels
# features required
pattern <- "mean|std"
x <- grepl(pattern = pattern,
    x = feature_labels,
    ignore.case = TRUE)
feature_labels[x] # logical vector length = 561
train <- train[, x] # subset all rows but selected columns
# Putting activity labels
activity_values <-
    read.table(file = "Data/UCI HAR Dataset/train/Y_train.txt") # same length as nrows train
activity_labels <-
    read.table(file = "Data/UCI HAR Dataset/activity_labels.txt") # 6 levels and labels
activity_values <- as.character(activity_values$V1)
activity_values <- factor(activity_values,
    levels = activity_labels$V1, labels = activity_labels$V2) # converted to factor with labels
train <-
    cbind(activity_values, train) # added to the dataset as the first column
# Applying subject ID
subject <-
    read.table(file = "Data/UCI HAR Dataset/train/subject_train.txt")[, 1]
train <-
    cbind(subject, train) # added to the dataset as the first column
# Reading the test data
test <- read.table(file = "Data/UCI HAR Dataset/test/X_test.txt")
colnames(test) <-
    feature_labels # colnames and sequence is same for the two sets
test <- test[, x] # selecting desired columns only
activity_values <-
    read.table(file = "Data/UCI HAR Dataset/test/Y_test.txt") # same length as nrows test
activity_values <- as.character(activity_values$V1)
activity_values <- factor(activity_values,
    levels = activity_labels$V1, labels = activity_labels$V2) # six levels and labels are same for the two sets
test <- cbind(activity_values, test)
subject <-
    read.table(file = "Data/UCI HAR Dataset/test/subject_test.txt")[, 1]
test <- cbind(subject, test)
################ Task 2: Merge the two datasets #####################################
dat <- rbind(train, test)
remove("train", "test")
################ Task 3: Descriptive variable names #################################
cnames <-
    names(dat) # using a seperate vector to apply regex which will be then used as new cnames

pattern <-
    "[[:punct:]]" # regex for all punctuation characters i.e '-','_' etc.
rplc <- ""
cnames <-
    gsub(cnames, pattern = pattern, replacement = rplc) # removes all punctuation characters
cnames <- tolower(cnames) # all albhabets to lower case
colnames(dat) <-
    cnames # colnames of dat changed to these descriptive and formatted names
colnames(dat)[2] <-
    "activity" # was earlier activitylabels which is reduntant
dat$activity <-
    tolower(dat$activity) # activity labels also converted to lower case
dat$activity <-
    gsub(dat$activity, pattern = pattern, replacement = rplc) # and punctuations removed
########## Create a new tidy data set: average values of each variable for each subject-activity pair ##
dat$subject <- as.factor(dat$subject)
dat$activity <- as.factor(dat$activity)
dat1 <-
    melt(dat, id = c("subject", "activity")) # melt the data frame using subject and activity as id
dat1 <-
    dcast(data = dat1, subject + activity ~ variable, mean) # apply the function mean to margin of subject activity pair
write.table(dat1,
    file = "tidy.txt",
    quote = FALSE,
    row.names = FALSE) # write a txt file to working directory
