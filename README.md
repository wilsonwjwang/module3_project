Getting and Cleaning Data
=========================

This is a repository for any and all code written for the Getting and Cleaning Data Coursera course through Johns Hopkins University.

## Course Project
(find all project-related materials in the UCI HAR Dataset directory, however, copies of the important files have been put into this main directory to fulfill the submission requirement)

* Unzip the source (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into a folder on your local drive, eg. "\Users\yourname\"

* Put run_analysis.R into "\Users\yourname\"

* In RStudio: setwd("\Users\yourname\"), followed by: source("run_analysis.R")

* Use data <- read.table("cleandat_average.txt") to read the data. There are 30 subjects and 6 activities. For each activity with each subject means 30 * 6 = 180 rows in the data set.