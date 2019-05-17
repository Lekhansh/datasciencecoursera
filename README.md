# PEER REVIEW ASSIGNMENT: Getting a cleaning data course

This dataset includes the following files:

* `Readme.md`: Description of dataset and scripts.
* `Codebook.md`: Description of identifiers, variables.
* `Tidy.txt`: tidy dataset obtained by running `run_analysis.R`
* `run_analysis.R`: R script.

## Breif Description of the Original Data source 

The data is provided as a part of this assignment and is available at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip - automatic!

An understanding of the source and purpose of original data can be obtained from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones - automatic! and, from the Readme file downloaded along with the dataset. 
In summary, there are two similar datsets provided - train and test. Each dataset consists of numerous summary measures (like mean, SD, median) of raw observations obtained through a smartphone while subjects engaged in six types of activities. The data is normalised and is thus unitless.

## Task given in the assignment (verbatim):

To create one R script called run_analysis.R that does the following:

1.Merges the training and the test sets to create one data set.

2.Extracts only the measurements on the mean and standard deviation for each measurement.

3.Uses descriptive activity names to name the activities in the data set

4.Appropriately labels the data set with descriptive variable names.

5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps involved 

The R script does the following steps to fulfill the task:

1. Downloads and unzips the dataset in a new directory 'data'.
2. Reads in training and test datsets one after the other.
3. For each of them, applies two identifiers as new columns: subject ID and activity name.
4. Selects the mean and standard deviation variables and discards the others.
5. Merges the two datasets into a single dataset.
6. Melts the dataset made in step 5 around subject and activity identifiers.
7. Casts the dataset using mean such that each record pertains to the average value of measures for a unique subject-activity pair.
8. Formats the variable names to remove all punctuation characters and uppercases.
9. Appropriately labels the activity identifier.
10. Writes this tidy dataset in text file.

## Tidy data set

The dataset prepared in step 10 conforms to the priciples of tidy data as described as widely agreed upon in the research community (for example see: Hadley Wickham's paper on Tidy data at: https://vita.had.co.nz/papers/tidy-data.pdf - automatic!). The specific characteristics are:

1. Each column is a variable.

2. No column contains more than one variable and no variable is captured by two columns.

3. Each row is a unique observation: Each row is made unique by the combination of subject ID and activity. As a result while subject ID and activity themselves repeat there unique combination does not.

4. Information of only one type is contained in a table.

In summary, this dataset is in `long format` and can thus be easily used for downstream analyses.

NOTE: R version details: 3.6.0 running on Windows 10 64 bit


